---
title: 'wall: Broadcast message all Linux users'
date: 2024-02-01
tags: 
- linux-groups
- communication
- cli
- old-command-line-tools
---

```bash
wall "Hello, world!"
```

will send a message that looks like

```bash
Broadcast message from root@localhost (pts/0) (Sat Feb  1 14:50:14 2024):

Hello world!
```

to every user currently logged in to the system.

When might this be relevant? When you're working in a small team, by remoting into custom hardware, and constantly reflashing the device, to give everyone a heads up, for instance:

```bash
wall "Device will be reflashed in 5 minutes" && sleep 300 && ./reflash.sh
```

I'm surprised it took me over a decade of toying with Linux to learn about `wall`. Nobody ever talks about it. There are almost certainly big frustrations people have with how it works, but when it's just you, your buddy, and an SSH connection - it might be just what the doctor ordered.
