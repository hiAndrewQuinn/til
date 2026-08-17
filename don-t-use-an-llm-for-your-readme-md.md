---
title: Don't use an LLM for your README.md
date: 2026-08-17
tags: 
- against-entropy
---


One of my more popular open source projects is 
[Shell Bling Ubuntu](https://github.com/hiAndrewQuinn/shell-bling-ubuntu),
which contrary to its name actually
supports many different operating systems these days
including modern macOS, Alpine, Fedora 40, Rocky Linux 8,
and up, WSL on Windows, and so on. 

But while I feel
the project is in a much more advanced state than it
was a year ago after this hardening and robustness
effort, I haven't seen much update or additional stars
on Github as a result of it, and I think the answer is
actually quite simple: **I replaced the README** with
a much drier one, driven by LLMs, and people (correctly!)
associate that as a negative signal of care against
the previous one.

Here is [the old README.md](https://github.com/hiAndrewQuinn/shell-bling-ubuntu/tree/0a6f36723d774cce13da4c2759f0582b8c9b08b9), all
hand-authored. Technically speaking, this is documenting
an objectively worse version of the code. You need to 
run three or four commands, not one.
I didn't check SHA256 sums, which maybe wasn't such a big
deal for a personal setup script that got popular in 2023,
but it sure is a big deal in Supply Chain Hell 2026.
You need to *close and reopen* your terminal! Several times!! 
On and on the list goes.
But it has *personality* 
that doesn't show through nearly as well in 
[the new README.md](https://github.com/hiAndrewQuinn/shell-bling-ubuntu).
The new one is... dry. There's no video. There's no weird
jokes or flashes of inspiration from yours truly. 
The point is to make using the shell a *joyous act* for
developers mostly on the newer, younger side of things.
It feels like I wrote it for e.g. the Operational Technology folks 
I talk to on my day job, who actually care[^1] about things like risk
management and say words like "procurement" with a meaning behind it.


I consider this a misstep as a steward of this tiny convenience
project of mine. When I have some time I think I'll step through
the README.md and try to make it more obvious *why* Shell Bling
Ubuntu might make your terminal-going life more fluid and fun.


[^1]: Term of endearment, to be clear. You *should* absolutely 
be much more conservative about what you install on corporate 
servers and not leave it up to one guy with too much time on 
their hands. SBU is not aimed at and doesn't aspire to aim at such
levels of rigor; it would take up far too much of my time to not
only pin SHA256 and SHA512 hash sums for every static binary
I release, but also spin up my own website backed by e.g.
Cloudflare R2, to mirror all of them, sign them off with `minisign`
or something since most of their own developers don't even go 
that far... but come to think of it, `age` and `minisign` wouldn't
be bad additions to the project.
