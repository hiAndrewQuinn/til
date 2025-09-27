---
title: Where is the DevOps for Yocto?
date: 2025-09-27
tags:
  - bleg
  - career
  - builds
  - devops
  - debian
  - law-of-diminishing-returns
  - software-dev
  - vagrant
  - yocto
  - old-command-line-tools
  - nix
---

The cozy world of DevOps has spoiled me with tools like Ansible,
Terraform, and Packer. In the situations where I have a Linux machine
already booted up, and sometimes already connected to the Internet, I
can make things really easy on myself by slinging these tools in my
usual way for repeatable, reproducible machines that may or may not come
with the attendant headaches of immutable infrastructure (sorry, Nix,
I'm not in love with you, I'm in love with the idea of you).

As soon as I go another layer down and I actually start talking
about preparing _bespoke_ Linux images, all of this evaporates. This is
a curious and lucrative gap in the marketplace to me, probably because
the kinds of companies which need to do this kind of work are usually
already behemoths in their own way.

Still, I can't help but wonder: Why is Yocto the best tooling we have
to offer in this area? I don't mean that as a knock to the Yocto project
which seems to fantastically achieve the goals it sets out. But much
like how I prefer to run KVM through Virtualbox even though I could do
everything purely through it and QEMU, I wonder why nobody has set up,
e.g., a good Yocto CI/CD base image pipeline for custom hardware
devices. It feels like an eight-figure market opportunity if done
capably, and a nine-figure market opportunity if done well (driven by
the needs of highly regulated industries like, oh, medical, aerospace,
automotive...).

Do these companies really just pay $300,000 per senior Linux engineer
to thug it out internally? Do they never share their work? I find myself
unsure of who to even ask about this. I come to you, dear reader, for
enlightenment. Please tell me what you know if you have the time. You
can use whatever means works for you to contact me.
