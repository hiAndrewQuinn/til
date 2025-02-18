---
title: "SQLite is learnable"
date: 2025-02-18
tags: 
- sqlite
- postgresql
- everything-is-a-file
- design-affordances
- law-of-diminishing-returns
- software-dev
- simple-suboptimal-solutions
- worse-is-better
---

This is a response to
[pid1.call's "Siren Call of SQlite on the Server"](https://pid1.dev/posts/siren-call-of-sqlite-on-the-server/),
which itself is a response to articles like
[Wesley Aptekar-Cassels's "Consider SQLite"](https://blog.wesleyac.com/posts/consider-sqlite)
espousing SQLite as a server-side technology.
Cards on the table, I both love SQLite *and* 
think pid1 has the more correct take here.

When I decided on a dime after college to move countries
and be with my wife, part of the package deal was that
I had to throw away my dreams of easing into the software
industry by resting on the laurels of my
[strong, but not MIT-level-known-worldwide-strong, alma mater](https://www.northwestern.edu/)
(sorry Wildcats).
Electrical engineering was just not going to be
feasible for a then-monolingual 
English speaker in Finland, and besides,
I majored in it 90% out of curiosity anyway. I always intended
to return to my once and future home, the shell, after my
[Rumspringa with electrons](https://en.wikipedia.org/wiki/Rumspringa).

I'm a books guy. So when I set my mind to finally become
a "real" software engineer, I armed myself with 12 or so
tomes. Three which stand out in this context:

- *Django for Beginners*, *for APIs*, and *for Professionals*, by William S. Vincent;
- *Road to React*, by Robin Wieruch; and, curiously,
- *The Definitive Guide to SQLite*, by Mike Owens.

Curious. Why not Postgres?

Partly it's because I aspire to 
[never learn things I don't intend to remember forever](https://andrew-quinn.me/how-i-learn-things).
Those Anki cards from Owens's book are still in rotation for
me to this day. SQLite's sheer ubiquity, famous commitment to
backwards compatibility, public domin status, and
[use by the Library of Congress as an archival format](https://www.loc.gov/preservation/resources/rfs/format-pref-summary.html)
put it in a class of its own when it comes to 
"tools I can learn and use for the rest of my life". But to
be honest, database technologies are famously sticky,
and so the same could be said for Postgres as well. So
what was the real reason?

At the time, I had never written a SQL statement in my life,
and so I was in the market for something exceedingly learnable. 
And
**SQLite felt learnable in a way Postgres didn't**.
No need for a separate VM, or even a separate background
service under the hood,
it's just a file! You can just go in there and practice
with the handy-dandy CLI. Afraid you'll mess something up?
Just copy the file to `db.sqlite.backup`! No fuss.
You can even run Django on top of it! It will get out of your
way while you are learning to do big kid stuff.

SQLite slots into my head now at this sweet spot of featurefulness
and percieved (*percieved*) complexity that few technologies
do. It's true that you can get some nice latency advantages
by running it server-side, and deployment is simplified 
in some fundamental ways too.
But I don't think this is the true
reason people are going all-in on it. I think it's simply
because the learning curve is the most expensive mountain any
developer has to climb entirely on their own power.

My two cents: I don't regret learning SQLite first at all.
When I later learned how to work with more traditional
client-server databases like
SQL Server and PostgreSQL on the job,
I found it to be a much more pleasant experience, because I
already had a "worked example" in my head that
I could compare and contrast with. I definitely 
wouldn't hesitate to use SQLite in production 
for anything which I suspect won't see more than ~1 write
a second or ~1000 users, which describes a quite
long tail of both personal and line-of-business apps.
