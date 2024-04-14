---
title: "Check my math - NixOS vs the Most Complicated Program on Earth (MCPOE)"
date: 2024-04-14
tags: 
- automation
- blegs
- math
- the-medium-is-the-message
- builds
- nix
- nixos
- napkin-calculations
---

Imagine you had the **Most Complicated Program On Earth (MCPOE)**, with 
1,000,000 dependencies. 

Every dependency must be build correctly *exactly right* or the MCPOE will 
fail to compile. MCPOE's 10x dev team chose their packages so 
that each dependency has only a 1/1,000,000 chance of having something go wrong
when you're installing them - maybe a whitespace character snuck into the wrong 
build script, maybe 
[solar wind hit the build computer](https://www.bbc.com/future/article/20221011-how-space-weather-causes-computer-errors).  What are the chances that you will install MCPOE correctly?

Is it [about 36 percent?](https://www.wolframalpha.com/input?i=%281+-+1%2F1000000%29%5E1000000)

Each dependency in isolation is 99.9999% reliable. But you need *all 
million dependencies* to be reliable *at the same time*. If the dependencies 
were only five-nines reliable, our chances of success would then plummet
[plummet to about 1 in 25,000](https://www.wolframalpha.com/input?i=0.99999%5E1000000+as+a+percent). 

If so: Compare to using Nix hashes to precisely pin down dependencies. There are 
(26 lower case letters + 10 numerals)^(33 characters) ≈ 10^51 unique possible 
Nix hashes, or about ten times as many 
[atoms as there are on Earth](https://sciencenotes.org/how-many-atoms-are-in-the-world/). 

*Fifty* 9s of reliability would then be one upper bound for our end-to-end
dependency success.
A successful MCPOE build with fifty 9s
[would then be virtually certain](https://www.wolframalpha.com/input?i=%281+-+1%2F10%5E51%29%5E1000000), 
somewhere far north of 1 trillion times more likely than you, dear reader, 
*not* being struck by lightning in the next minute (about 1 in 10^11 or so).

Does that sound correct?
