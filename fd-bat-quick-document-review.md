---
title: 'fd + xargs + bat = quick document review'
date: 2024-02-25
tags: 
- xargs
- fd
- bat
- cli
- automation
- shell
- selkouutiset-archive
---

![output](https://github.com/hiAndrewQuinn/til/assets/53230903/0573fe37-3552-464a-adc6-4458b61df612)


I've been on vacation this week, and part of what I've been up to is fixing up
the [Selkouutiset Archive](https://hiandrewquinn.github.io/selkouutiset-archive/).
Like [most](https://www.build-100-websites.fun/) of my websites these days, SA
is powered by Hugo, which means handling a lot of Markdown documents, which
means I opted to use an [intermediate Git repo as a
submodule](https://github.com/hiAndrewQuinn/selkouutiset-scrape-cleaned) to
actually store the custom-processed documents.

After a few tweaks here and there, I found myself wanting to quickly flip
through all of the Markdown documents I had generated for each news day. I
wasn't *exactly* sure what I was looking for, just that I would know it when I
saw it. So:

```bash
fd '.fi.md$' | xargs -I _ -- batcat --paging=always _
```

In the associated GIF, I don't find anything, but several times earlier this
week it helped me find `.md` files where my html2md pipeline broke in some
subtle way. Neat!
