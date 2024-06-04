---
title: Quickstarts and Slowstarts
date: 2024-06-04
tags: 
- communication
- documentation
- law-of-diminishing-returns
- installing-software
- productivity
- simple-suboptimal-solutions
- vagrant
- worse-is-better
- virtualbox
- tutorial-writing
---

A while back I stirred up some controversy on Hacker News
by talking about why I liked it when
[tutorials take you from clean VM to working, installed software](https://news.ycombinator.com/item?id=39882810).

I've since taken to calling this the "tutorial-in-a-box" method.
When I write them myself, I usually put them under the
header **Slowstart**, a riff on the proverbial Quickstart.
Two examples:

- [A gentle introduction to `reposurgeon`](https://andrew-quinn.me/reposurgeon).
- The [Slowstart](https://github.com/Selkouutiset-Archive/selkokortti?tab=readme-ov-file#slowstart) for `selkokortti`, some flashcard generating software based around [my Finnish language news archive](https://hiandrewquinn.github.io/selkouutiset-archive/). 

The point of a Slowstart is to make it so that *even absolute beginners*
can start to pick up some pointers about how people "in the know" of
your chosen software ecosystem actually get things done. Instead of a
Dockerfile or a shell script, you take them by the hand, spin up a
*totally fresh* virtual machine from the ground up using something like
[Vagrant](https://www.vagrantup.com/)
or
[virt-builder](https://developer.fedoraproject.org/tools/virt-builder/about.html),
and walk them through **each and every command** they need to execute
in order to get to a working install.

Slowstarts emphasize **reproducibility over speed**, 
**accessbility over convenience** (not all of us have Docker on the job,
or even know what it is), and
**comprehensibility over magic**.
Because you are starting from a totally-fresh VM, you can present the
Slowstart in a totally linear and deterministic fashion. Because
*the reader* knows you are starting from a totally-fresh VM, if one
of those commands breaks later on, they have absolute confidence that 
something is deeply wrong, because these commands definitely used to
work on this OS, on this version. The intention is that a
reader who can't grok the Quickstart
will first work through the Slowstart to get the necessary
skills they need, and only then move to figuring out how to get it to
work on their machine, which might be all manner of tricked-out.
In the ideal Slowstart, each command is like a step in a methematical
proof, doing only what is necessary, when it is necessary - so that
the reader can selectively *omit* shell commands and see where in the
chain that later causes things to break.

I tend to target Debian Linux in my Slowstarts, as I feel that is an
excellent "lowest common denominator" for this kind of work. But if
in your slice of heaven there's a better LCD, for example FreeBSD or
Fedora or Alpine, it makes a lot of sense to just target that and
call it a day. Who knows - you might just convince someone that
`pkg_add` really is nicer than `apt install`, and make some new friends
in high places.

Best of all, when you come back yourself in 10 years and try to
figure out how the heck to get your old bit of legacy software running,
you yourself will have confidence that at least at some point, you
knew cold how to install it on a certain OS, at a certain version.
