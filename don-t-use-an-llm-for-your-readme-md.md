---
title: Don't use an LLM for your README.md
date: 2026-08-17
tags:
- against-entropy
- documentation
- llm
- the-medium-is-the-message
- design-affordances
- installing-software
- shell
---

One of my more popular open source projects is
[Shell Bling Ubuntu](https://github.com/hiAndrewQuinn/shell-bling-ubuntu),
which, contrary to its name,  actually supports many different
operating systems these days: modern macOS, Alpine, Fedora 40 and up,
Rocky Linux 8 and up,
[WSL (Windows Subsystem for Linux)](https://learn.microsoft.com/en-us/windows/wsl/),
and so on.

But while I feel the project is in a much more advanced state than it
was four or five months ago after all that hardening and robustness work, I haven't
seen much extra marginal uptake or additional stars on GitHub as a result. I think
the reason is actually quite simple: **I replaced the README** with a
much drier one, driven by LLMs (Large Language Models), and people
(correctly!) read that as a negative signal of care compared to the
previous one.[^1]

Here is [the old README.md](https://github.com/hiAndrewQuinn/shell-bling-ubuntu/tree/0a6f36723d774cce13da4c2759f0582b8c9b08b9),
all hand-authored. Technically speaking, it documents an objectively
worse version of the code. You need to run three or four commands, not
one. I didn't check SHA256 (Secure Hash Algorithm, 256-bit) sums, which
maybe wasn't such a big deal for a personal setup script that got
popular in 2023, but it sure is a big deal in Supply Chain Hell 2026.[^2]
You need to *close and reopen* your terminal! Several times!!
On and on the list goes.

But it has *personality*, and that doesn't show through nearly as well in
[the new README.md](https://github.com/hiAndrewQuinn/shell-bling-ubuntu).
The new one is... dry. There's no video.[^3] There are no odd little
jokes or flashes of inspiration from yours truly. The point of the
project is to make using the shell a *joyous act* for developers mostly
on the newer, younger side of things. The new README instead feels like
I wrote it for, say, the
[Operational Technology](https://en.wikipedia.org/wiki/Operational_technology)
folks I talk to at my day job, who actually care[^4] about things like
risk management and say words like "procurement" with a meaning behind
them.

I consider this a misstep as a steward of this tiny convenience project
of mine. When I have some time I think I'll step through the README.md
and try to make it more obvious *why* Shell Bling Ubuntu might make your
terminal-going life more fluid and fun.

[^1]: This is in reference to the economic study of 
    [signalling theory](https://en.wikipedia.org/wiki/Signalling_theory)
    . A signal only carries information if it is expensive
    to fake. The male peacock's mesmerizing tail of evil eyes works 
    precisely because a sickly peacock
    *cannot* grow one. A charming, well organized, slightly dry README
    used to be exactly that sort of costly signal; it meant some
    collared-and-tan-khaki'd engineer with an interest in technical writing
    had sat down and spent an evening caring about *you*, the
    reader. Why would they do that if they didn't have a good enough product in the first place? 
    Then with the advent of LLMs, the cost of generating competent prose fell through the
    floor - which by and large is a *very good* thing. There are 
    many professions where being unable to write well is not a killer to the profession, but
    significantly increases the perception of professionalism and
    amounts one can charge for it, because it provides *actual value*,
    not just signaling value. Handyman work is my goto example; my
    father is an electrician, and would often ask me on Saturdays to fire up
    Microsoft Word and later Google Docs to write out invoices for his clients,
    because I had a more precise command of written English than he did.
    I knew enough about his work to ask him the important questions that a
    well-educated but not technically inclined Boston homeowner might reasonably
    ask, and we could put that information on the bill, because I knew my dad
    took great pride in his work and didn't cut corners.
    But I also charged him a few bucks per invoice for the hour. If
    you don't have a literary son to rely on, you can easily imagine
    how much an actual adult might charge for the same service.
    And you can imagine why many sole proprietorships might say, "Uh... no thanks. I'll make do."
    The extra money and demand they might generate from being good at
    writing invoices is still marginal compared to the costs
    of looping in a whole extra human being to write them.
    *Any*-way, when LLMs came online, and people started to learn how to use it,
    suddenly this got a lot cheaper, and the actual value of a well written invoice remained, but 
    *the signal* went out the door.
    Where did the signal move to?
    I posit it moved in much the same way the authenticity of music became big in the late 20th and early 21st centuries: to intentional human erratic weirdness, to in-jokes, to a screen recording
    of the author fumbling a command and leaving it in. *These* are now
    the expensive things, because they are precisely the things a model
    will smooth away by default. The market for boring legible sincerity 
    is tightening every year as a result of being machine writable - 
    send some flowers to e.g. your friendly neighborhood accountant for their loss.

[^2]: The [xz-utils backdoor](https://en.wikipedia.org/wiki/XZ_Utils_backdoor)
    is a famous one and makes for gripping reading if you weren't there to experience it firsthand.
    The attack
    vector there was not a clever exploit so much as three years of
    patient, friendly-sounding GitHub comments wearing down a burnt-out
    maintainer, which, if you squint, might be another blue star in this
    post's constellation: The *social* layer of an open source project is load
    bearing too, and often the most important one in the long run.
    Your README.md is the front door of that social layer.
    If you don't cover your front door in the appropriate lamb's blood, you
    may be disappointed to find your first born project DOA.

[^3]: Incidentally the original video format was one I've written before about under
    ["speed paint videos for software installations"](/speed-paint-videos-for-github-project-installations/) -
    a 30-second sped-up screen recording of the whole install, start to
    finish. As weird as it sounds I actually still think they might be 
    one of the highest-value-per-byte things you can put at
    the top of a README, both for signaling reasons and for actual value. 
    It answers "how much of my afternoon is this going to eat?" before the 
    reader has to ask. (That may change as LLMs get increasingly good at)
    simply running these things for you, though.)

[^4]: Term of endearment, to be clear. You *should* absolutely be much
    more conservative about what you install on corporate servers, and
    not leave it up to one person with too much time on their hands. SBU
    (Shell Bling Ubuntu) is not aimed at, and doesn't aspire to aim at,
    such levels of rigor; it would take up far too much of my time to
    not only pin SHA256 and SHA512 hash sums for every static binary I
    release, but also spin up my own website backed by e.g.
    [Cloudflare R2](https://developers.cloudflare.com/r2/) to mirror all
    of them, and sign them off with
    [`minisign`](https://jedisct1.github.io/minisign/) or something...
    most of their own developers don't even go that far. Come
    to think of it, [`age`](https://github.com/FiloSottile/age) and
    `minisign` wouldn't be bad additions to the project. They're both
    small static binaries I believe that both do something specific
    and very useful, but which an entirely new developer might not
    understand the importance of if they aren't introduced early to
    the concepts.
