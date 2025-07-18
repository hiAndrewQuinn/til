---
title: You don't need CGO to use SQLite in your Go binary
date: 2025-07-18
tags: 
- golang
- sqlite
- software-dev
- design-affordances
- installing-software
- cgo
- cross-compilation
---


At least not for most use cases. You can just use
[modernc.org/sqlite](https://pkg.go.dev/modernc.org/sqlite#section-readme)
instead as your SQLite driver.

For people who aren't in the Go know, "pure" Go programs are trivially
easy to compile cross-platform to all the major platforms by default.
You read that right - you can just `go build` a single Windows 
executable, Mac executable, and Linux executable *on the same machine*
and just ship it: 

```bash
# This can all happen on the same box!
export CGO_ENABLED=0 # no c cross-compilation please

export GOOS=linux
GOARCH=amd64 go build -o hello-linux-amd64 hello.go
GOARCH=arm64 go build -o hello-linux-arm64 hello.go

export GOOS=darwin   # aka mac
GOARCH=amd64 go build -o hello-darwin-amd64 hello.go
GOARCH=arm64 go build -o hello-darwin-arm64 hello.go

export GOOS=windows
GOARCH=amd64 go build -o hello-windows-amd64.exe hello.go
GOARCH=arm64 go build -o hello-windows-arm64.exe hello.go
```


This was the real reason I chose Go over Python for
[`tsk`, my instant-search Finnish to English pocket dictionary](https://github.com/hiAndrewQuinn/tsk/).
I wanted to be able to give Windows users a single `.exe` they could
just *run* and have work out of the box. 

Go has a lot of neat tricks like this up its sleeve. Simon Willison 
of Django, Datasette and `llm` fame talks often about the
[Baked Data architectural pattern](https://simonwillison.net/2021/Jul/28/baked-data/):

>**Baked Data**: bundling a read-only copy of your data alongside the code for your application, as part of the same deployment

The Go `embed` library, contained within its standard library,
makes this trivial to do:

```go
//go:embed words.txt
var wordsTxt string    // just a normal text file

//go:embed glosses.gob
var glossesGob []byte  // gob = go binary format

//go:embed go-deeper.txt
var goDeeperTxt string

//go:embed example-sentences.sqlite
var embeddedDB []byte  // yes that's a whole sqlite db
var exampleDB *sql.DB  // bundle into the .exe, dump on run, ezpz!
```

Very handy if you just want to ship a single `.exe` file and not have
to worry about people needing any other files to along with it. (An
awful shame then that there's no
[official](https://github.com/therecipe/qt)
[Qt 6](https://www.qt.io/product/qt6)
release for Go. The best cross-compilation programming language paired
with the best cross-platform GUI framework? Seems like a match made in
heaven to me.[^1])

Back to the point. As soon as you start using dependencies
which require [CGo](https://go.dev/wiki/cgo), that trivial
cross-platform compile-ability goes out the window. 
It's not impossible by any means, but you need to have a C toolchain set
up per targeted platform, including Windows, and that's not complexity
anyone wants to have to deal with.
And most of the more
interesting libraries require CGo, including, notoriously, the libaries
which let one use SQLite.

Except... There *is* at least one high quality SQLite driver that does
*not* require CGo. This property was so surprising when I came across
it I had to call it out in a comment:

```go
❯ head tsk.go --lines=30
package main

import (
  // ...
	"database/sql"
  // ...
	_ "modernc.org/sqlite" // pure-Go SQLite driver with FTS5 support
  // ...
)
```

Please start using SQLite in your Go applications 
again, it is the gift that just keeps on giving. If you don't believe me
believe the
[Library of Congress](https://www.loc.gov/preservation/digital/formats/fdd/fdd000461.shtml).
No more excuses!

## Permissible excuses

Alright, so there are *some* cases where you're using SQlite's deeper 
features
and they aren't supported (yet) by the CGo-free Modern C implementation.
[kassner](https://news.ycombinator.com/item?id=44457120) from Hacker News
reports

>\[https://gitlab.com/cznic/sqlite, which as far as I can tell is the package's primary repo\] \[is n\]ot 100% drop-in though. I’ve hit some snags around VFS \[virtual file system\] support.

The VFS (Virtual File System) in SQLite is an abstraction layer that 
lets the SQLite engine interact with the underlying storage system.[^2]
It's a key part of what makes SQLite so portable and flexible. Think of 
it as a pluggable backend for file I/O.

Most of us are never going to write our own VFS objects for SQLite, but
if you find yourself doing so, maybe do yourself a favor and use
[Zig for CGo cross-compilation](https://zig.news/kristoff/building-sqlite-with-cgo-for-every-os-4cic)
instead or something.

And I'd be remiss not to mention the other CGo free options in this
space, because while Modern C is the best known one, it's not the only
game in town even here. I've heard good things about
[ncruces's go-sqlite3](https://github.com/ncruces/go-sqlite3),
which uses WASM instead to bypass the CGo requirement. Some people have
reported they actually get *better* performance with this plugin.

If you're actually getting bottlenecked on the raw numbers, it might
be worth swapping out to this. That hasn't been an issue for me with
`tsk` since it's about as edge compute latency optimized as you can get,
so I can't attest to it from personal experience. I'm not sure how much
stock I would put into the
[SQLite Benchmarks Game](https://pkg.go.dev/modernc.org/sqlite-bench#section-readme)
numbers maintained by Modern C, but they don't show a clear winner to
me, so in practice I would just worry about that bridge when I get to
it.

Permissible Excuse #3 is if you are really paranoid. And if you don't 
have something like
[Litestream](https://litestream.io/)
set up for backing up your SQLite database in case something goes
wrong. 

My understanding is that
the Modern C library is actually a *transpilation* of the SQLite C
library to Go - that is to say, the author cast some
[heavy wizardry](https://www.catb.org/jargon/html/H/heavy-wizardry.html)
to actually convert the SQLite code itself into a Go-acceptable format.
This is awesome in the same way all metaprogramming feels awesome.
This sucks in the same way all metaprogramming actually sucks.
To be honest, I'm surprised I didn't come across more reports of
obscure bugs from this transpilation, they did a really good job.

The only time I can think of this as being really that big of an
issue is when you're on a non-Internet connected edge device
(which, hey, happens to be a lot of 
[what I work on in my day job](https://hiandrewquinn.github.io/til-site/posts/openbsd-the-computer-appliance-maker-s-secret-weapon/))
and truly, genuinely *need* to guarantee that SQLite database is as
rock solid as it gets. In which case I think you're best off eating
the CGO complexity and getting the best supported option in the bunch.

Or maybe you've inherited a web app that was build with the Big Honkin'
VM approach and you just started to notice that ... hey, that's weird...
not all of the writes are going through to SQLite. Oh no. Then this
*might* be an angle to investigate. Again: Way out of my experience
here. I would personally counsel you
back the SQLite database up first before you do anything else in such
a situation so that you aren't trying to hotwire a moving car by hitting
the gas tank with a shovel.


I mention all of this to cover my bases,
lest you walk away thinking this is a perfect panacea. It is merely an
almost-perfect panacea. You have to drive your use case
pretty hard along some axis before you run into any
of this. I have never experienced anything remotely like what has been
described here, and I'm pretty close to the modal use case for a SQLite
deployment: I have some data, I want people to be able to access it
reasonbly fast, and I don't want to make my life hard. If that sounds
like you, hop aboard the Golang Express.








[^1]: (Hei Qt-Ryhmä, teidän pitäisi harkita minun palkaamista. Vitsi, vitsi.)
 [^2]: If you dig into the internals of SQLite deep enough,
[like I did way back when](../the-learnability-of-sqlite/), you start
to realize this kind of design pattern is absolutely everywhere in
Dr. Hipp's work. It is much easier to implement a tiny virtual machine
first, and then use that as a gastric band of sorts, than it is to try
and naively write direct SQLite to Windows file system functions,
then SQLite to Linux file system functions, etc. I belive Dr. Hipps's
background before SQLite was in building these very kinds of VMs, and
so he's very good at it. It also explains why people working on really
weird platforms like FreeRTOS [still love it](https://sqlite.org/selfcontained.html):
> All of these interfaces are readily available on most platforms, and **custom VFSes can be designed to run SQLite on even the most austere embedded devices.**
