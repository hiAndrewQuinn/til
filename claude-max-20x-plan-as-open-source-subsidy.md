---
title: Claude Max 20x plan as open source subsidy
date: 2026-06-30
tags: 
- against-entropy
---


It is widely known that the Claude Max 20x plan
doesn't buy you just $200 worth of API credits
in a slightly more convenient format. It's closer
to ... well, an order of magnitude is what I have
heard, but I've heard other people say it goes up
to $5000-6000 worth of API credits. In any case,
it's a lot. What's the catch?

Enterprise. Enterprises (not startups usually)
shy away from Claude Max 20x because it has certain
data retention properties, etc. that they consider
too commercially valuable to waive away, and so
instead they either work through the API directly
or use something else like Gitthub Copilot for
Business.

In a way we can see this as Anthropic subsidizing
all software that is *not* enterprise and closed
source. What works really well for this? *Open*
source software!

There are all kinds of reasons why Anthropic might
want to subsidize open source specifically, of
course. One I find less convincing than you might
imagine is the flywheel effect. It is true that
more open source in the world means more code
to train the next model on, but it's also true
that if the majority of this code is being built
through Claude Code anyway, then Anhropic already
possesses that data stream, and in fact a much
richer superset of it: The entire back-and-forth
that *led* to the final produc.

I suspect some companies of some sophistication
are test driving a two-tiered strategy here: Open
source everything that isn't core to the business
but is helpful, so that they can safely develop
with the much cheaper Max 20x plan, and then only
make actual API calls for the small truly proprietary
or trade secret-y parts of the org. (I say this
making no claims as to whether Anthropic's ToS
actually allows this.) 

Of course, it may be the case that most code
in a private enerprise can't be safely open
sourced to take advantage of this cost
optimization. One can dream.
