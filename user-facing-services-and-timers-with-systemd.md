---
title: Git controlled, user-scoped, recoverable-after-install `systemd` services and timers
date: 2023-11-21
tags: 
- systemd
- cronjobs
- git-as-a-database
- chezmoi
---

# TL;DR

- `systemd` timers are a serious upgrade from `cron`. Accept no substitutes.
- `~/.config/systemd/user` lets you run _user-scoped_ timers and services,
  - in a place where you can version control them with Git easily,
    - and even keep a handy backup with [chezmoi](https://www.chezmoi.io/)!

# Story 

We had the great honor of having our friend Tri Phung
([LinkedIn](https://www.linkedin.com/in/tri-anh-phung/),
[GitHub](https://github.com/json-todd)) over for dinner yesterday. As is
often the case the conversation turned to work. I've been on
a kick of using Github Actions remotely and shell scripts + `systemd`
services/timers locally to sketch out some ideas for [new websites](https://www.build-100-websites.fun/) in Hugo.

There's just one problem: `systemd` default directory at `/etc/systemd/system`
contains timers, services, and who knows what else for _the whole system_.

- What if i just want to manage my own timers and services?
- What if I _need_ to have access to my own user-facing SSH keys, e.g. for
private Github repository access, and not whatever the 'default' systemd user
has?
- What if i want to keep them in a Git repo of their own? 
- What if I want to keep them in this Git repo _and_ have them run as my user
_and_ have restoring them after any future reinstalls of Ubuntu to be
relatively painless? (My [shell-bling-ubuntu
Repo](https://github.com/hiAndrewQuinn/shell-bling-ubuntu) suggests that,
despite my DevOps background I'm not keen on maintaining a `hosts:
localhost` Ansible file for the task!)

Luckily, there's a `~/.config` for that. The wizards at [the Arch wiki](https://wiki.archlinux.org/title/Systemd/User) prophesy

    ~/.config/systemd/user/ where the user puts their own units.

    All the user units will be placed in ~/.config/systemd/user/. If you want to start units on first login, execute systemctl --user enable unit for any unit you want to be autostarted.

Great! Let's try it!

# Experiment 1: A user-scoped `git pull` to a public Git repo every minute

We start small: A service+timer to `git pull` the latest scrape at [https://github.com/hiAndrewQuinn/selkouutiset-scrape](https://github.com/hiAndrewQuinn/selkouutiset-scrape) (a repo for recording the Simple Finnish language daily newsfeed, using [Simon Willison's Github Actions git scraping technique](https://simonwillison.net/2020/Oct/9/git-scraping/)).

Here's what it looks like:

```fish
.config/systemd/user 
❯ tree
.
├── git-pull-selkouutiset-scrape.service
├── git-pull-selkouutiset-scrape.timer
└── timers.target.wants
    └── git-pull-selkouutiset-scrape.timer -> /home/andrew/.config/systemd/user/git-pull-selkouutiset-scrape.timer
```

(`timers.target.wants` gets made after running `systemctl --user enable git-pull-selkouutiset-scrape.timer`).

And the files in question:

```systemd
# selkouutiset-scrape.service
[Unit]
Description=Git Pull Service for updating the selkouutiset-scrape repository

[Service]
Type=oneshot
ExecStart=git -C /home/andrew/Code/selkouutiset-scrape/ pull
```

```systemd
# selkouutiset-scrape.timer
[Unit]
Description=Timer for Git Pull Service

[Timer]
OnCalendar=*:*
Unit=git-pull-selkouutiset-scrape.service

[Install]
WantedBy=timers.target
```

A quick check with `journalctl --user -u selkouutiset-scrape.service` shows all is well!


```fish
Nov 21 08:29:22 andrew-XPS-13-9310 systemd[1687]: Finished git-pull-selkouutiset-scrape.service - Git Pull Service for updating the selkouutiset-scrape repository.
Nov 21 08:30:20 andrew-XPS-13-9310 systemd[1687]: Starting git-pull-selkouutiset-scrape.service - Git Pull Service for updating the selkouutiset-scrape repository...
Nov 21 08:30:22 andrew-XPS-13-9310 git[22225]: From github.com:hiAndrewQuinn/selkouutiset-scrape
Nov 21 08:30:22 andrew-XPS-13-9310 git[22225]:    b398474..ca29b90  main       -> origin/main
Nov 21 08:30:22 andrew-XPS-13-9310 git[22235]: Updating b398474..ca29b90
Nov 21 08:30:22 andrew-XPS-13-9310 git[22235]: Fast-forward
Nov 21 08:30:22 andrew-XPS-13-9310 git[22235]:  .github/workflows/scrape.yml            | 2 +-
Nov 21 08:30:22 andrew-XPS-13-9310 git[22235]:  2023/11/21/selkouutiset_2023_11_21.html | 2 +-
Nov 21 08:30:22 andrew-XPS-13-9310 git[22235]:  2 files changed, 2 insertions(+), 2 deletions(-)
Nov 21 08:30:22 andrew-XPS-13-9310 systemd[1687]: Finished git-pull-selkouutiset-scrape.service - Git Pull Service for updating the selkouutiset-scrape repository.
```

# Experiment 2: A user-scoped `git push` to a _private_ repo every minute

`selkouutiset-scrape` is the raw material I work with, so as long as that little `curl` happens every 6 hours I can always recover my "real" project (a public archive of the site in YYYY/MM/DD/ format) very quickly.

The _real_ reason I'm interested in this is I don't want to waste GH Actions minutes every time downloading and installing `pandoc`. Now let's see if we can run my [Fish](https://fishshell.com/) script, which involves committing to a private repo called `selkouutiset-scrape-cleaned`.

And... success! We now know that we can push to private repos as well.

# Experiment 3: Keeping them controlled with `chezmoi`

I use `chezmoi` for all my 'make dotfiles / [dotflags](../the-art-of-dotflags-nojekyll/) / dot-directories portable and sane' needs. Almost everything in my `~/.config` is VC'd by `chezmoi` on a private Github repo, which -- as we've just seen -- we can push to! On a timer!
