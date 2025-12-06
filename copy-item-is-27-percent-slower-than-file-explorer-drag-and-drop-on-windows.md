---
title: Copy-Item is 27 percent slower than File Explorer drag and drop on Windows
date: 2025-12-06
tags: 
- ergonomics
- cli
- bad-automation
- networking
- old-command-line-tools
- questions
- todays-lucky-10000
- windows
- robocopy
- rsync
- smb
- storage
---


```markdown
File Explorer drag & drop     ########## (112 MBps)
Copy-Item                     #######    (82 MBps)
Built in SFTP client          ######     (70 MBps)
Built in robocopy             ##         (25 MBps)
WSL 2 rsync                   #          (13 MBps)
```

In table form:

| Tool| Speed (MBps) | Difference |
| :--- | :---: | :---: |
| Drag and drop | ~112 | --- |
| `Copy-Item` | ~82 | -27\% |
| `sftp` | ~70 | -37\% |
| `robocopy` | ~25 MBps | -78\% |
| `rsync` (WSL 2) | ~13 MBps | -88\% |

I feel like I'm losing my mind. 

It all started innocently enough with a misconfigured NAS.
I've been making some investments into the homelab recently,
both for professional reasons and personal curiosity; by now
I consider a couple of long CAT 7 cables and some unmanaged
1 Gbps Ethernet switches to be some of the best money I've
spent this year. Every device in our home has a cozy data
autobahn to rush down to talk to every other device in our
home, and what's more, I've actually *seen* `rsync` copy files
from my NAS to my Debian daily driver at 100+ MBps quite
regularly.

But even after I un-mis-configured the NAS, I was
surprised to find that `rsync` on Windows Subsystem for
Linux pulled in data at a paltry 9 MBps, for an ideal use
case (one large file). Removing the `-z` compression flag
moved us up by 30-50%, which is commendable, but not the
order of magnitude increase I was doubtfully hoping for.

Was something wrong with the connection? 
Getting up from the
[strandmon](https://www.ikea.com/fi/fi/cat/strandmon-sarja-57217/)
would have required physical movement, so instead I just
took that same exact file via the File Explorer network
share, and just Ctrl-C Ctrl-V'd it onto my desktop - and
I was immediately hitting 111-112 MBps again! There goes
that theory. The calls are coming from inside the house.

I don't have much occasion to use these skills these days,
but I actually became a somewhat proficient PowerShell user and
Windows admin back in my first job. My curiosity was fully
piqued by this point so I busted out Old Reliable -
[robocopy](https://ss64.com/nt/robocopy.html), rsync before
rsync. It's been built in since Windows 7 and handles an
absurd number of weird edge cases due to its longevity,
so you would expect it to be, well, *fast*, right. Like
this is one of those Laws of Lindy Software that everyone
supposedly knows; software that was created to be demanding
on system resources 30 years ago is blazing fast to the 
point of instantaneous today, that's why everyone loves
Vim and Emacs over VS Code, etc.

Not so, apparently! `robocopy` doesn't print its progress
in seconds out of the box, but it *can* restart things from
where they were last left off, so a few `date && robocopy` 
and Ctrl+C's later, I had a pretty reliable estimate 
of... 25 MBps. 

My jaw just about hit the floor, reader. It was here I began
to realize that something was rotten in the state of Denmark.
You probably shouldn't be launching 10- or 100-hour long copy
jobs between Windows machines in the first place
if you have any other options,
but on the other hand,
civilization advances when we extend the number of 
important operations which we can perform without 
thinking about them, and I would sure like to know that the
venerable old tool I would script such enormous jobs
around wouldn't do it at *one-fifth* the speed of 
doing it by hand. No, I didn't investigate `robocopy`'s
myriad other options in detail, but in this situation I do
not think I have to - we are comparing default behaviors
against default behaviors! This is also why I didn't go
super deep into the WSL question; I should be able to
assume that WSL comes shipped with sane defaults that don't
decimate my network connection because I didn't set the MTU
to 1337 by hand or what have you.

These days Windows also comes with a very nice `ssh` and
`sftp` client out of the box, and this is where I could feel
my heart beating a little faster, because in my day to day
work now `sftp` is actually my preferred method of shuttling
files to and from my little corporate laptop. Here, at
long last, we crossed the 50 MBps mark - `get same-file.dat`
got a semi-respectable 70 MBps down from the NAS. Only a
37% reduction compared to drag and drop! And here, at least,
we start to get *some* kind of explanation for why this
reduction might happen - SFTP is an encrypted protocol, so
maybe those CPU cycles add up to a lot of extra work over
time or slowdown. That... shouldn't feel convincing to anyone
who gives it more than 15 seconds of thought, but we all live
with our eyes wide shut at times.

I had one last thing to test, PowerShell's good old fashioned
`Copy-Item`. Those of us with a Unix background more or less
assume, without looking into it too deeply, that good old
fashioned `cp` is about as fast as you can get for things
like this. You're edging up to the limits of what the 
actual hardware can do. You assume `cp` as a binary is laser
focused on, well, making copies as fast as possible. Surely
`Copy-Item` would work the same way and be close to parity
with File Explorer, right?

Alas. While it was the fastest of the bunch otherwise,
`Copy-Item` still topped out at an average 82 MBps when it 
came to copying the file from the NAS's network drive to
my local filesystem. I have to say, this was the most
disheartening of the bunch in a way; despite all Microsoft's
efforts to the contrary, reaching all the way back to the
dawn of PowerShell and the Azure corporate revolution, here
they are, still making poor bedraggled sysadmins pay a
speed tax for trying to do their work in a minimally sane
way. 

There are, to my knowledge, no scripting options at
all on Windows that come close to the fearsome power of
File Explorer's copy and paste out of the box. I hope you
never have to use this knowledge, but if you do, may your
100-hour copy job not accidentally be a 130-, 140, 500-, or
1100-hour one instead just because you chose to try to be
clever about things.

(Also 
[*hyvää itsenäisyyspäivää*](https://en.wikipedia.org/wiki/Independence_Day_(Finland)), 
for those who celebrate!)


