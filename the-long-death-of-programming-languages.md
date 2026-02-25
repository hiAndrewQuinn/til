---
title: The long death of programming languages
date: 2026-02-25
tags: 
- automation
- career
- complementary-goods
- design-affordances
- cross-compilation
- law-of-diminishing-returns
- principal-agent-problems
- simple-suboptimal-solutions
- software-management
- software-dev
---


I wrote my first Clojure program in anger a few months ago. 
Only, it's not accurate to
say that I wrote it; AI did most of the writing, and I directed it on what my 
design goals were and why. 
Architecturally, you could call it was a stateless
[anti-corruption layer](https://learn.microsoft.com/en-us/azure/architecture/patterns/anti-corruption-layer),
yapping between some REST endpoints and some ancient proprietary serialization.

I had never written a Clojure program of nontrivial size before. Indeed I had 
barely touched any Lisp at all
since working through [SICP](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/index.html) 
during a high school summer vacation, over a decade ago.
That didn't matter. Much more important was emphasizing certain invariants from
the start, like the aforementioned statelessness, which made it very easy to 
unit and integration test, which was the true challenge.

If you had asked me to do this in 2020, I would have told you it was impossible.
Not due to any lack of skill on my part, but just because I had learned through
attrition there were a million and one little quirks to even the most regular
programming language that you had to imbibe before you could be reasonably
productive in it. Here in 2025, that's basically not a concern anymore. I don't
know any Clojure trivia outside of what an uberjar is, and I don't want to know.

If my decisions in 2025 about which PL to use are being driven 90+% by
quirks of my deployment environment, what I think will play nice with the rest
of the quasi-enterprise I am surrounded by, then I don't think it's crazy to say
that in 2030 we just might not care at all about which programming language is
actually being used "under the hood" for anything.

For the record, I think
[Lean](https://lean-lang.org/)
has the highest chance of becoming the next lingua franca. Formal verification
is suddenly cheaper than it has ever been in the past. Many
issues in software engineering can, I suspect, be avoided by letting the LLMs 
write formally-provable components, that connect and compose with one another
in formally-provable ways. If and where I'm wrong on that my bets are on
[Rust](https://rust-lang.org/) continuing to eat everything in sight.
