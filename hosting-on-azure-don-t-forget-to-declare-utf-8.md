---
title: Hosting on Azure? Don't forget to declare UTF-8
date: 2023-11-22
tags: 
---

For a long time after [moving my website from Netlify to Azure](https://andrew-quinn.me/azure/), none of my fancy emoji or weird umlaut characters would display properly. Today I fixed that by popping back into the the Hugo theme I built off of [minimum-viable-hugo](https://github.com/Siilikuin/minimum-viable-hugo) and adding

```html
<meta charset="utf-8">
```

to `themes/minimum-viable-hugo/layouts/index.html` and `themes/minimum-viable-hugo/layouts/partial/head.html`. (There's probably a way to intimidate [Azure Static Web Apps](https://learn.microsoft.com/en-us/azure/static-web-apps/overview) into using UTF-8 by default too, but I didn't bother to look.)

Amateur mistake, I know. What's more interesting is _why_, in an era where [UTF-8 is and *should be* everywhere](https://utf8everywhere.org/) anyway, Microsoft still refuses to default to this, setting UTF-16 Little Endian as the deafult in programs [as basic as Notepad](https://stackoverflow.com/a/13895033).

The answer is legacy. Microsoft has always been a business-first company, and a lot of business gets done in the CJK (Chinese-Japanese-Korean) character sets. So they actually hopped on the "ASCII isn't enough" bandwagon faster than most: Windows NT supported [something like](https://en.wikipedia.org/wiki/Universal_Coded_Character_Set) UTF-16LE since at least 1996. They didn't stop pushing UTF-16 actively until 2019!

Bonus tidbit: **If you can't `grep` through a CSV files, check its encoding with `file`.** CSVs are the [type O negative](https://www.oneblood.org/media/blog/target-your-type/o-negative-blood-type.stml) of business data. If at any point a Windows development environment was involved in the making of your CSV, `iconv -f UTF-16LE -t UTF-8 it.csv` first. (Or just use [ripgrep](https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md#file-encoding).)

