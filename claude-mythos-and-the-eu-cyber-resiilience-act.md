---
title: Claude Mythos and the EU Cyber Resilience Act
date: 2026-04-16
tags: 
- claude
- cra
- cybersecurity
- llm
- econ-flavored
- devops
---


As of writing this I can find
[no Hacker News comments containing both the words "mythos" and "CRA"](https://hn.algolia.com/?dateRange=all&page=0&prefix=true&query=mythos%20%22CRA%22&sort=byDate&type=comment),
which suggests I might have a first-mover advantage
in writing something interesting. At last!

Anthropic announced Claude Mythos Preview on 2026-04-07.
Supposedly it was asked to discover thousands of zero-days
across many software packages, a task which it acceded to,
but not before printing the ominous message 
["I can be both your angle or yuor devil"](https://knowyourmeme.com/memes/i-can-be-your-angle-or-yuor-devil).
This scared them so they made the model
[VIP only](https://www.anthropic.com/glasswing).
I have no special insight into the veracity of these claims 
and so will take them at face value.

Nor do I have special insight into the mindsets of the folks
behind the European Union's
[Cyber Resilience Act](https://eur-lex.europa.eu/eli/reg/2024/2847/oj/eng), but I have to imagine some of them are hearing
this news and beginning to wonder about the possible economic
implications. On 2026-09-11, 
aka *less than 6 months from now*,
mandatory vulnerability and incident reporting obligations
go online and become legally enforceable across the EU,
with potential fines up to 15 million euros or 2.5% of global
annual turnover for noncompliance.

This poses some ... *interesting* new challenges. The first-order
effect of a model like Mythos is that the mean number
of actively exploited vulnerabilities and incident reports
one might have predicted to be filed per day or per week 
last year has just shot way up. 
Even if you were already bullish
on AI capabilities in cybersec growing stronger (as I was
when I took my current DevSecOps role) your EV for this number
should still go up because now there is *actual proof* that
AI capabilities have hit that threshold. 

What's downstream of that? Regtech startups like 
[Regulus](https://goregulus.com/)
and
[CRA Evidence](https://craevidence.com/)
might hockey stick if they prove they're up to the task.
Many EU software companies will likely *fail* to keep up with
all of this and shutter their doors. The ones that remain
will probably raise their prices significantly in order to
keep feeding whatever Mythos-class cryptid tamers they employ
to keep them in business. The end consumer ends up paying more
money and being safer - potentially a lot safer. 
Customers in the US and Asia might start buying European
because it signals some baseline of cybersecurity quality,
or they might *stop* buying European if it turns out 
cybersecurity is overvalued at this margin.

By 2027-12-11, full CRA enforcement comes into effect. 
What does that mean? A lot of things, but the one I find most 
interesting is *mandatory* free security updates. Manufacturers 
of products with digital elements must define a "support 
period" of at least *5 years* during which free security 
updates must be provided. Put simply, I have no idea how 
you competently price in 5 years of "free" security updates 
in a world where cybersecurity capabilities on both offense 
and defense are increasing exponentially. It was hard 
enough to price this kind of thing in in a pre-AI world.

Ultimately perhaps the best way to model how these two events
intersect is simply to say that Mythos will make the CRA just
like itself, only more so. If you predict the CRA will lead to
the demise of non-subscription software and hardware in the
EU as we know it[^1], Mythos should make it look more like a
Permian extinction event. If you think EU engineering cultures 
are going to embrace further dependency minimalism, Mythos 
should make them go all the way and just one-shot everything 
with the Go stdlib whenever possible so their SBOM can fit 
inside a Hallmark card. 
I'm mostly surprised nobody has 
brought this conversation to the dinner table so far. It 
seems *really* obvious these two things are going to 
collide in some crazy ways.



[^1]: This may sound contradictory, but it flows from the requirements. If you want to sell 1 million EU dishwashers, and you don't want to go full-analog because e.g. there is no possible way to meet your energy efficiency requirements that way, you will also need a way to *patch* those 1 million dishwashers, as well as a way to *fund* that patch. Doubling or tripling your up-front dishwasher price is a terrible idea for all kinds of consumer psychology reasons, and also because you'll be undercut by firms too stupid to realize they will go out of business by pretending everything is business as usual. But a 25-euro-a-month subscription to WashPlus lets you deliver over-the-air automatic updates - tens a day, perhaps, if Mythos lives up to the hype - in a way which allows the SaaS product line to register itself as nearly pure profit, and the cybersecurity line's nearly pure loss to be offset gracefully. There may be other approaches we'll see; maybe offline dishwasher manufacturers will try a hybrid approach where they give the customers a flashed USB stick to plug-and-play. But then what happens when one enterprising malcontent plugs their laptop into the dishwasher and directs GLMythos-5.2-Abliterated-Heretic-UnknownPleasuresRemix to "vivisect"? What if the SeL4-based RTOS you spent millions developing ahead of time turns out not to be so well protected after all? Seems awfully complicated in some ways compared to just making more money every month, with the option to dynamically increase or decrease the subscription price in response to market forces at the drop of a hat. I would predict the long-run equilibrium to eventually settle back down to "the absolute smallest, most well-defended microkernel you've ever seen" but the path there might be very rocky due to that not really being a core competency of ... well, any country on Earth, I guess. 

