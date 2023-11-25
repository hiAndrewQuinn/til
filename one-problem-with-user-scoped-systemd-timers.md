---
title: One problem with user-scoped `systemd` timers
date: 2023-11-26
tags: 
- systemd
- debian
- automation
- linux
---

I've discovered one big downside of [putting `systemd` times into `~/.config/systemd/user/`][1]: They stop running when you log out.

Two ways around this problem:

1. Bite the bullet, and install the timers into `/etc/systemd/`. This means giving up [chezmoi version control](https://www.chezmoi.io/), making the overall system more snowflake-y. I'm not crazy about it.
2. Remote in with `tmux`, instead of ever logging out, just use `C-b d` to detach from the session. 

I'm going with #2. The lead developer of `ktty` is known not to like `tmux`, so there's probably a way to detach long-running SSH sections inside of `kitty` itself -- but I haven't found it yet. Have you? 
