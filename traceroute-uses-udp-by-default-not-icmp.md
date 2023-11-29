---
title: traceroute uses UDP by default, not ICMP
date: 2023-11-29
tags: 
- shell
- linux
- networking
- udp
- tcp
- icmp
---

At least on Linux.

Don't believe me? Run `tcpdump -nn -i <interface> 'host example.com'` in one shell and `traceroute example.com` in another. `tcpdump` will pick up all 3 of {ICMP, UDP, TCP}, and on my machine the pattern is clear:

```tcpdump
20:58:47.187086 IP 1.2.3.4.41369 > 93.184.216.34.33434: UDP, length 32
20:58:47.187160 IP 1.2.3.4.39830 > 93.184.216.34.33435: UDP, length 32
20:58:47.187190 IP 1.2.3.4.43467 > 93.184.216.34.33436: UDP, length 32
20:58:47.187221 IP 1.2.3.4.50462 > 93.184.216.34.33437: UDP, length 32
20:58:47.187254 IP 1.2.3.4.35842 > 93.184.216.34.33438: UDP, length 32
20:58:47.187285 IP 1.2.3.4.44146 > 93.184.216.34.33439: UDP, length 32
20:58:47.187318 IP 1.2.3.4.50311 > 93.184.216.34.33440: UDP, length 32
20:58:47.187346 IP 1.2.3.4.34388 > 93.184.216.34.33441: UDP, length 32
20:58:47.187375 IP 1.2.3.4.43703 > 93.184.216.34.33442: UDP, length 32
20:58:47.187405 IP 1.2.3.4.35304 > 93.184.216.34.33443: UDP, length 32
20:58:47.187448 IP 1.2.3.4.50157 > 93.184.216.34.33444: UDP, length 32
20:58:47.187474 IP 1.2.3.4.58392 > 93.184.216.34.33445: UDP, length 32
20:58:47.187503 IP 1.2.3.4.45918 > 93.184.216.34.33446: UDP, length 32
20:58:47.187530 IP 1.2.3.4.38313 > 93.184.216.34.33447: UDP, length 32
20:58:47.187556 IP 1.2.3.4.41520 > 93.184.216.34.33448: UDP, length 32
20:58:47.187582 IP 1.2.3.4.55240 > 93.184.216.34.33449: UDP, length 32
20:58:47.225929 IP 1.2.3.4.60724 > 93.184.216.34.33450: UDP, length 32
20:58:47.225970 IP 1.2.3.4.43648 > 93.184.216.34.33451: UDP, length 32
20:58:47.226016 IP 1.2.3.4.52561 > 93.184.216.34.33452: UDP, length 32
```

I have no idea why. Performance? Getting around sysadmins who unwitting block all ICMP packets? It surprised me, at least.
