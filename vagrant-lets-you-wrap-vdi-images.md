---
title: Vagrant lets you wrap VDI images
date: 2023-12-05
tags: 
- builds
- linux
- automation
- devops
- vagrant
- virtualbox
- yocto
---

[At work](https://teleste.com/) I'm currently experimenting with using [Vagrant](https://www.vagrantup.com/) to automate getting an entire local network of our tiny embedded Linux systems running all on my local box.

Alas! One of our devices uses a custom Yocto distribution! But wait, we have scripts to run these as VDI images, and apparently that's enough for Vagrant to get to work!

```bash
vagrant package --base my-virtual-machine
```

Further reading materials for future me: [Creating a Base Box](https://developer.hashicorp.com/vagrant/docs/boxes/base), and the [Box File Format](https://developer.hashicorp.com/vagrant/docs/boxes/format).
