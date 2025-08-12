---
title: What scripting languages come out of the box on Debian 12?
date: 2024-06-23
tags: 
- debian
- heuristics
- installing-software
- law-of-diminishing-returns
- virtualbox
- vagrant
---

Poking around in a 
[fresh VM in Vagrant](https://til.andrew-quinn.me/posts/the-unreasonable-effectiveness-of-vms-in-hacker-pedagogy/),
I see

1. `bash`
2. `dash`, a POSIX compliant shell linked under `sh`
3. `python3`, 3.11.2 at the time of writing
4. `awk`, specifically `mawk`
5. `sed`, if you count that (I do)
6. `perl`, specifically Perl 5

There may be others I missed.

Why I'm curious: Knowing that a language is installed by default on the most
popular Linux distribution can simplify certain concerns considerably, which
are of special interest to 
[people who don't work on Internet-connected boxes](https://til.andrew-quinn.me/posts/openbsd-the-computer-appliance-maker-s-secret-weapon/).
Knowing that Python/Perl is already on there means that, 
provided your script only
relies on the standard library, you should be able to just `scp` it over in a
pinch and have it "just work". 

You can also do this with Go binaries, etc. thanks to their static linking.
However, this doesn't include the source code by default, which may be  
an important concern for far
future people who want to figure out what on Earth `./foobar` is actually doing.

I don't know why I don't hear this point get more airtime among people when
discussing the pros and cons of Python/Perl as scripting languages. Maybe most
employed software engineers just don't work in the weird marginal zones I work
in very much anymore. I would certainly *prefer* not to be SSHing into machines
all the time, but hey, it's a very transferable skill and you take what you can 
get.

Chalk this up as another, perhaps underrated, point in favor of learning Python
as your first programming language, aside from the
[stellar quality resources](https://programming-23.mooc.fi/)
that exist for it as well. It was a great horse to bet on for me back in 2009,
and it's only gotten better from there.
