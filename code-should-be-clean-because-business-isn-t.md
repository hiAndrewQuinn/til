---
title: Code should be clean because business isn't
date: 2025-09-20
tags:
  - cost-optimization
  - complementary-goods
  - installing-software
---

I am an [ardent](http://www.daviddfriedman.com/The_Machinery_of_Freedom_.pdf) capitalist.
I am also an [ardent](https://www.catb.org/esr/writings/taoup/html/ch01s07.html) Unix philosopher.
I have long percieved there to be some _interesting_ tensions between
these [two wolves inside me](https://knowyourmeme.com/memes/inside-you-there-are-two-wolves).

The Unix philosopher in me wants my code to
be as simple and flexible as possible, and - not always, but often -
to minimize the number of lines of code I need to sling to solve a
given problem.[^1] The capitalist in me wants to cover as many edge
cases as possible, make every transition as smooth as possible, and
apply as much napalm to the fire of user acquisition and douse its twin
flame user churn in [liquid death of another kind](https://liquiddeath.com/en-se/products/mountainwater). What to do?

Can we start by looking at the evidence? Is it actually true that
software businesses, even very capable ones, tend to write and run
their products using more lines of code than equivalent open source
softwre projects might? This is a, uh, challenging measurement
problem. First because
there is no "FOSS Google" and the concept doesn't even really make
sense. There isn't even e.g. a FOSS Datadog, for that matter, not if we
define that as "a reasonably feature-complete replacement that
could run Datadog's most challenging workloads with similar performance,"
although there are many good FOSS competitors that all do different
things in the same space
(check out [lnav](https://lnav.org/) if you haven't, it's great).

Second because large companies have no reason to actually make that
number public.
The best I found was when
[the ACM reported in 2016](https://research.google/pubs/why-google-stores-billions-of-lines-of-code-in-a-single-repository/)
that the Google monorepo stores multiple _billions_ of lines of code
in its system. I am aware of no open source project, traditionally
defined, that measures
its code base in the billions.

But we can also just use the plain old evidence of our senses. We've all
worked at companies before, right? Does anyone out there _really_ want
to claim that the code they write is as simple and flexible as what the
open source gurus sling? Probably not. Why? Because edge cases accrete,
over time, in response to changing business requirements and business
forecasts, and not uncommonly simply because someone new joined the team
who didn't quite understand how we did things here and shoehorned
something in, and... You get my point. These companies exist. One of my
favorite suppliers at my dayjob sounds like he works like this. They're
not the norm, though.

Here is my synthesis. Business is _inexorably_ messy. As soon as you
start trying to sell something, you enter into a competitive dynamic,
and iterated game theory is notoriously hard to wring one-size-fits-all
solutions out of, so just imagine how hard, like, reality must be.
There are many times and places where the competitor who is willing to
be messier than you will win out simply because they can get their ideas
to market faster and/or at lower cost. You cannot predict these
situations in advance, you just know they are common and maybe even the
norm.

Planning accordingly: If you _walk into_
the free market bloodbath with tools that _themselves_ are simple and
flexible, you give yourself a massive advantage. In essence you have
bought yourself the freedom to be messier, at a future date,
when actual money is on the line.

Or equivalently: Any time you bother to learn something
you are implicitly making a bet on the future, that having this
knowledge reside in your skull rather than in books or tractata will be
worthwhile.
You are long Python, or long C++, or long OCaml and the French
military-industrial complex
continuing to remain solvent.
Conversely consciously deciding _not_ to learn somethiong is a short
position - I have a bunch of Anki cards for the book
[Azure SQL Revealed](https://www.amazon.com/Azure-SQL-Revealed-Server-Professionals/dp/1484259300)
that I will almost certainly never touch again, because I do not expect
to have to use Azure SQL at a high level in my career any time in the
near future.[^2]
Knowledge of simple and flexible tools is generally a good bet to be
long on.

[^1]:
    Taken to its logical conclusion, this implies you should get
    really really good at shell scripting and understanding the Unix
    ecosystem _before_ you try your hand at "actual" programming. A one-liner
    that solves a business problem is the platonic ideal of Unix wizardry
    before we collapse down to zero-line solutions and then have to switch
    jobs. But that's just a bit like saying you should read the whole math
    textbook before you actually try to use your brain to solve a new kind
    of problem you may not have quite seen put like that before, and it has
    similar failure modes, e.g. very few people are willing to pay you for
    Bash scripts, but a great many people will pay you if you can
    demonstrate out of band competence at LeetCode problems.

[^2]:
    Then again, you could argue that merely by dint of me reading such
    a book, and making personalized flashcards out of it, I have taken a
    more nuanced, hedged position on the potential value of Azure SQL in
    the future. This is true, but I had to find a concrete example to
    point to, not just "the literal infinity of things I do not
    and will never know or care about".
