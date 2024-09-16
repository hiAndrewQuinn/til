---
title: PHP, Go, and Braindead Deployment
subtitle: Want your new language to succeed? Make it as easy to deploy as possible.
date: 2024-09-16
tags: 
- php
- daily-life
- design-affordances
- law-of-diminishing-returns
- installing-software
- simple-suboptimal-solutions
- shell
- worse-is-better
---

If you've been
[following my posts](,./php-is-web-shell/)
recently, you might have noticed that I've been working more and more with PHP
lately. As someone who was curiously allergic to
web dev as a teenager, it has been
[a strangely healing experience](../php-and-web-dev-phobia/)
for me. 

I'd like to say it's because my experiments with
[Laravel](https://laravel.com/),
the only OSS work of which I can point to is testing
[the Homestead VM's compatibility for Shell Bling Ubuntu](https://github.com/hiAndrewQuinn/shell-bling-ubuntu?tab=readme-ov-file#where-else-does-this-work),
convinced me. But no -- Laravel is *pretty sweet*, but so is
[Django](https://www.djangoproject.com/), but Django
has the advantage of using an underlying language that

1. I've been writing for 16 years,
2. Has libraries for practically everything under the sun inside *and outside* of web dev, and
3. Comes [ready out-of-the-box on Debian 12](../what-programming-languages-come-out-of-the-box-on-debian-12/).

There's also the fact that, well, I learned Django 'formally'.
[My praise](https://news.ycombinator.com/item?id=39732932)
for
[William S. Vincent](https://djangoforbeginners.com/)
and his triptych of tutorial books is even more true today than it was 3 years ago when 
I first dove into them. But PHP has one thing Python has never had, and, sadly, likely
never will: **A totally braindead deployment cycle.**

Seriously. You spin up a VM, install PHP and FastCGI, *maybe* nginx if you're feeling
frisky, and you're off to the races. You edit your `.php` files on the server directly
and reload, and the changes appear *in real time* -- this is hot reloading before hot
reloading! And, since the language is interpreted instead of compiled, in a pinch, you
can always apply your plain text Unix tools to the PHP source code itself for some
truly dark magic. You could probably create a CI/CD staging-testing-production setup
with vanilla PHP, a cronjob, and `scp`, were you so inclined, you heartless bastard.

Ultra-simple. Ultra-productive. I wish more (well, any) programming languages took the
approach PHP does to building websites.

At the opposite end to PHP on several spectrums, we have
[Golang](https://go.dev/). And yet, despite being compiled, Go is, or can be,
similarly deployed in an almost entirely braindead manner.
The command flags

```bash
CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o love-linux-amd64 
CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 go build -o love-darwin-amd64
CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build -o love-windows-amd64.exe
```

will, to the best of my knowledge, build a *fully* static binary that you
can copy right onto the platform of your choice, run, and it will *just work*,
no extra installations needed. You don't even need Go's usual C dependencies,
those are baked right into the binary by the `CGO_ENABLED` flag.

I have built fewer things with Go than I have with PHP, but it's much closer
to Python in terms of ... well, basically everything, and so I'm much more
comfortable picking up and using Go for anything which seems like it may be
nontrivial (or not a web app!).

But **Go is *miles* ahead of Python when it comes to packaging** thanks to this
design decision. It's a single binary! You can `scp` it to `/usr/bin`, and
just *call* it, and it will *work*! No more aggravating `venv`s or `poetry`s
or `pip install`s to worry about, which might not even exist in 5 years
in a way you can fetch anymore!! Hallelujah!!!


