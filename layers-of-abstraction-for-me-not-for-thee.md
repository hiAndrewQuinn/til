---
title: Layers of abstraction for me, not for thee
subtitle: Qualitatively different layers
date: 2024-06-18
tags: 
- design-affordances
- installing-software
- law-of-diminishing-returns
- software-dev
- simple-suboptimal-solutions
- shell
- tmux
- time-management
- the-medium-is-the-message
---


Consider the problem of "how do I run more than 1 terminal at a time".
At this moment, I have at least 5 different ways I can effectively
solve this issue:

- I can, from a different physical computer, SSH in to a new session.
- I can, from the same physical computer, switch to a different `tty` 
  session with ... `C-S-F2` through `6` or something. (Rare, but
  sometimes it comes in really handy.)
- I can, in the same user session, open 2 separate windows of a terminal
  emulator.
- I can, in the same terminal emulator, open a new tab.
- I can, in the same emulated terminal, run `tmux` and open a new
  pane.

There are yet more exotic options like 
[Serial over LAN](https://en.wikipedia.org/wiki/Serial_over_LAN)
that I'm only theoretically aware of. 

Respectfully, I feel a bit
spoiled for choice in this domain - but this definitely doesn't follow
[the Rule of Four](../the-rule-of-four/),
and if I was a new entrant to the world of terminals, I would feel a bit
overwhelmed by it all. Having options is great, but I don't know much
about the *constraints* driving all of these options to exist. 

To say nothing of if I was a casual user, with no real interest in
going pro at all. I do my own taxes, but I definitely *don't* want to
invest a bunch of time right now
into learning all the secret little nooks and
crannies a professional accountant can hook into to make their work
lives go more smoothly even as they save me much more money than I ever
could myself. 

This is one reason face-to-face interaction with
someone who is both good at their job, and good with people, is so
pleasant. You can sense the avalanche of choices they know
they could employ while talking with you, and their restraint in not
stepping out of the way and letting it bury you. I still have fond
memories of the day my accountant friend heard my plight 
about moving countries, of passport issues, for half an
hour, and simply asked me, "Have you heard of the
[FEIE](https://www.irs.gov/individuals/international-taxpayers/foreign-earned-income-exclusion)?"
