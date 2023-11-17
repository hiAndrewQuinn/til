---
title: Multi-line string literals in Fish
date: Fri Nov 17 09:41:43 PM EET 2023
tags: 
---

The Fish shell has... _interesting_ syntax for multi-line string literals. The
only way I can reliably remember is to literally write them as multi-line
literals, which does make a certain kind of brutalist sense:

```fish
function kiitos
  set thankyou '---
kiitos kaynnista
ja tervetuloa uduelleen
---'
  echo $thankyou
end

kiitos
```

reliably prints

```text
---
kiitos kaynnista
ja tervetuloa uduelleen
---
```

, but man does it look funky to me.
