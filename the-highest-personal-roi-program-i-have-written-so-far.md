---
title: The highest personal ROI program I have written so far
date: 2024-07-30
tags: 
- automation
- design-affordances
- worse-is-better
- shell
- law-of-diminishing-returns
- personal
- finnish
- fzf
- cli
- against-entropy
- finstem
---


It would have to be 
[finstem](https://github.com/hiAndrewQuinn/finstem),
a simple command-line program I wrote to
reduce Finnish words down to their root form.

Finnish is a lot like Latin or Russian in that its words
often become lumbering behemoths of rewritten consonants,
suffixes upon suffixes, and this makes it hard to look up
in a dictionary -- that is, until you factor in its
very regular orthography and the phenomenal
efforts of the Finnish programming industry: `finstem` is
basically a very specialized UI for 
[the OpenOffice spell checker](https://voikko.puimula.org/),
and I have no shame in admitting that.

`cloc` puts it at under 200 lines of code altogether,
including the tiny `fzf` wrapper I ship with it to let
people stem words as they type them.

I pretty much consider it feature complete by this point.
I use the wrapper dozens of times in an average day while
studying the language; there were a few bugs early on my
[dogfooding](https://blog.logrocket.com/product-management/what-is-dogfooding/)
revealed, but the nice thing about small CLI programs is
there just isn't that much surface area for issues to
crop up.
