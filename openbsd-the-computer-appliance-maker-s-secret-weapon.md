---
title: OpenBSD, the computer appliance maker's secret weapon
date: 2024-06-05
tags: 
- openbsd
- cost-optimization
- heuristics
- installing-software
- napkin-calculations
- old-command-line-tools
- principal-agent-problems
- productivity
- time-management
- tmux
- software-management
- software-dev
- simple-suboptimal-solutions
---


_Obligatory "all thoughts are my own, not my employer's"._

Between our ESP32 prokaryotic organisms and our 24/7 Internet-enabled
megafauna servers, there exists a vast and loosely-defined ecosystem of things 
the 
B2B world likes to call **computer appliances**. Picture a bespoke Pi 4 packaged 
up neatly with some Python scripts, a little fancy plastic embossing, and maybe
a well-guarded `id_ed25519.pub` in case you end up in hot water during the 
(long - very long, stable cash flow for generations long) maintenance contract, 
and you're in the ballpark.

This is the little slice of computing heaven I currently live within. In a lot
of ways it feels like what I imagine employed hackers of old in the 90s were up
to. You can't feed your data into Grafana, but you *can* `tail -f /var/log/syslog` 
and make
a tidy profit off of your long-gestating Bash/Perl scripting skills.
You probably can't `terraform destroy && terraform apply`, but when was the
last time you saw immutable infrastructure done right anyway? Et cetera,
et similia.

Hey, you know what's really dangerous over the 15 to 30 year lifespan of an
average B2B computer appliance? *Forgetting stuff.* Everyone can feel their
way around Debian 12, 11, maybe even 10 -- but how do you debug a service that
is running all the way back on Debian *4*? Let's not even get into the horrors
of Windows XP-based appliances, which power more of the world than you want
to know.

If only there were a freely-usable set of Unix-like operating systems, with an
emphasis on keeping things very, very stable over releases, even more stable
than Debian does. Enter **the BSDs**. Free, Open, Net, take your pick. All of
them take a "don't fix it if it ain't broken" approach to things, which means
someone who started slinging NetBSD installs back in 2007 can probably spin up
a well-manicured VM of that 2007 install and reliably make their way around
the system, even today, in 2024.

I've recently
[taken to learning OpenBSD](../i-m-turning-30-so-i-m-switching-to-openbsd.md)
for this very reason. And for reasons of security: While having the box not
physically connected to the Internet creates an activation energy to doing
something nasty with them that
99.9% of
ne'er-do-wells will ignore, the remaining 0.1% are likely to be
*really motivated* to want to do this. If they run into OpenBSD, however, their
efforts are quite likely to be thwarted just because the blowfish is so darn
spiky.
