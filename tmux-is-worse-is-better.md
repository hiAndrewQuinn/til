---
title: tmux is worse is better
date: 2024-05-23
tags: 
- linux
- shell
- openbsd
- heuristics
- bsd
- tmux
- worse-is-better
---


[tmux](https://github.com/tmux/tmux/wiki)
(short for "terminal mux" (short for "multiplexer"))
is
[i3](https://i3wm.org/)
for your terminal.
Oh, it's so much more than that, and I recently discovered with
some joy that it is installed by default on
[OpenBSD](https://www.openbsd.org/),
but its fundamental value add to any programmer who has to
SSH into servers more than once a week is it allows you to
split your screen up into multiple independent shells
*without needing a graphical environment at all*.
If you want to walk the path of true digital minimalism,
[vanilla Vim](https://www.vim.org/)
and tmux or its spiritual grandfather
[screen](https://www.gnu.org/software/screen/)
are all you need.

So it's always been interesting to me that a developer as
seasoned as
[Kovid Goyal](https://kovidgoyal.net/),
developer of the ePub powerhouse calibre and
my current teminal emulator of choice
[Kitty](https://sw.kovidgoyal.net/kitty/),
has gone on record a number of times saying he is not a fan
of tmux. He has 
[a whole section in his FAQ about it](https://sw.kovidgoyal.net/kitty/faq/#i-am-using-tmux-and-have-a-problem):

>[T]erminal multiplexers are [a bad idea](https://github.com/kovidgoyal/kitty/issues/391#issuecomment-638320745), do not use them, if at all possible. kitty contains features that do all of what tmux does, but better, with the exception of remote persistence.

(I don't use remote persistence. I'm aware I'm a
caveman.)

And from the linked Git comment:

>[Terminal m]ultiplexers add unnecessary overhead, suffer from a complexity cascade, because they actually have to *translate* escape codes, modifying them in hackish ways to get them to work with their concepts of windows/sessions. [...] Energy/performance wise they are poison, every byte has to be parsed twice, once by the middleman and once by the terminal. And they act as a drag on the ecosystem as a whole, making it very hard to get any new features. [...] Terminals [themselves] are fine, certainly better than any other interface paradigm I have ever seen.

I'm not here to incur Goyal's wrath. He knows way more
about this space than I do, and I'm clearly a very
satisfied user of kitty at home, where I have the
ability to tweak my environment to be exactly what 
I want it to be.

Therein lies the rub. At home, I run UNIX on my metal.
At work, I use Windows. And so, the multiple times a
day I find myself SSHing into one of our many, many
quasi-embedded Linux boxes, I find myself typing out
"tmux" as the first command I run. Because it's always
going to be there, and it does the one thing I actually
need it to no matter what: Let me run multiple shells
at once, without SSHing in multiple times, regardless
of whatever funky terminal emulator I'm actually using
to get the job done. Alacritty, Windows Terminal,
whatever. 

kitty has to run on what I'm remoting *from*.
tmux can work on what I'm remoting *into*. 
And that makes
all the difference.

[Worse is better](https://en.wikipedia.org/wiki/Worse_is_better#New_Jerseay_style)
is more of a product managment philosophy than a
software philosophy, IMO, but it basically underlines
the idea that whatever your software's killer app is,
you want to get that *really* right for the most common
use cases, even if it means living with a suboptimal
approach. 
[I love VMs for a lot of reasons](https://til.andrew-quinn.me/posts/the-unreasonable-effectiveness-of-vms-in-hacker-pedagogy/),
and I even maintain
[a set of 3 shell scripts](https://github.com/hiAndrewQuinn/shell-bling-ubuntu)
which turns a vanilla Ubuntu VM into my personal software 
development workhorse, complete with LazyVim, ripgrep,
tmux, and - yes - Kitty as the default terminal. 
But even with that it's
rare these days that I am doing such prolonged development
work that I feel it's worth actually working in 
such a VM. The perils of becoming a middle manager, alas.

So, for the most part, I remote in directly
from Windows. Which means I'm going to use tmux on
my servers. Which is why I have `C-b %` and `C-b "`
memorized and not ... *checks kitty docs* ... wait, 
is it really `C-S-Enter`? 

That's so *nice*. Man. We are missing out.
