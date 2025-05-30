---
title: Consider the cronslave
date: 2025-05-30
tags: 
- automation
- cronjobs
- cost-optimization
- daily-life
- debian
- software-management
- simple-suboptimal-solutions
- shell
- principal-agent-problems
- personal-life
- old-command-line-tools
- tiny-core-linux
- raspberry-pi
- cronslave
---


As a nerdy, working-class kid who grew up in the 1990s, knowing what time it
actually was was a luxury I rarely had access to before I was 12 or so and my 
parents finally got an Internet connection with its attendant link to the 
Network Time Protocol. If you had told me I could have not just a watch but an
entire *machine* that

1. Never lost the time,
2. Did what I wanted, how I wanted it, and
3. Could be programmed to do what I want, how I want it *on a schedule*,

I would have had to substantially revise my Christmas wishlist.

Such technology is ubiquitous today, of course. Many computer programs called 
'daemons' seek rent on your precious electrons in exchange for granting you
unique powers and abilities, and this was both one of the earliest and one of 
the most powerful such abilities to emerge. The best-known of these programs
is called [cron](https://en.wikipedia.org/wiki/Cron), and individual tasks like
"email me every night at 3 AM" is called a "cronjob". Many other programs do
more or less the same thing, with some enhancements here or there - I
particularly like what
[systemd's timers](https://wiki.archlinux.org/title/Systemd/Timers)
can give you - but the terms "cron", "cronjob" and "crontab" escaped
containment long ago and are now used to refer to this general class of
daemonic entities.

A **cronslave**, then,
is simply a personal computer you keep running more or less 24/7
for the primary purpose of running cronjobs.
It is a term which springs Athena-like out of the head of childhood me.
There are [many, many services](https://news.ycombinator.com/item?id=34056812)
which will host cronjobs for you for free, but `cron` itself is a mercifully
slim program, and a $50 Raspberry Pi will happily run dozens or even hundreds
of cronjobs for you in parallel for years to come.

The possibilities of what you might want to actually do with your cronslave are
limited only by your imagination. Shell scripting *used* to be a bottleneck, but
LLMs turn out to be a perfect use case for bashing (heh) out 50-100 line
scripts complete with logging and error handling.
Want phone notifications? Put a `curl` to
[ntfy.sh](https://ntfy.sh/),
subscribe on your phone, and bam - updates every hour on the hour. Want to
[archive a website daily](https://hiandrewquinn.github.io/selkouutiset-archive/)?
Nothing's stopping you from
[git scraping](https://simonwillison.net/2020/Oct/9/git-scraping/)
the site, and maybe even running it through a
[pandoc-and-perl pipeline](https://github.com/hiAndrewQuinn/selkouutiset-scrape-cleaned/blob/master/process.sh#L393-L400)
to clean it up into nice, easy to use Markdown. 
How about automating a backup with
[rsync](https://en.wikipedia.org/wiki/Rsync)
or its less civilized cousin
[rclone](https://en.wikipedia.org/wiki/Rclone)?

Consider setting up a cronslave. It's easier than you think, and you would be
surprised how many things become easier when you have a tiny always-on box
sipping 50 cents of electricity a year in exchange for *mastery of time*.
For what it's worth, I run
[Tiny Core Linux](http://tinycorelinux.net/downloads.html)
and use the
[BusyBox cron implementation](https://wiki.alpinelinux.org/wiki/Cron),
but I'm a tryhard. Good old Debian will do everything you want for
a fraction of the setup time.

