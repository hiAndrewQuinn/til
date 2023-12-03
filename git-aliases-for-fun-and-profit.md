---
title: Git aliases for fun and profit
date: 2023-12-03
tags: 
- haskell
- git
- automation
- shell
- productivity
- builds
---

[haskell-kata](https://github.com/hiAndrewQuinn/haskell-kata)'s Quickstart now has this neat little ditty at the start:

```bash
git config --local alias.build '!sh -c \'for file in *.hs; do ghc -o "${file%.hs}-bin" "$file"; done\''
git build
```

Git is the gift that keeps on giving. I was on the hunt for a subdirectory-scoped alias, and I just discovered this incredibly flexible way to create new Git subcommands.

History: 2 years ago I read through the 1200 page behemoth [_Haskell Programming from First Principles_](https://haskellbook.com/). (Recommended!) I walked out of that with some 1300 [Anki flashcards](https://ankiweb.net/) that I have been chewing through ever since.

I knew from the beginning I was learning Haskell 100% out of curiosity, not for professional reasons. So I expected a long lead time on the median card showing up. I added a few cards from [Gabriella's wonderful desugaring article](https://www.haskellforall.com/2014/10/how-to-desugar-haskell-code.html) as well. When they started appearing now, 2 years hence, I realized it will make much more sense to me if whenever they show up I actually code out a quick Haskell kata to make sure I actually grok the concept and not just Gabi's example. Hence the kata.
