---
title: 'LLM, JavaScript, GitHub Pages, localStorage: A recipe for free apps anyone can use'
date: 2025-06-18
tags: 
- cost-optimization
- daily-life
- design-affordances
- everything-is-a-file
- html
- llm
- simple-suboptimal-solutions
- software-management
- software-dev
- speed
- worse-is-better
- javascript
- no-backend
---

Earlier today on Hacker News
[Scrappy made the rounds](https://pontus.granstrom.me/scrappy/),
with the explicit tagline "make little apps for you and your friends".
I always like to see new projects in this vein.

That's why I'd like to outline my alternative approach, which

- Works cross-platform and on mobile devices by default,
- Doesn't require any app store tomfoolery,
- Has great uptime built in,
- Gives you just enough data persistence to not get in your way, and
- Is owned by you, forever.

This is the stack I used to build
[my diet checklist](https://hiandrewquinn.github.io/diet-checklist/),
which I keep as a little icon on my phone's home page. 
Here it is:

- **An LLM**: That's right, this is vibe coding at its best. They basically all do a great job at generating basic web pages these days, so it's your pick of the litter; I use Gemini Pro because I'm a cheapskate.
- **"Vanilla" JavaScript**: The code. It runs in every browser on the planet. LLMs are great at this. (Vanilla, here, just means don't bother with React, Vue, etc. They're great in larger projects, but for what we're doing you can get by pretty easily without them.)
- **GitHub Pages**: This is where the real magic happens. Github Pages basically lets you put web pages online, for free, even ones with runnable JavaScript on them. A lot of engineering man-hours have gone into making this service available 24/7 no matter where you are in the world, and it's just *there* for you to *use* and likely will be in perpetuity because Github is already making plenty of money doing everything else Github does.
- **localStorage**: Your web browser has a tiny, ~5 MB block of storage you can basically use to store whatever you want even after a web page reloads on you, if your website is coded to make use of it. This means you can do things like write checklists that remember what you had on them even several hours after you have already closed the page and returned back to it. localStorage is awesome and I can't believe more people don't use it for things like this.

The loop is simple. First, you ask an LLM of your choosing to create an
`index.html` that does what you want. Make sure to specify to use localStorage
for persistence if you don't want your entries getting wiped after you close the
app for half an hour. Maybe also specify that you want it to be readable on
mobile, too, if you, like me, care about that.

Next, you save the `index.html` to your local computer and open it with a web
browser. Chrome, Firefox, whatever floats your boat. Play around with it. See
how it works.

You'll probably discover little quirks you'd rather get changed. If you have
some programming experience, you can probably dive into the `index.html` code
itself and figure out what's going wrong - but no worries if you don't. Just go
back to the LLM, desscribe your problem as clearly as possible, and ask for it
to fix this.

You'll get a new `index.html`. Save, open in browser, test, repeat. That's the
whole loop.

When it looks good, sign up for an account on
[Github.com](https://github.com/)
and create a new repo there with some descriptive name for your app.
Put the `index.html` in the new repo, exactly as it is.
Go to the repo's Settings, then to Pages in the left hand sidebar. Turn on the
Page and wait for a minute or two. (Make sure it is named `index.html`!)

Before you know it, your app will be up at an actual URL, you can actually
visit, from any device, whenever you want. Boom - you now have a tiny,
self-contained, local-first-ish app that loads fast, does what you want and
*does not do anything more*. You can share this URL with your friends and
family, and they can now use the app just like you do.

---

Recap:

1. LLM, 'write an `index.html` that ...'. localStorage please. Mobile friendly please.
2. Save, open in browser, test, repeat.
3. Stick in a Github repo; turn on Pages.

Why write this all down? This seems like common knowledge for all of us
software developers.

Because I'm not *really* writing for software developers here. I'm writing for
people who are *thinking about becoming* software developers - who are willing
to get a bit into the weeds to get what they want, and who will be excited to 
see they can get it essentially for free, so long as they don't need a backend
database or some kind.

This kind of tacit knowledge is hard to come by if you haven't done this kind
of thing a couple of times before. I used to run how-to-host-one-html.page
for the explicit purpose of getting absolute beginners over this hump, back in
the before times when LLMs were the worst they will ever be in 2025. A few folks
on Twitter even used this to get their own blogs and little websites off the
ground.

Lowering activation energy is a very, very noble thing.
