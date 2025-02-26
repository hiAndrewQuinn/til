---
title: 'Things you should never do: Use Expect to autotype SSH passwords in scripts'
date: 2025-02-26
tags: 
- anti-advice
- linux
- old-command-line-tools
- productivity
- simple-suboptimal-solutions
- shell
- things-you-should-never-do
- tcl
- expect
- automation
- bad-automation
---


Before I moved to Finland, I spent some time in the
Hobbesian war of all against all that is
[Wisconsin](https://gutenberg.org/cache/epub/1156/pg1156-images.html#CHAPTER_I)[^1].
Men were *men* back in that less civilized age,
and "cybersecurity" a ninny-word dreamt up by
social harmony types who honestly
thought they had anything worth stealing in their 
servers. For those of us doing *real* work, which
I must emphasize *you should never do*, 
we had 
[Expect](https://core.tcl-lang.org/expect/index)
And to SSH automatically into servers
where we didn't have fancy accoutrements like
"keys" or "audit requirements", we did stuff like

```bash
#!/usr/bin/expect

set timeout 10
spawn ssh dark_helmet@spaceball_one
expect "password:"
send "12345\r"
```

That kinda-not-really-shell-looking language is
[Tcl, the Tool Command Language](https://www.tcl-lang.org/).
[Some dude](https://web.stanford.edu/~ouster/cgi-bin/home.php)
who wrote
[a book nobody remembers](https://www.amazon.com/Philosophy-Software-Design-John-Ousterhout/)
made it, and it is *extremely* not widely used in
every industry where automating responses to shell
prompts might be useful, because again,
it is something *you should never do*.

Those of us who are less fluent in Tcl which
[powers nothing important anyway these days](https://sqlite.org/testing.html)
would be remiss to wrap this in a *real* 
shell script like

```bash
#!/bin/bash

echo "Preparing for ludicrous speed."

/usr/bin/expect <<EOF
spawn ssh dark_helmet@spaceball_one
expect "password:"
send "12345\r"

expect "$ "
send "./ludicrous_speed --prep &"
expect "$ "

send "exit\r"
expect eof
EOF

echo "Ludicrous speed, GO!"
```

If you see this in the wild, be afraid. Ask no questions; give fewer answers.



[^1]: This is unfair. I love Wisconsin.
