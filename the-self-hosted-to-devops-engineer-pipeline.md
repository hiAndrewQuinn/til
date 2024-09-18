---
title: The self-hosted to DevOps engineer pipeline
date: 2024-09-18
tags: 
- devops
- career
- cli
- cloud-costs
- cost-optimization
- kubernetes
- systemd
- software-dev
- old-command-line-tools
- installing-software
- econ-flavored
---


What's the best way to get a job? Show someone with a job to do that you
can do the job within their
[iron triangle](https://en.wikipedia.org/wiki/Project_management_triangle).
What's the best way you can show someone you can handle a complicated
k8s deployment, with 7 different CNCF-approved add-ons, zero-downtime
rollouts and a whole bunch of YAML files? Probably by competently and
publicly running *your own* complicated k8s infrastructure.

Self-hosters remind me a lot of the sysadmins of yore, who mostly ended
up in the profession because they just *couldn't help* but mess around with
their underlying computing machine until they knew all kinds of weird
nooks and crannies within it. I trace my own lineage in software
deveopment back to the day my parents finally purchased a Dell laptop
and a 300 Kbps Internet connection (residential wiring in Boston left
something to be desired), and promptly broke the Windows registry and
installed Ubuntu without them ever realizing anything had changed.
The next year I got my first internship through a high school program 
as a Unix admin intern at
[Akamai](https://www.akamai.com/), and the rest is history.

I blanket recommend "install Linux to your bare silicon and figure 
everything out by 
experimentation" to *anyone* interested in getting into the software
field. But I especially recommend it for folks who are more interested
in the DevOps-y side of things. If your laptop has 8 GB or more of
RAM, you have more than enough space to roll out quite complex
deployments purely locally -- and if you can find a way to credibly
signal that to future employers, say by actually running a tiny cool
little service atop it they can visit, I think you'll find an awful
lot of interest come your way from people with hard technical problems
to solve.

(-- Oh, but before you go, let me also make it clear that 99% of IT
shops out there are *not* running complicated k8s deployments with
7 different CNCF-approved add-ons running on top of them. This is
also part of the game. A surprising portion of the value of any
professional comes from the ability to trust that they

1. Have *the ability* to handle uber-complicated problems, if and when they arise, and
2. Have *the wisdom* not to actually use them unless they have a good reason to.

If you can tune a Porsche, a lot of people will trust you with their
Civic, and *that's still a pretty sweet gig*.)
