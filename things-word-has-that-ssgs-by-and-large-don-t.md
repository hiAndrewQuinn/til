---
title: Things Word has that SSGs, by and large, don't
date: 2023-11-30
tags: 
- webdev
- hugo
- static-site-generators
- documentation
- git
- version-control
- the-medium-is-the-message
---

Recommendations appreciated.

Disclaimer: Most of these make little sense in an Internet medium anyway.

- An *index*. An index simply lists the terms and topics discussed in a document, along with the pages they are listed on.
- A *glossary*. Could be as simple as a CSV file of terms and definitions, or as complex as a whole extra `glossary/` folder. 
- Related: A "Acronyms and Abbreviations" section. Even moreso than the last, this could be a simple CSV.
- A built-in *site-wide search* function. Word gets around this by having everything open at once.
- A *list of tables*. Huge if you want your dead-trees books to match your shiny new website.
- A *list of figures*. Ditto.
- A *list of referenced external documents.* CSV! Say it with me!

The reason I compiled this list was because I decided to investigate whether I could use Hugo at work to generate our client-facing documentation. Currently we are using an unholy combination of Word and Confluence, and I figured that the magic of Git might help us keep our docs updated in a more sane way. 

Then as soon as I sat down and actually tried for 15 minutes I realized just how many reasons there are why that won't work for us. Not one of the above is negotiable, alas.

