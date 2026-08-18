---
title: PAHG and the craft of one-shotting internal dashboards
date: 2026-08-18
tags: 
- against-entropy
---


I find a lot of my better ideas for projects come from taking concrete problems
I bash my head against in the workplace, generalizing from them to find the right 
shape of future solutions to use, and then building those general solutions in the
hope that the amortized time spent pays off over the future decades of my career
in terms of less time wasted, higher salaries earned, a more pleasant working
environment, etc. 

Even if they don't, it leaves a valuable breadcrumb trail of where
my interests and skillset lie for future potential employers, and gives me fodder
for posts like this one. People who are already employed in
software *vastly* underestimate the ROI on this very unique property of our industry.
[Patrick Mackenzie, aka patio11 on the internets, makes this point at great length in "Don't End the Week with Nothing"](https://training.kalzumeus.com/newsletters/archive/do-not-end-the-week-with-nothing)[^1]. Emphasis my own:

    One of the reasons developers have embraced OSS so much is because it gives you **portable capital between companies**: if your work is sitting on Github, even if you leave one job, you can take it with you to your next job. Previously this happened pretty widely but generally under the table. (Is there any programmer who does not have a snippets folder or their own private library for scratching that one particular itch?) One of the great wrinkles that OSS throws into this is that OSS is public by default, and that's game changing.
    
    Why? Because when your work is in public, you can show it to people. That's often the best way to demonstrate that you're capable of doing work like it.

    Telling people you can do great work is easy: any idiot can do it, and many idiots do. Having people tell people you do great work is an improvement. It suffers because measuring individual productivity on a team effort is famously difficult, and people often have no particular reason to trust the representations of the people doing the endorsements.
    
    [...] 

    Work you can show off, though, is **prima facie evidence of your skills**. After your portfolio includes it, your ability to sell your skills gets markedly better. Given that most people's net worth is almost 100% invested in their personal capital (i.e. if you're a young engineer the net present value of all future salary absolutely swamps everything in your bank account), this is a fairly radical improvement in your present situation for not a very radical change in how you go about things.

You can stop reading here if you're only interested in generic career advice.
Merely getting that snippet in front of your eyes has made me happy, thank you.

---

The [PAHG template](https://github.com/hiAndrewQuinn/pahg-template), where PAHG
stands for Pico.css, Alpine.js, HTMX, and Go, is an example of this.
Everything about it is driven from the following constraints.

1. I want some kind of read-heavy, ideally read-only, dashboard.
2. I want updates to be both live, and [speed-of-thought fast (~0.1 s)](https://andrew-quinn.me/modern-shell/).
3. I want to compile everything down to a single binary I can just stick on a server I control somewhere. `nohup ./dashboard serve &` or bust!
4. I *don't* want it to have a large maintenance cost. API key rotation should dominate the maintenance cost budget after initial deployment.

These are not coincidentally needs that a lot of businesses have! To be honest
if you're in this position your best bet is usually mocking up the dashboard first
in Excel and only turning it into an actual hosted web page if you really have to.
But there are times where this might not be possible.[^2] 

It turns out that all four of these components have a ton of information written
about them on the Internet, especially HTMX and Go, and especially using HTMX and
Go together. And this means that PAHG template is, almost unintentionally, a perfect
springboard to hand off to an LLM and say "One shot a dashboard for me that collects
data from the following sources: insert sources here".

This was not my intention when first creating the PAHG template, but I am very
pleased by it.




[^1]: Fun fact, the writing on https://training.kalzumeus.com/ is actually my favorite patio11 writing on average. I'm not going to pretend like all of it is evergreen for 2026 but there are a ton of stealth bangers in there if you want to waste an afternoon thinking about the business of selling software.

[^2]: This might actually be a juicy tidbit if you are in the business of *providing* metrics to other businesses who pay you, but don't say you got it from me. [The world runs on Excel.](https://benjamintseng.com/2023/10/the-world-runs-on-excel-and-its-mistakes/) But this cleverly diguised [visual-first functional programming IDE](https://arxiv.org/pdf/2309.00115) has some inherent limitations. For example, POST requests. In Excel, you can make authenticated GET requests against a web server; or you can make anonymous POST requests against a web server; but to my knowledge making authenticated POST requests against a web server is at minimum an exercise in misery and in the median case totally impossible. So, if you are a large B2B SaaS provider, and you are worried that your customers might be using your lavishly well-documented API to just scrape all the data into Excel and cut you out as the dashboard middleman you, your plugin authors who rely on you for your income, etc. want to be, you might just ... consider using POST requests instead. You may even *intentionally start* with authenticated GET requests to get them hooked and then transition to POST requests for the additional flexibility they give you down the line. Again, you didn't hear it from me, and I'm no Excel god here.
