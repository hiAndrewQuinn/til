---
title: The unreasonable effectiveness of VMs in hacker pedagogy
date: 2024-03-31
tags: 
- virtualbox
- vagrant
- the-medium-is-the-message
- installing-software
- documentation
- design-affordances
---

Here's a secret. If you have [Vagrant](https://www.vagrantup.com/) and [VirtualBox](https://www.virtualbox.org/) installed, and your colleague does too, then you can both bring up an near-totally identical blank slate Debian 12 Linux VM by running


```bash
mkdir tutorial/
cd tutorial/

vagrant init debian/bookworm64
vagrant up
vagrant ssh
```

. This works regardless of whether you or they are on Linux, Mac[^1], BSD, or even Windows. (Through the magic of aliasing, `mkdir` and `cd` even work in PowerShell.)

If you are then writing a tutorial, especially one where you're trying to show off some fancy new command line tool or program you've written, you can then start the tutorial off with *all, and only, the things you absolutely need to install and do* to get to the place where you can actually use the tool. You can make these into commands your colleague can mindlessly copy and paste, because you know you're both working from the *exact same starting point.* (Until it stops being mindless, and starts being know-how, almost unconsciously to the learner, because you [situated the learning](https://www.johnseelybrown.com/Situated%20Cognition%20and%20the%20culture%20of%20learning.pdf) appropriately.)

This kind of thing is worth its weight in gold from a learner's perspective. It's the equivalent of not skipping steps in a math textbook, with the added benefit that the tutorial-reader can try taking steps out to see exactly where and why each step was important, and how things break when you don't have them.

"But Andrew, Docker is already a thing. It's been a thing for some time, even." Correct. But everyone knows what a virtual machine is. Not everyone understands Docker. Do you want to risk sending someone off on a wild goose chase learning what containerization is, when they could be learning *your thing* instead? Meet your student where they are, not where you wish they were.

This is a technique I've been using both professionally and personally ever since I tried out Laravel's [Homestead](https://laravel.com/docs/11.x/homestead) a few months ago. When I realized just how much stuff got out of my way with that Vagrant VM, I was hooked. I wrote [one such tutorial](https://andrew-quinn.me/reposurgeon/) earlier this week, and I expect I will write more with this approach well into the future.


[^1]: ARM Macs don't have Virtualbox. There is however the (paid) [Parallels](https://www.parallels.com/), which can work just as well, if you (a) install [Parallel's Vagrant provider](https://github.com/Parallels/vagrant-parallels), and (b) use [the Chef project's Debian 12 "Bento" box](https://app.vagrantup.com/bento/boxes/debian-12) instead of `debian/bookworm64`. If you want to dive down the rabbit hole of exactly how those Bento boxes are made, [here's your entry key](https://github.com/chef/bento).
