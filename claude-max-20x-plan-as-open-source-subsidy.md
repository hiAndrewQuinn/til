---
title: Claude Max 20x plan as open source subsidy
date: 2026-06-30
tags:
- against-entropy
- econ-flavored
- cost-optimization
- llm
- cloud-costs
- software-dev
- complementary-goods
---

It is widely known that the
[Claude Max 20x plan](https://www.anthropic.com/pricing)
doesn't buy you just $200 worth of
API (Application Programming Interface) credits
in a slightly more convenient format. It's closer
to ... well, an order of magnitude is what I have
heard, but I've heard other people say it goes up
to $5,000–6,000 worth of API credits.[^1] In any case,
it's a lot. What's the catch?

Enterprises — not startups, usually —
shy away from Claude Max 20x because it has certain
data retention properties that they consider
too commercially valuable to waive away.[^2] So
instead they either work through the API directly
or use something else like
[GitHub Copilot for Business](https://github.com/features/copilot).

In a way we can see this as Anthropic subsidizing
all software that is *not* enterprise and closed
source. What works really well for this? *Open*
source software!

There are all kinds of reasons why Anthropic might
want to subsidize open source specifically, of
course. One I find less convincing than you might
imagine is the [flywheel effect](https://fs.blog/flywheel-effect/).
It is true that more open source in the world
means more code to train the next model on, but
it's also true that if the majority of this code
is being built through Claude Code anyway, then
Anthropic already possesses that data stream, and
in fact a much richer superset of it: the entire
back-and-forth that *led* to the final product.[^3]

I suspect some companies of some sophistication
are test-driving a two-tiered strategy here:
open-source everything that isn't core to the
business but is helpful, so that they can safely
develop with the much cheaper Max 20x plan, and
then only make actual API calls for the small,
truly proprietary or trade-secret-y parts of the
org. (I say this making no claims as to whether
Anthropic's Terms of Service actually allows this.)[^4]

Of course, it may be the case that most code
in a private enterprise can't be safely open-sourced
to take advantage of this cost
optimization. One can dream.

[^1]: The $5,000–6,000 figure is a community estimate based on comparing the Max plan's observed compute allowance against API pricing at Opus-level token rates. The math is fuzzy because rate limits, context windows, and tool-use overhead all affect the effective multiplier — the honest answer is "somewhere between 10× and 30×, depending on what you're doing and which model you're calling." That's still a remarkable deal, whether or not you ever actually hit the ceiling.

[^2]: The specific worry is usually some combination of: uncertainty about whether Anthropic trains on Max plan conversations; the absence of enterprise-grade DPA (Data Processing Agreement) provisions in the consumer terms; and legal exposure if confidential customer data or trade secrets ever land in a context window. The irony is that the same concerns apply equally well to the raw API used without proper contractual safeguards — which smaller companies often do anyway, sometimes unknowingly.

[^3]: This is subtler than it first appears. Pre-training on raw code teaches syntax and structural patterns. The conversation stream captures something far more valuable: *intent*. You can see what the developer wanted, what the model proposed, why the human pushed back, and what the final synthesis looked like. That is closer to labelled reasoning data than raw code, and it arrives essentially for free as a byproduct of the product being used. There is [a separate argument](/claude-code-disproportionately-benefits-those-who-touch-type/) that Claude Code already advantages a certain kind of developer — the corollary being that the more extensively developers use it, the richer Anthropic's training signal becomes, flywheel or no flywheel.

[^4]: The equilibrium here is interesting. If Anthropic wanted to close this arbitrage, they could add a commercial-use restriction to the Max plan that does not apply to open source projects. They appear not to have done this — which is itself a signal. Either they have not noticed, they do not care, or they actively *want* open source to benefit. Given the [principal-agent dynamics of AI-assisted enterprise development](/ai-slop-grenades-and-the-principal-agent-problem/), deliberate subsidy seems at least as likely as oversight.
