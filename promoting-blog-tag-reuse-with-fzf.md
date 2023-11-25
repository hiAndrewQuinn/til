---
title: Promoting Blog Tag Reuse with `fzf`
date: 2023-11-25
tags: 
- automation
- shell
- fish
- fzf
- meta
---

Some more updates to [the main repo](https://github.com/hiAndrewQuinn/til) of this TIL site today, in particular I have added a new `fzf-tags.fish` script.

`til` uses this script to

1. Scrapes all the YAML `tags:` frontmatter from all current Markdown posts,
2. Puts me into a [multi-select](https://github.com/junegunn/fzf#using-the-finder) `fzf` menu containing them, and
3. Puts anything I select into the `tags:` of the new blog post.

Tags form natural breadcrumb trails throughout a blog as it grows organically over time. Many an afternoon have I spent reading one or two particular tags of interest from a prolific blog. But, if you don't remember to reuse the tags in the first place, you'll never build the trail in the first place.

