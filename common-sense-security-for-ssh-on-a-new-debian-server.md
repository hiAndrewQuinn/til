---
title: Common-sense security for SSH on a new Debian server
date: 2024-09-24
tags: 
- cli
- debian
- linux
- simple-suboptimal-solutions
- shell
- security
- fail2ban
---


Last night I went to DigitalOcean and spun up a tiny new, $4/month droplet --
on my own dime! It sounds crazy, but I've never actually wanted to pay for
hosting myself before. But I have a fun little web app cooking up, one that 
might eventually pay that $4/month back with interests, and I decided, why not,
it's time to finally put some of my *own* skin in the game with this whole
sysadmin thing.

Last night, and this morning, I think we managed to successfully set up SSH
in a way which is protected against most attackers who are not specifically
motivated to attack *me*. Script kiddies and the like. As a dutiful bureaucrat
I always like to make checklists out of complicated processes I'm too dumb to
remember myself, so here it is: My "common-sense SSH security" checklist.

We're starting with the "worst-case" scenario here: `root` is both enabled,
and has a password-based SSH login.

1. `chpasswd` on root to a random, 32-character password.
2. Create a non-root, sudoers (if applicable) user, with the following params:
   - Username: 16 randomly-chosen alphanumerics.
   - Password: 32 randomly-chosen characters.
3. Disable root SSH.
4. Exit the root SSH session.
5. **Test**: Try to enter the root SSH session again. *This should fail.*
6. **Test:** SSH in to the non-root user with your password. *This should work*,
   but not for long.
7. `ssh-copy-id` to the non-root user, so that you can log in without password-
   based SSH.
9. **Explicitly enable** pubkey-based SSH.
8. Explicitly disable password-based SSH. (Make sure to do this after the 
   previous step.)
9. **Test:** SSH into the non-root user with your SSH key. This should work.
9. **Test:** SSH into the non-root user explicitly stating you do *not* want
   to user your SSH key (ssh lets you do this with the `-o` params). This
   should not work.
10. Set your SSH `AllowUsers` to be only the 16 
    randomly-chosen alphanumerics username you have chosen. (This protects
    against anyone in the future who
    creates e.g. a `postgres` user with the password `postgres`.)
11. **Test**: Create another random non-root user. Try to SSH in as them.
    *This should fail*. Delete the user after doing so.

If you now want to install
[fail2ban](https://github.com/fail2ban/fail2ban)
for a little extra peace of mind, go ahead, just know
[it is no replacement for real, robust security](https://news.ycombinator.com/item?id=38834627)
which the above list is a poor imitation of. Here's my fail2ban coda:

12. Install fail2ban. Make sure to copy any `*.conf` files to `*.local`.
13. Ensure fail2ban is `enabled` for SSH.
14. Set `mode = aggressive` (for peace of mind, remember).
15. Enable IPv6 (it's 2024).
16. Set `bantime = -1` (infiniban, because who else besides you is trying to
    get in here anyway?!).
17. **Test**: SSH into your server andc watch the ssh.service logs, the
    fail2ban logs, and the `fail2ban-client status sshd` line. Try to trigger
    fail2ban on another device you don't care about.
