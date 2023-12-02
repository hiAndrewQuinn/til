---
title: 'Outage postmortem: Why didn''t SelkoArchive get today''s news?'
date: 2023-12-01
tags: 
- postmortem
- selkouutiset-archive
- automation
- git
---

For some reason, my [daily archive of Finland's "clear news" broadcast](https://hiandrewquinn.github.io/selkouutiset-archive/) didn't work today. Why not? TL;DR: Just a Git snafu.

Quick recap of the archive:

- There are 3 Git repos:
  - [selkouutiset-scrape](https://github.com/hiAndrewQuinn/selkouutiset-scrape) simply scrapes the HTML [https://yle.fi/selkouutiset](https://yle.fi/selkouutiset) at 6 PM every day via a Github Action.
  - [selkouutiset-scrape-cleaned](https://github.com/hiAndrewQuinn/selkouutiset-scrape-cleaned) pulls in `scrape` and turns it into a stack of translated, properly-named Markdown files, by the magic of shell scripts, `systemd` timers, and a tiny VM in a datacenter somewhere.
  - [selkouutiset-archive](https://github.com/hiAndrewQuinn/selkouutiset-archive) wraps `scrape-cleaned` into a comfy Hugo theme, again with the magic of `systemd` timers and a tiny VM, and publishes it to Github Pages.

Which part of the chain broke?

- `scrape` definitely didn't brake. It's intentionally as simple as possible.
- `scrape-cleaned` would seem like the likely subject, but it actually pulled and created its Markdown just fine yesterday.
- By process of elimination, it must be `archive` - and it was!

The fun thing about noncommercial projects is I can do all of my work out in the open without business ramiffications, which means I can even point to the exact commit that broke things: commit [3f23c17](https://github.com/hiAndrewQuinn/selkouutiset-archive/commit/c21799fcba3de7306d91ffa42cbb803453f23c17), where I changed the language selector from a static space-separated list of HTML into a neat little `<select>`.

How did this break things? I just didn't have `git config rebase.ff true` on on the VM! I caused the local and remote branches to diverge, and so my VM complained every minute for 2 days until I noticed the issue.

Great! My implicit challenge for this project was "No databases, only Git." This is the smallest of the small, so my [reliability expectations are minimal anyway](https://www.kalzumeus.com/2010/04/20/building-highly-reliable-websites-for-small-companies/), and much like learning more Vim, learning more Git is a gift that keeps giving in this industry.
