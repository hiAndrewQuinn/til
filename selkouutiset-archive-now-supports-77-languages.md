---
title: Selkouutiset Archive now supports 77 languages
date: 2023-11-28
tags: 
- hugo
- webdev
- i18n
- speed
---

[Example from yesterday's news.](https://hiandrewquinn.github.io/selkouutiset-archive///2023/11/27/) Count 'em yourself -- there's 76 of them there.

Mass i18n efforts like this are I think an underappreciated benefit of what static site generators like Hugo can give you. Actually, *especialy* Hugo -- it's multi-language support is very good, like darn near everything about the platform once you get past the initial learning curve.

Another underappreciated benefit: When building HTML pages is fast, you can afford to build _a lot_ of them. A quick `hugo && cd public/ && fd html | wc -l` tells us that there are about 2700 HTML files on the site, which Hugo builds in under 3000 ms on my machine. The [Github Action run](https://github.com/hiAndrewQuinn/selkouutiset-archive/actions/runs/7009764040/job/19068916472) which built the site as of today took a glacial 35 seconds by comparison.

I have about 2 months of news articles scraped so far, so I'll hit the "takes a minute on my local machine" mark in about 3 years at this rate. At that point I'll likely switch to running `hugo` on my local machine and pushing the `public/` directory to its own Git repo instead of building it via Github Actions. A little shift-left goes a long way.
