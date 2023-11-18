---
title: No such thing as a Post-Push Hook
date: Sat Nov 18 09:17:57 PM EET 2023
tags: 
- git
- cicd
- git-hooks
- automation
---

Tonight I was hacking away at some more little automations to make this TIL nice and
presentable over at [https://hiandrewquinn.github.io/til-site/](https://hiandrewquinn.github.io/til-site/).

Git has a wonderful system called "hooks" which live under `.git/hooks/`, come loaded
with examples so you can remember how they all work, and -- surprisingly -- don't
contain a local `post-push` hook! There's post-receive, but that expects to be able
to run a script on the _server_ side -- not helpful when I'm pushing to one of
Github's many, many anonymous boxes.

Hence a workaround: `til.fish` now runs `git push && .git/hooks/post-push` instead
of just `git push`. This `post-push` is nowhere to be found in the repo itself, sadly.
Maybe I should put a `.git` inside of my `.git` to track all of my favorite hooks!

