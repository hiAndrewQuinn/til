---
title: Cross-platform TUIs are easier than cross-platform GUIs
date: 2025-05-20
tags: 
- against-entropy
- cost-optimization
- cli
- finnish
- golang
- cross-compilation
- tui
- law-of-diminishing-returns
- worse-is-better
- software-dev
- simple-suboptimal-solutions
- installing-software
- design-affordances
---

Below is a GIF of
[`tsk`, my pocket Finnish-to-English dictionary](https://github.com/hiAndrewQuinn/tsk),
running in my terminal emulator of choice under Linux.
It's what the kids call a
[TUI](https://github.com/rothgar/awesome-tuis),
a graphical program that just happens to drive its graphics
using terminal graphics instead of graphics-graphics.

*Insert GIF here.*

You can probably tell that this program fits neatly into the
["home-cooked meal"](https://bradfrost.com/blog/link/an-app-can-be-a-home-cooked-meal/)
clade of programs. There is a very straightforward problem I want solved -
fast, single-executable-portable dictionary lookup, with a few conveniences
for the busy language learner layered on top. I am quite happy with `tsk` in
its current iteration and don't plan to add much more to it anytime soon.
It would still save me a lot of time and hassle if I were the only person who
could use it.

Imagine my surprise, then, when I 
[built a static Windows .exe file from the Go code](https://ref.coddy.tech/go/go-cross-compilation),
dropped it onto a Window's laptop to test, and it just ... worked. No changes
at all necessary. Windows just opened up an ancient looking terminal emulator
of its own, and happily ran my app just as if I were on Linux. I was bewildered;
cross-platform GUIs are well-known for being fiddly time sinks. And yet this
worked right out of the box! The story was the same on my wife's Macbook.

I think there's both a technological and a cultural explanation for this. The
technological explanation is straightforward: Terminals are just much, much
simpler environments than arbitrary graphics in arbitrary rectangles. Always
have been. Every major operating system comes with some kind of terminal
emulator built in, almost like a secret compatibility layer for those who are
in the know.

The *cultural* explanation is much more interesting to me. I get the
sense that people who write TUIs, both now and in days of
yore, tend to be functionality-first backend engineers. They don't *want* any
more bells and whistles than they actually need to get the job done. By choosing
the weakest possible environment *first* that satisfies their needs, they buy
themselves a much easier time getting the damn thing to work in novel 
computational ecosystems. This does *not* actually have to be the case - one
could imagine a terminal environment as rich as the modern-day web browser.
But, historically, that's just not quite how the cookie crumbled.
