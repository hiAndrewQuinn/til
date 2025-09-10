---
title: tarsnap is cozy
date: 2025-09-10
tags:
  - cost-optimization
  - old-command-line-tools
  - security
  - tarsnap
  - backups
  - digital-resiliency
---

I have been aware of
[tarsnap](https://www.tarsnap.com/)
for a long time, but only recently did I actually
[get around to using it](https://andrew-quinn.me/digital-resiliency-2025/#backing-up-the-crown-jewels-with-tarsnap-mac-linux)
for anything, as a result of my big
[personal digital resiliency audit for 2025](https://andrew-quinn.me/digital-resiliency-2025/).
For those of you not in the know, tarsnap is
"online backups for the truly paranoid", and
`tarsnap` the command-line program is the client-side
tool you invoke to actually zip up and push your
archives into the vault. Its creator,
[Dr. Colin Percival](https://www.daemonology.net/),
is a really smart and interesting dude for a whole
bunch of reasons. I'm led to believe the whole
business is basically a two-man show between him and
his brother these days.

Tarsnap feels... _cozy_ to use.
I know that's a weird word to pick for something
most people use to back up, like, extreme
cryptocurrency wallet codes and the like, but
every single thing about it just feels well-considered
from both a Unix sysadmin's usability standpoint
and from a general product standpoint. The client
side CLI tool is based off of how `tar` itself works.
The prepaid model means that at any point I can
effectively guarantee anonymity by just shredding
up my keyfiles and letting the $15.123412341234123412
or what have you I still have remaining in the account
quietly run out, at which point the digital noise that
corresponds to whatever I have in there will be
unceremoniously deleted. These two things mean I feel
extremely safe just sticking the whole thing into a
one-liner hourly cronjob if need be and let it rip.

People have often complained they don't have a good
sense for the pricing, so I
[hacked together a little Tarsnap cost estimator here](https://hiandrewquinn.github.io/tarsnap-calculator/).
If you use it solely to back up the
few megabytes of
"crown jewels" data we all have lying around,
don't be surprised if the calculator tells you
your initial $5 or such will last for over
1,000 years. About the only thing I could think
I might want more from a service like this is
the opportunity to use a hardware key instead of
a keyfile - I'm sure Colin has thought about this
possibility himself and has good reasons for or
against implementing it, however.

Hats off to you, Dr. Percival. This truly is a
dream product.
