---
title: LLMs make Perl great again
date: 2025-05-24
tags: 
- debian
- complementary-goods
- installing-software
- linux
- llm
- old-command-line-tools
- openbsd
- perl
- simple-suboptimal-solutions
---

Perl 5 went through a long nadir of unpopularity due in large part to its
deserved "Write Once, Read Never" reputation. So I was surprised to find out
not only is it
[installed by default on Debian](https://hiandrewquinn.github.io/til-site/posts/what-programming-languages-come-out-of-the-box-on-debian-12/),
it's installed nearly *everywhere* by default.
It's even the non-shell scripting language of choice on
[OpenBSD](https://marc.info/?l=openbsd-misc&m=159041121804486&w=2)!

Perhaps the only thing more impressive than Perl's utter ubiquity is its
longevity. The latest major version of Perl was first released in
[*1994*](https://en.wikipedia.org/wiki/Perl_5_version_history). It came into
existence on this planet less than a year after I did. It's even arguably more
portable than the median shell script - different Unices might use Bash, Zsh,
Ksh, or even something newfangled like
[Fish](https://fishshell.com/),
but for the most part a Perl 5 program is a Perl 5 program is a Perl 5 program.

I submit that we glorified sysadmins should all consider Perl 5 in a new light
in the age of machines which can both adequately explain, and pump out, decent
Perl for any number of mundane use cases, given these other sideline advantages 
the language has. It's just not that hard anymore to look at 3 lines of shell
noise, ask ChatGPT or Gemini or Claude for a breakdown, and then - if we're
being really ambitious here - actually study what it says enough that we can
start to use these same features ourselves in the future with some fluency.
Write Once, Read Never was a much worse thing in an age where you might be the
only person around who understands even 30% of Perl.
