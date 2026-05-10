---
title: Replacing a 3 GB SQLite database with a 10 MB FST (finite state transducer) binary
date: 2026-05-10
tags:
- against-entropy
- simple-suboptimal-solutions
- worse-is-better
- finnish
- data-structures-and-algorithms
- cost-optimization
- rust
- fst
---

_Note for
[numberphiles](https://www.youtube.com/watch?v=aOJOfh2_4PE):
all numbers have been rounded to their first significant
digit, because I'm a fan of Rob Eastaway's
["zequals" method](https://robeastaway.com/blog/introducing-zequals)
of getting to the point when it comes to estimation. It's much
more valuable to walk away with the heuristic "some dude got
a 300x memory reduction by swapping out a database he hacked
together for a tiny, static, specialized data structure that
does exactly what he needs it to and no more."_

I found myself with an increasingly rare opportunity to work
this weekend on
[Taskusanakirja](https://taskusanakirja.com/),
also often called `tsk`,
a Finnish-English dictionary with incremental search-as-you-type.[^1]
Fundamentally this problem reduces down to
[prefix search](https://en.wikipedia.org/wiki/Trie),
and the canonical solution for prefix search with autocomplete
is to implement
[a trie](https://www.baeldung.com/cs/tries-prefix-trees).

And this worked wonderfully for the first implementation
of `tsk`, which was in Go (and which I have written about
[elsewhere](/posts/you-don-t-need-cgo-to-use-sqlite-in-your-go-binary/)
and [elsewhere](/posts/cross-platform-tuis-are-easier-than-cross-platform-guis/)
and [elsewhere](/posts/the-highest-personal-roi-program-i-have-written-so-far/)).
With a few basic optimizations.
To prevent matching on some single-digit percentage of the
mid-six-figures number of words we were baking into the
binary (it's been a design goal from the start to ship the
entire program as *one* `.exe`, *one* `.app`, or *one*
statically linked binary), we set some limit of e.g. only the
first 50 or 100 matches or so and then just memoized all
of the 1-, 2-, and 3-character combinations, after which
I've never noticed a perceptible delay in the
program again after a year of heavy personal use. We could
just about squeeze a trie with some basic optimizations
like that into ~60 MB of space.

But Finnish is a heavily
[agglutinative](https://en.wikipedia.org/wiki/Agglutinative_language)
language. It's not
impossible for a single base word in the language to have
over one hundred possible endings, when all combinations
are considered. And the combinations are not regular![^2] The
extremely regularized orthography of the Finnish language
*also* means no fibbing when it comes to what speakers
*actually* say on the page, and that means that base words
stretch and shift and transmute in acoustically-pleasing
ways as you layer on endings, which makes perfect sense
*after* you've spent a couple years already immersed in
the language. When you're a beginner, and you see a
sentence like e.g. "Opiskelijassammekin on leijonan sydän",
there is one word you are disproportionately likely to
get stuck on. Part of what this tool attempts to do is
help the student figure out how to *cleave* the word at
the right edges by embedding all that information as well.

The trie fell down at that point. I could keep ~400,000
items in the trie sipping ~50 MB of RAM.
The same trick does not scale to 40-60 million. Not if you want
it all to run on the old laptop of a college kid from Jakarta.
Frustrated and running out of time, I threw up my hands and
said "We'll ship the inflections in a separate
SQLite database with FTS (Full Text Search) and
let them search on that if they're so desperate," which
*worked* — still without perceptible delay — but it required
a one time 3 gigabyte download. Not ideal!

That was where the story stopped about 9 months ago. This
weekend, with 9 more months of intense full time software
engineering under my belt, I boldly asked:
[Had I considered rewriting it in Rust?](https://transitiontech.ca/random/RIIR)[^3]

It turns out there is a *very, very* smart guy named
[BurntSushi aka Andrew Gallant](https://github.com/BurntSushi),
infamous for
[ripgrep, a really really fast grep](https://github.com/BurntSushi/ripgrep) —
a tool so ubiquitously useful
[I put it years ago in my "Holy Trinity" of modern shell commands](https://github.com/hiAndrewQuinn/shell-bling-ubuntu#the-holy-trinity) —
who *also* faced a similar problem
at some point in the past, and wrote a post called
[Index 1,600,000,000 Keys with Automata and Rust](https://burntsushi.net/transducers/).
(Warning: long, extremely interesting.)
The opening spoils it:

> It turns out that finite state machines are useful for things other than expressing computation. Finite state machines can also be used to compactly represent ordered sets or maps of strings that can be \[prefix, fuzzy, suffix\] searched very quickly.

Well, I thought, this seems promising. Let's write
a minimal Rust program to strip the data out of that
3 GB database and compact it down into one of these
FST thingies.[^4] I mean, it was always obvious that was
a hack, but it was the best hack I could manage with
the time and energy at the time. How small could we
get it?

**Ten _mega_bytes.** A 300x reduction in space.
Even in the world of [`fst` crate](https://docs.rs/fst/) users,
this particular application — mapping conjugations
and declensions of a highly agglutinative language
back to their source definitions — was extremely
well suited to the domain. Unlike tries, FSTs compress
*both* prefixes *and* suffixes, and in a language like
Finnish, there are a very small handful of popular
suffixes which get repeated extremely often in
the dictionary corpus. The data load is static
at runtime, which gets around `fst`'s greatest
weakness.

I do wish to point out, of course, that the whole
reason it was possible to experiment cheaply and come
across this serendipity was because 9 months ago,
faced with the choice to either do the bad easy thing
or the good nothing, I chose to do the bad easy thing.[^5]
The SQLite database worked! I *understood*
how it worked, behind the scenes with its B-trees and its
[Full Text Search extension](https://www.sqlite.org/fts5.html). I think I even used that same
FTS extension to power certain lesser used features that
are *not* in the alphas of `tsk v2.0.0` at the time being
and are likely to be dropped entirely if it means compromising
this now salivatory memory footprint.

Because the Pro version of
`v2` is shaping up to be about 20 megabytes, all batteries
included, which is 3 times less than the free version of `v1`
ever was. We'll see what makes it past the cutting room in
time.

[^1]: `tsk` started life as a TUI Go program — and in fact evolved out of an earlier `fzf` prototype called `finstem`, see [the highest-ROI program I've written so far](/posts/the-highest-personal-roi-program-i-have-written-so-far/). The "pocket dictionary" framing (*taskusanakirja* literally means "pocket dictionary" in Finnish) was always load-bearing: if it doesn't fit on the kind of dusty laptop someone might inherit from an uncle, it isn't a *pocket* dictionary, it's an old Oxford that happens to compile.

[^2]: Linguists call the deformations triggered by suffixes [consonant gradation](https://en.wikipedia.org/wiki/Consonant_gradation) and [vowel harmony](https://en.wikipedia.org/wiki/Vowel_harmony), and Finnish wields both at once. Take *katu* ("street"), whose genitive is not *katun* but *kadun* — the `t` softens to `d` because the syllable closed. Multiply that across 15 cases, then 2 plurals, then 6 possessive suffixes, then some indetermintate amount of possible clitics, and you can see why a naïve trie capitulates. It simply has no way to share the cost of the *thousands* of words that all end in `-ssa-mme-kin` ("in- our [X]-, as well").

[^3]: "Rewrite It In Rust" is enough of a meme that there is an entire genre of blog posts pushing back on it. One honest version of the meme is something like: If your problem is in the intersection of "needs to be fast", "needs to be portable", and "the existing tooling has gnarly memory ergonomics", Rust might put you in clover.

[^4]: The trick that makes FSTs so much more compact than tries on natural-language data is *suffix sharing*: a trie shares prefixes (so `kadun` and `kaduille` share their first three nodes) but stores every distinct suffix path independently, while a [minimal acyclic deterministic finite-state automaton](https://en.wikipedia.org/wiki/Deterministic_acyclic_finite_state_automaton) merges any two subtrees that are structurally identical. For a corpus where 100,000 words all end in the same dozen inflectional patterns, this is a license to print memory.

[^5]: This is a recurring shape to my notes here that I keep bumping into qua ["it's okay to solve a problem twice"](/posts/it-s-okay-to-solve-a-problem-twice/). One could say in the first quarter-century of my life, that while I was always fascinated by programming, I could never overcome the guilt of not really knowing whether the tool I am building right now isn't already superceded by some much better implementation someone else has already written 30 or 40 years ago; I could write a TSV-aware search and replace, or I could find out about `awk` and solve that entire class of problems in one fell swoop, for example. My central conceit is that *this is a trap*. You *need* to reinvent a couple of wheels to get to the edge of what we know about wheel-making, not a thousand wheels, and not zero; probably four or five is sufficient in most domains, maybe closer to twenty or thirty in the most epistemically rigorous and developed fields like mathematics or computer science. Each wheel you reinvent, and every driected question you ask along the way, will propel you faster to the true frontier than that same amount of time spend in idle study, or even five times that amount. This is at heart a [Caplanian view](https://www.betonit.ai/p/how_people_gethtml): "If schools teach few job skills, transfer of learning is mostly wishful thinking, and the effect of education on intelligence is largely hollow, how on earth do human beings get good at their jobs?  The same way you get to Carnegie Hall: *practice*." Or if you prefer exhortations, [Do Ten Times as Much](https://www.betonit.ai/p/do-ten-times-as-much) is my favorite unpleasant advice that works.
