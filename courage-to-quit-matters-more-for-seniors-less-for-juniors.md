---
title: '"Courage to quit" matters more for seniors, less for juniors'
date: 2025-11-29
tags: 
- career
- communication
- first-job-advice
- heuristics
- law-of-diminishing-returns
- personal
- personal-life
- principal-agent-problems
- time-management
- todays-lucky-10000
- worse-is-better
---


As a teenager first getting into computers in the late 2000s I spent a lot of 
time reading old
revered tomes like
[ESR's *The Art of Unix Programming*](https://www.catb.org/~esr/writings/taoup/html/)
and
[SICP](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/index.html)
.
If present-day me were to isekai back in time and lose all of the technical
knowledge I had but retain my current instincts, however, I would have left
all of this on the table and just built a terrible new automation tool for
[the surprisingly scriptable MMORPG I was into](https://www.kingdomofloathing.com/login.php?loginid=09ca9334301941af8f94438812a5e6f0)
in PHP 5, with as much disregard for clean code and security practices 
that I could muster[^1].
Then I would have put that tool online, continued to add new features to the
ball of mud, and kept it running for 5-10 years before my first post-college
interview. And then the vibe that would come across is less "He's an egghead,
and we like that, but we really need someone who actually does things" and
more "He's a meathead, but inside of that meathead is an egghead waiting to
be revealed. We need this kind of junior dev yesterday."
I would have done this even though
[an objectively far superior tool](https://github.com/kolmafia/kolmafia)
had already existed for quite some time,
making this project "feel like" dead weight in the wide world of software!
But why?

A picture is worth a thousand words. *Any* kind of technical, concrete
project that obviously contains custom business logic you had to schlep 
together yourself is an enormously positive signal to any reasonable tech
employer. This is true for many reasons but the one I want to hone in on is
*false positive rates*. 

- **True positive**: This junior developer is good at development, and 
  perhaps even good at the specific development we do. They may even be the 
  best junior developer we have met in our hiring window. We will hire them.
- **True negative**: This junior developer is probably not the best junior
  developer applying for this position, and they may not know much about what
  they claim to do in general. Pass.
- **False positive**: Damnit. We thought this junior had what it took, and he
  has been here for six months now and has done nothing but take up space.
  We are out tens of thousands of dollars, maybe *hundreds* of thousands,
  with nothing to show for it.
- **False negative**: What do you *mean* you passed up the guy
  [who wrote Homebrew because he couldn't invert a binary tree](https://www.thesecretdeveloper.com/blog/why-google-wouldnt-hire-max-howell-and-why-thats-a-good-thing-for-software)!?

Employers are embarrassed by false negatives, but all it means is you passed
up the obviously great for the merely good. Your firm can live to fight 
another day even with a very high false negative rate.

Employers are *terrified* by false positives. They actually do want, and think
it is reasonable to expect, a false positive rate of *zero* for the first
100 or so employees they take on. After that, the scale of most firms is such
that you might be able to tread water with 1 or 2 truly awful hires. But if
you hire an idiot for employee #12, you have just increased the failure rate
of the entire enterprise by a nontrivial amount, and that is so, so much worse
than merely not succeeding as hard as you can.

You want to make it abundantly clear early in your career that you are not
a false positive. You may be a true positive. More often you will be a true
negative (because there is someone better than you for their very particular
needs). You can take a sick kind of pride in being a false negative and have
a funny story to tell 5 years from now. But do not do things which increase
your rates of being a false positive. That is a very bad idea.

There was a great deal of work in the late 2000s for dirty bedraggled PHP
developers. Returning to the isekai story, I am nearly certain someone of the
hundreds of jobs I replied to would have actually looked at the project, and
its longevity, and said "Yeah, this guy seems like he has what it takes" and
hired me on. The actual work probably would have sucked, but I would have
entered the job market 5 to 10 years earlier than I actually did, and then I
could have moved on to another firm with more pay or less broadly sucky 
circumstances or both, and continued onward and upward.

I don't know what the "vanilla PHP hobby app that's actually quite complex
and yet has been running for 10 years on a server in my bedroom" looks like
today. To be entirely honest I would be impressed by any junior dev who 
copied that exact strategy, domain of interest be damned. The key 
differentiators are you want it to be 
*messy, long-running, concrete, and solving a real-world problem*.
After a few weeks of looking for these kinds of things you'll start to see 
them everywhere; the important thing when starting out is *not* to throw them
away as being "too niche". That is having the courage to quit, and that
matters way more *after* you've already proven beyond a doubt to everyone
that you first have the courage to go for it.



[1]: Given that I was reading *TAoCP* and *SICP*, however, I probably still
     would have made the code cleaner than I should have.
