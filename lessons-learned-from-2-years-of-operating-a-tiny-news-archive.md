---
title: Lessons learned from 2 years of operating a teensy-tiny news archive
date: 2025-10-27
tags: 
- hugo
- documentation
- selkouutiset-archive
- secondary-language-acquisition
- cloud-costs
- picore
- tiny-core-linux
- perl
---

I began running
[Andrew's Selkouutiset Archive](https://hiandrewquinn.github.io/selkouutiset-archive/)
almost exactly two years ago, with a simple goal:
Create a straightforward way for Finnish language learners
to access the simple news broadcast by YYYY-MM-DD.
It has basically accomplished that goal, with only a few tweaks here
and there to keep everything running.

[Earlier in the series: Lessons learned from 6 months of operating a teensy-tiny news archive](https://til.andrew-quinn.me/posts/lessons-learned-from-6-months-of-operating-a-teensy-tiny-news-archive/).
I stand by those points, and have some more to add here at the 24-month
mark.

- **Put what you want to see first!** The only significant frontend
  change I made was reversing the ordering of the archive so that the
  *latest* material comes first; otherwise every single day we've been
  running is listed in YYYY/MM/DD order for one's Ctrl+F pleasure. I
  made this change after realizing the modal use case was not to go on
  a binge of frankly boring news content, but just to have a faster
  loading page to read today's or yesterday's news as it came out.
- **[piCore](http://tinycorelinux.net/) is worth the learning curve.** 
  piCore is a fork of Tiny Core Linux which, unsurprisingly, runs on 
  the Raspberry Pi. The big draw for me was that after an initial SD
  disk read, the SD disk is *never touched again* and everything - 
  files, operating system, the whole caboose - runs in RAM. This is a
  technique I've only ever heard of
  [Mullvad VPN using for their VPN servers](https://mullvad.net/en/blog/we-have-successfully-completed-our-migration-to-ram-only-vpn-infrastructure)
  before, but it turns out to be an excellent way to spare an SD card
  and make it last much longer - if you're willing to put in the
  additional legwork of basically turning the Pi into a plug-and-play 
  appliance that does its work as soon as you plug it into the wall.
- **If you're going to script for an external server, just do it in
  standard shell, please.** The first iteration of this site used the
  [Fish shell I know and love for interactive use](https://fishshell.com/).
  When I migrated from Debian to piCore for the backend it turned out
  (a) I couldn't install this easily and (b) even if I could I would
  be wasting some of my precious 4 gigs of RAM, which I could use for
  something else instead. So I took my pile of shell scripts and
  rewrote them into [one behemoth POSIX shell instead](https://github.com/hiAndrewQuinn/selkouutiset-scrape-cleaned/blob/master/process.sh)
  that occasionally shells out to inline Perl 5 instead of Python for 
  the harder stuff. This took a lot of work but the end result is
  *much* easier for me to tweak and maintain as time goes on.
- **A website does not have to be dynamic to be useful.** Besides my
  nonstandard choice of programming language, I have to admit I've been
  very pleased wth the tech stack I've stuck with otherwise. Hugo is
  still my favorite tool for creating fast static websites from the
  ground up; I ate the one-time cost of actually
  figuring out what all of its files and variables did years ago, and
  to this day I'm still finding good uses for that. A website which
  periodically updates but is otherwise static is a really valuable
  point in design space for things like this; I've never had to pay a
  cent in hosting costs because at the end of the day it's just a 
  lightly-prettified stack of HTML files.

If you want to see my other
software projects for helping people learn Finnish,
you can find them all at [https://finnish.andrew-quinn.me/](https://finnish.andrew-quinn.me/).
Most things there are free, with the exception of an optional Pro
license for a pocket dictionary which gives you reverse lemmatization
features (the dictionary works as a dictionary no matter what).
