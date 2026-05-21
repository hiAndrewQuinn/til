---
title: Back up your TOTP codes by just printing them
subtitle: Seriously. You can just, like, print them out. They don't stop working.
date: 2026-05-20
tags:
- against-entropy
- todays-lucky-10000
- simple-suboptimal-solutions
- cost-optimization
- the-medium-is-the-message
- worse-is-better
---

![PNG of the TOTP code for JBSWY3DPEHPK3PXP.](/totp-example-01.png)

Scan the Quick Response (QR) code above with your favorite Two-Factor Authentication (2FA) app.
You should get a six digit number, rotating every
30 seconds, that looks something like

```text
237601
# as of Wed May 20 09:44:53 AM EEST 2026
```

If you then take the secret key that QR code maps to,
say

```text
otpauth://totp/?secret=JBSWY3DPEHPK3PXP
```

or often even just the raw secret itself[^secret]

```text
JBSWY3DPEHPK3PXP
```

, you can regenerate the *exact* sequence of six digit Time-based One-Time Password (TOTP)
codes someone else will get, in order, to infinity.
If you have a clock which happens to agree with
them, you can regenerate it *at the same time* that they do.
That's it. At its heart, a TOTP code is just a password,
hashed and salted with a sawed-off timestamp.[^rfc]

We can prove it here. Go to both
[Dan Hersam's TOTP code generator](https://totp.danhersam.com/)
and
[BaseToolbox's TOTP code generator](https://basetoolbox.com/en/2fa/).
Paste in that same `JBSWY3DPEHPK3PXP` secret to both.
Put the two windows side by side.
The same code will appear every 30 seconds,
plus or minus epsilon, because the universe has a hard
speed limit on how fast information can propagate
of about 300,000,000 meters per second.[^c]

One nice property of this is that, because the math to
calculate TOTPs is not owned by anyone proprietary, there
are actually a lot of privacy-focused third party apps
that can handle TOTP codes if you're not entirely trusting
of Google or Microsoft.
[I like Aegis](https://andrew-quinn.me/digital-resiliency-2025/#2fa-totp-generator-of-choice-aegis-android),
and Aegis and I have a mutual understanding that the instant
I start to think it's seeing anyone else this relationship is
*finito*.

One even nicer property of this is that
**you can just print TOTP QR codes and scan them later**.
Your coworkers or loved ones can scan them.
An estate planner helping a tech-clueless loved one sort through
your things will probably figure out what these QR codes are
in a matter of minutes, and then it's more of a question of
figuring out what they actually correspond to than anything.

For all the hate
it gets in the digital age, it is nearly impossible to find
a more cost effective medium than
[ordinary copy paper, in a cool, dry environment](https://andrew-quinn.me/digital-resiliency-2025/#returning-to-the-aegis-in-tarsnap-or-nah-question) for mid-term archival purposes of "small data"
in individual operations. By "small data" I mean
[anything under about a megabyte](https://www.monperrus.net/martin/store-data-paper),
and by "mid-term" I mean "one to two decades".[^paper] Copy paper retails
for about one penny apiece. You could probably back up every
TOTP code you ever use for under a dollar of upfront cost, assuming
you already had a place to put them. If you don't, spend one
more dollar to buy a folder, put it in a closet, and set an invite
on your Google Calendar to reprint them in 4 or 5 years or so.
Maybe spend one more dollar to leave a copy of those big, bulky
QR codes with grandma.

Now for my pitch. TOTP codes are, theoretically, less secure than
having a dedicated hardware key.
[I do love my hardware keys, don't get me wrong](https://andrew-quinn.me/digital-resiliency-2025/#hardware-keys-2fa-and-totp-oh-my).
The ease of use of just plugging in a tiny dedicated computer
and pressing its built in button to e.g. use `sudo` can't be beat.
And these things are probably going to survive for 5 or 10 years
themselves, too.[^hwkey]

But TOTP codes are *so easy*! You can implement them
without needing to buy anything! You can back them up with the
same old black and white printer you've been using for the past
decade, and they'll be usable a decade hence unless you actively
choose to rotate them! Consider using TOTP codes if you don't
already have a more robust plan in place. The fact that they are
much easier to back up than basically any other 2FA system I know
of is a very nice bonus — a small win in the long, slow campaign
[against entropy](/consider-the-cronslave/) that is keeping a digital life going.

[^secret]: `JBSWY3DPEHPK3PXP` is the canonical test-vector secret you see in basically every TOTP tutorial on the internet. It is base32; decoded, it spells `Hello!` in ASCII. So when you scan that QR code, you are essentially scanning the word "Hello!" — which is a charming reminder that the secret really is just a short string, not some heavyweight cryptographic artifact. Don't actually use it to protect anything, of course; the whole world has it memorized.
[^rfc]: TOTP is specified in [RFC 6238](https://datatracker.ietf.org/doc/html/rfc6238), which is itself a thin wrapper over [RFC 4226](https://datatracker.ietf.org/doc/html/rfc4226) (HOTP — HMAC-based One-Time Password). The "time-based" part just means HOTP's counter is replaced with `floor(unix_time / 30)`. That is the entire trick. You could implement a working TOTP generator in maybe twenty lines of Python if you trust the standard library's `hmac` module, which is one of the reasons this scheme has aged so well.
[^c]: The actual figure is 299,792,458 meters per second in vacuum, a number which since 1983 is true by definition — the meter is now defined in terms of the second and `c`, rather than the other way around. So in a very real sense the speed of light is no longer measured; it is decreed. The reason your two browser tabs agree on the code is less about `c` and more about [Network Time Protocol](https://en.wikipedia.org/wiki/Network_Time_Protocol), which both of their host machines almost certainly run, and which keeps consumer clocks synchronized to within tens of milliseconds of UTC — comfortably inside the 30-second TOTP window.
[^paper]: Martin Monperrus's [paper-as-storage analysis](https://www.monperrus.net/martin/store-data-paper) is worth a slow read if you have never considered paper as a storage medium with real, calculable bit density. The TL;DR is that a single sheet of A4, printed densely with QR codes, can hold on the order of 100 KB; archival-grade acid-free paper in dark, dry storage is rated for centuries, not decades. The limiting factor for most of us is not the medium but the fact that we will misplace the folder long before the cellulose fails.
[^hwkey]: The honest version of the hardware-key pitch is that hardware keys protect against phishing in a way TOTP cannot: a YubiKey scoped to `https://example.com` will refuse to authenticate to `https://exarnple.com`, while a human reading a TOTP code off their phone happily will. If you are a high-value target, that matters a lot. For most people most of the time, the bigger threat is losing access entirely, and the printable-backup property of TOTP is doing more for them than the marginal phishing resistance of a hardware key. See also [common-sense security for SSH on a new Debian server](/common-sense-security-for-ssh-on-a-new-debian-server/) for the same "easy beats theoretically optimal" instinct applied elsewhere.
