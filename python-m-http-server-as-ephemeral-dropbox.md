---
title: "`python -m http.server` as ephemeral Dropbox"
date: 2025-01-21
tags: 
- python
- cli
- todays-lucky-10000
---


Ever need to download a file from a server -- or get
someone *else* to download a file from a server, who
may not be comfortable with or should have access to
`scp` or `sftp`? 

Turns out, if you have Python installed -- and
[you probably do](https://hiandrewquinn.github.io/til-site/posts/what-programming-languages-come-out-of-the-box-on-debian-12/) -- 
it comes with a handy one-liner file server for just
such an occasion:

```bash
python -m http.server 12345    # or whatever port you prefer
```


Then to close the server, just `Ctrl+C`.

Notice too that the webserver starts by default, at least
on my machine, on `0.0.0.0`. That means that *every*
network interface will point to it, not just
`localhost`. 

If you have ever wanted to share a file for
one-time usage with another device over your local
household's LAN, with a family member, for instance,
this can make an excellent option.
Have them try whatever
`192.168.x.y:12345` is suggested by the output of your
local `ifconfig`, I mean, `ip a`, to start, and season
to taste.

This is my actual, personal use case for it.
Surely no one would be crazy
enough to run the default `http.server` in production...
Would they? 😉
