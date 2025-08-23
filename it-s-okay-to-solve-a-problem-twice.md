---
title: It's okay to solve a problem twice
date: 2025-08-23
tags:
  - heuristics
  - automation
  - law-of-diminishing-returns
  - personal
  - software-dev
  - software-management
---

Quoth
["How to Become a Hacker"](https://www.catb.org/~esr/faqs/hacker-howto.html#believe2):

    2. No problem should ever have to be solved twice.
    Creative brains are a valuable, limited resource. They shouldn't be wasted on re-inventing the wheel when there are so many fascinating new problems waiting out there.

Much more at the original post, including preemptive rebuttals to what
I'm about to describe. This post is entirely about cataloguing my own
error.

I took this maxim, perhaps, a little too close to heart when I was
starting out as a software guy, 15-odd years ago. This is my
apology to past me. Past me, I apologize.

Back when I was first wading into the deep pools of
technology, I decided early on that the sysadmin path seemed more
interesting to me than the software developer path.
A large part of that early reasoning was based on this maxim.
I already knew I was smart enough to do whatever I needed to in my own
code, if I absolutely had to.
But if 3 lines of Awk could do faster and better what 30 lines of
my own rudimentary
Python could, it just made sense for me to invest the one-time cost into
learning enough Awk syntax to be dangerous. Especially when
I could amortize this cost over the whole rest of my life and that
I was 15 years old at the time.
All the other software developers I knew wanted to do _new_
things without even realizing these things had _already been done_,
in much more advanced and robust ways, often by
older more experienced people! How wasteful.

Years passed, and my wasteful developer friends started to land
contracts and full-time jobs on the backs of their shitty money-printing
PHP code, while I languished in the austere beauty of the terminal.
Later I realized to my dismay that some of these PHP slingers became
_better at the terminal_ than me too, because they actually had to use
it in anger over and over and over again rather than in the sterile
environment of writing their own non-networked, stateless little parsers
and such.

I made multiple errors in my thinking at this age.
The most fundamental was simply an
unwillingness to admit the _real_ reason I preferred computers
to other hobbies like e.g. video games or reading
Goethe. Computers were something you could get
good at for the low price of an Internet connection and your
own sweet time, and then make a lot of money with later on.

Had I been honest with myself on this point from the start,
I would have been forced to admit:
People won't pay you if you cannot demonstrate
_overwhelming competence_ at solving the problems _they_ specifically
care about. My approach did a terrible job of that. Nobody is going to
believe you if you say "I have the world's most efficient software
factory, now I just have to start making some software with it."

To see why: Consider two job candidates, both alike in dignity.
You ask them to build something simple, but non-trivial - say, a working
prefix search. (I have learned
[a lot](https://taskusanakirja.com/) about prefix search in the last
few months.)

One answers out the gate with a solution in Python or Go which actually
implements a trie. They walk through the code, ensuring that all the
big-O notation looks correct. They whiteboard and run through a few
tests by hand. Their solution needn't be perfect - they have demonstrated
_overwhelming competence_ at the job you have asked them to do.

The other says, "Uh, `grep "^prefix" file.txt`". Done." You counter that
this isn't an acceptable solution. "We can make it faster if we need to
by sorting the file and running `look "prefix" file.txt` instead, is
that better[^1]?"

Okay, granted, not everyone knows about `look`. There are places where
this kind of fingertip knowledge is quite valuable. But it's just not
as impressive as actually showing you can reconstruct the exact
quasi-mathematical artifacts from quasi-first principles on the spot.
Whatever candidate 2 has demonstrated competency at, it's not the job
you _really_ wanted them to do.

Even if `look` was the answer you were looking for, you could sit
candidate 1 down for five minutes and tell them, "So there's actually
a faster, good-enough way for our purposes", show them the command, and
expect them to immediately grok it. In all likelihood you cannot sit
candidate 2 down for five minutes and explain to them how to construct
a trie and expect them to be able to whip one up from scratch with no
issues.

Teenage me would have protested at this. "But one of these two
approaches is just _good engineering_. Why on Earth would we want to
recreate an entire trie from scratch, that's such a waste of time!
Millions of tries have been implemented all over the place, why not
use one off the shelf!" This would have been a dodge. What he's really
trying to say is, "No problem should have to be solved twice!"

And adult me would have to respond, "No, it's okay to solve the same
problem twice. In fact virtually every problem you have in your life
right now is a problem people have had to solve twice, ten times, a
million times in their lives prior. When to go to bed. What to eat for
dinner. How to make money so you can stay in rent and food and
computers. How to [analyze that FASTA file](https://en.wikipedia.org/wiki/Huffman_coding).

"If you look at most of the people in the 20th century
who are trying to solve genuinely novel problems, problems truly nobody
has ever solved before, most of the interesting ones are in PhD
programs. What do PhD programs all start with? A documented ability to
solve many, many thousands of similar prior problems in and around that
domain space. Why do you think that is?

"Are you _actually_ smart enough to wholly intuit how to build a trie
from first principles from no prior study? Because that's the logical
conclusion of committing this hard to
never solving the same problem twice.
You
commit yourself to do more with less until you can
do everything with nothing. Then you do everything once."

Teenage me would have likely sat in silence for a while at this.
"Until I make a mistake somewhere," he would have admitted. "I know I
make a lot of mistakes."

"If it's okay to solve the same problem twice, it's okay to make
mistakes too."

[^1]:
    `look` also doesn't build an actual trie,
    it's just a binary search.
    But let's assume that you're not interviewing and Google and that the
    difference really isn't that important to you.
