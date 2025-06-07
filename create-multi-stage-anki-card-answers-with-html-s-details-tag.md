---
title: Create multi-stage Anki card answers with HTML's <details> tag
date: 2025-06-07
tags: 
- anki
- html
- design-affordances
- language-learning
- todays-lucky-10000
- worse-is-better
- secondary-language-acquisition
---

![image](https://github.com/user-attachments/assets/1df394d2-5590-46a0-a125-633a5dfe20fa)


*This works as of, at least, Anki 24.06.3.*

According to the
[Mozilla Developer Network](https://developer.mozilla.org/en-US/docs/Web/HTML/Reference/Elements/details),

>The <details> HTML element creates a disclosure widget in which information is 
>visible only when the widget is toggled into an open state.

In standard web browsers, absent any CSS to the contrary, a <details> tag 
starts *closed* until further notice. Since Anki is basically a local web
browser on top of a timer, this also works there.

What's interesting is that *nested* details tags do *not* all trigger at the
same time. This allows us to craft **multi-stage answer sides** for Anki cards
where, for example, we need to get part (a) right before moving on to part (b),
which we need to get right before moving onto part (c).

The HTML for the front and back of the example card:

```html
What <b>three main steps</b> describe how sunlight interacts with a single water droplet to create a rainbow? 🌈
```

and

```html
<details>
  <summary>Step 1: Entering the droplet</summary>
  <p>First, sunlight enters the water droplet, causing it to slow down and bend. This initial bending is called <strong>refraction</strong>.</p>
  <details>
    <summary>Step 2: Inside the droplet</summary>
    <p>Next, the refracted light travels to the back of the droplet and bounces off the inner surface. This step is <strong>total internal reflection</strong>.</p>
    <details>
      <summary>Step 3: Exiting the droplet</summary>
      <p>Finally, the light exits the front surface of the droplet, bending again through <strong>refraction</strong>. This second refraction spreads the light into its spectrum of colors, which we see as a rainbow.</p>
    </details>
  </details>
</details>
```

Notice too that if you wanted to create a chain of leading questions, you could
embed those into the summary tags.

I don't often find myself reaching for cards like this, if only because I
usually put each individual answer on an individual card.
[Repetitions of simpler items are easier to schedule](https://www.supermemo.com/en/blog/twenty-rules-of-formulating-knowledge),
after all. But it's nice to know this little trick already exists in the
software we all know and love, hidden in plain sight.
