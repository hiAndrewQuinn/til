---
title: Getting `fzf` to print the preview pane
date: 2023-12-06
tags: 
- fzf
- shell
- automation
---

`fzf` is an incredibly useful bit of software, [if someone shows you how to use it](incredibly usef). There's a lot more to it than just fuzzy-switching directories and fuzzy-searching you shell history -- it also comes with a preview pane that updates on every keystroke. Try

```bash
echo '' | fzf --preview 'echo {q} {q}'
```

and typing something to see how it works. (`{q}` is the `q`uery you type in at the bottom of the screen.)

When you start using this preview pane, you might start to use it as the _primary_ use of `fzf` for various purposes. It's really helpful! But how do you actually get the preview pane to *print* what it sees to stdout?

Turns out there's another `fzf` flag called `--bind`, which lets you do this:

```bash
echo '' | fzf --preview 'echo {q} {q}' \
              --bind 'enter:execute(echo {q} {q})+abort'
```

Now when you hit Enter, the preview pane will be returned to stdout, and `abort` will exit you out of the program. Very handy for things like [adding interactive modes to CLI programs](https://github.com/hiAndrewQuinn/finstem#interactive-mode).
