---
title: 'Speed paint videos for software installations'
date: 2023-12-09
tags: 
- design-affordances
- the-medium-is-the-message
- video
- ffmpeg
- installing-software
---

[Shell Bling Ubuntu](https://github.com/hiAndrewQuinn/shell-bling-ubuntu#-video---silent-install-20231206) and [finstem](https://github.com/hiAndrewQuinn/finstem/tree/master#-video---silent-install-20231207) now have what I'm calling "speed paints" of how someone, starting from scratch on a standard Ubuntu VM, might install the programs.

This came out of me realizing `ffmpeg` makes speeding up a video recording of a VirtualBox session a one-line operation:

```bash
ffmpeg -i output.webm -filter:v "setpts=0.1*PTS" -an output-fast.webm
```

When I watched them back, I realized it gave me a really good sense of what the installation should feel and look like, even if I hadn't actually tried it yet. That in turn made me think "Oh, installing this thing really isn't that bad after all." So I decided it was worth including.

I had already made some videos of installing both of these projects from scratch on a fresh Ubuntu Linux VM, but I had found out that the video file size was too large for Github. So I split the difference, and put the original video on YouTube for anyone who wants to investigate the details.
