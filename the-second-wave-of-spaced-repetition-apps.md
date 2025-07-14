---
title: The second wave of spaced repetition apps
date: 2025-07-14
tags: 
- bounties-in-everything-we-care-about
- cost-optimization
- communication
- econ-flavored
- anki
---


[Spaced repetition](gwern.net/spaced-repetition)
has been around for a long time.
If you've never heard the term before, it's best described as
*flashcards on timers*.
an algorithm such as 
[SM-2](https://github.com/thyagoluciano/sm2)
or the more recent
[FSRS](https://github.com/open-spaced-repetition/fsrs4anki)
keeps track of how you did on the flashcard,
makes a guess as to how long it could possibly wait
to show you the flashcard again before you below, say,
a 90% chance of getting it right the next time,
and then schedules the flashcard for a new day.

Crucially, this length of time *increases* with consecutive
successful reviews - if you see "apple" and correctly answer 
"🍎", it will show you the apple / 🍎 card again 2 days later,
then if you get it right again it might show it to you 2 *weeks*
later, and a few repetitions after that you won't have
to see the apple / 🍎 card for years at a time. The memory will
just remain dormant in your skull in the worst case scenario.
In the *best* case scenario, sometime in the 12 years between
your 7th and 8th reviews, you will actually *see* the word "apple"
in real life and think "Ah! 🍎!". Spaced repetition software systems
don't usually try to explicitly model this extra 'review'.

Spaced repetition is really cool. It has been a cornerstone of my
life for over a decade now. It's how I got a perfect score on my
abstract algebra final in college. It's how
[my wife relearned high school math to place into university herself](https://news.ycombinator.com/item?id=39053047).
I basically don't open resources for serious learning anymore without
having a spaced repetition program of some sort open so I can capture
the knowledge being presented to me in a way which allows me to keep
it retained somewhere deep in the recesses of my skull.[^1]
Most of my "hot" knowledge of systems I don't touch every day,
like Django, Haskell and Kubernetes, have been retained entirely through
my little set of handcrafted flashcards on timers.
Virtually all of my slow but steady Finnish language acquisition has
been carried on this beast of burden in some way, shape or form.

[Anki](https://apps.ankiweb.net/) is my weapon of choice for such
activities. It's a big complicated program, with big complicated
features, and enough generality that I can basically throw anything I
come my way at it and turn it to some use. This is exactly what I want
from a power user perspective. 
It is **the opposite of what normal people want.** Normal people do not
want to hone the timeless art of writing good flashcards. Normal people
do not want to experiment over months or even years with just the right
way to remember whatever it is they're trying to wrap their head around.
Normal people want something 
**custom built for their exact learning needs**. I call apps like this
"second wave" spaced repetition systems (SRSs).

[Duolingo](https://blog.duolingo.com/spaced-repetition-for-learning/)
gets a lot of flak in the language learning community, but they
absolutely get what it means to be a second wave SRS.
[They do actual research](https://research.duolingo.com/papers/settles.acl16.pdf)
to see what additional signal they can extract from the noise of their
custom app to space out reviews just a little farther, to modulate the
difficulty level of the learner with just a little more granularity.
[Math Academy](https://mathacademy.com/) is trying to do the same for
math.
[The AnKing](https://www.theanking.com/) still uses Anki as a platform,
but they put a professional level of quality and polish into their
US medical school flashcard decks that suggests to me they eventually will
want to move to their own bespoke platform now that they've achieved
product-market fit.

There is no good reason to think Anki in all its immensely powerful
generality has actually hit the Pareto frontier of optimal retention
*for any given subject*, even if it is close to the Pareto frontier
for retention in general. Latent within any subject is a hidden
structure of knowledge building upon other knowledge that, if properly
unearthed, could allow for fewer reviews of the truly basic stuff and
more reviews of the truly advanced stuff, which reviews the basic stuff
as a simple matter of course. 

Few people even realize that
[you can create multi-stage questions in Anki with basic HTML features](https://hiandrewquinn.github.io/til-site/posts/create-multi-stage-anki-card-answers-with-html-s-details-tag/), yet
this format is incredibly common in traditional pedagogy 
for a reason - you need to know the answer to 
subquestion (a) if you want to be able 
to easily answer (b) and (c)! 

So it's not hard for me to imagine a future
where every school subject has a handful of best in class, dedicated
online web apps, that track you down to the millisecond and keystroke,
extracting *hundreds* of features about how you are actually going about
active recall and answering the question, correlating them all on the
backend, all with the goal of making your learning process as
efficient or as fun as possible[^2]. I think people would pay for that.



[^1]: In theory. In practice, it turns out a lot of the textbooks I used
    to read have hundreds or even thousands of flashcards that have been
    sitting there collecting dust for years, just like your old
    differential equations notes you keep saying you'll get back to,
    dear reader. 

    I don't see this as a failure mode of the system, quite
    the opposite - the fact that I haven't ever made time to get back
    to these cards and add *even more* study time to my daily routine is
    undeniable proof to me that the material isn't actually as relevant
    to my daily life as younger me imagined it might be. Every day, I am
    offered the choice to finally begin rehashing everything I learned
    about *rolls d100* [dbatools](https://dbatools.io/), the PowerShell
    SQL module nobody knew they needed, and every day I decide "Maybe
    later - I haven't touched a Windows development machine in years."

    When I had only 5-10 books in the system this would sometimes be a
    source of guilt. What do you *mean* I learned this whole complicated
    thing
    [just in case](https://www.johndcook.com/blog/2010/03/03/just-in-case-versus-just-in-time/)
    I needed it, and then I ended up *not needing it*?! Am I lazy or
    stupid or both? Now that the number is closer to 100, I feel no
    such guilt. Rather I see a long list of intelligently made bets 
    by a moderately intelligent and moderately conscientious guy
    on which
    material might be valuable in the future, that have not (yet)
    panned out. I didn't *lose* much by spending the time
    making my notes on the material in the way I did, any more so than I
    lost time in college diving into *rolls d100*
    [Lyapunov stability](https://web.stanford.edu/class/ee363/lectures/lyap.pdf)
    before I realized I would be moving countries and probably shouldn't
    pigeonhole myself as a dynamical systems expert when there are
    probably a three-digit number of employed people in Finland who
    actually use Lyapunov stability (or dbatools) on a regular basis
    anyway.

[^2]: I'm tempted to say "pick one" based on my experience. But even
    here, that wouldn't be entirely fair to say.
    Oftentimes I have found the biggest waves of understanding to
    be directly downstream of having so much fun with whatever I'm
    wrapping my head around that something just unlatches, all the clues
    drop into place, and what was once impassable is now flown overhead.
