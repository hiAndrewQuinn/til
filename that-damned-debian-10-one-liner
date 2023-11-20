---
title: That damned Debian 10 one-liner I always need to let me `sudo`
date: Mon 20 Nov 2023 09:15:51 AM EET
tags:
- debian
- linux-groups
- one-liners
- shell
---

```bash
su -c "$(whereis adduser | awk '{print $2}') $(whoami) sudo"
```

In all its glory! For **Debian 10 and up**, because Debian 10 is where the `sysv` to `systemd` conversion became totalizing.

Let's break down quickly why each part of this is needed:

1. Since we are trying to add ourselves to the `sudo` group right now, we obviously can't use `sudo`. Enter `su -c` to switch to `root`, run a command, and then switch back out.
2. `whereis adduser` instead of simply `adduser` because `adduser` is no longer in the `$PATH` by default anymore.
   - Tempted to try `which adduser`? No dice -- `which` only gets you things in the `$PATH` as well:
     ```bash
     andrew@debian-10:~$ which adduser    # zip, zilch, nada.
     andrew@debian-10:~$ whereis adduser
     adduser: /usr/sbin/adduser /etc/adduser.conf /usr/share/adduser /usr/share/man/man8/adduser.8.gz
     ```
3. `awk` to rip out `/usr/sbin/adduser`, which - thankfully - at least is still executable.
4. `$(whoami)` because your name might not be `andrew`!
