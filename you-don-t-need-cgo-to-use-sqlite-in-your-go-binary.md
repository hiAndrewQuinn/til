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

No more excuses! Please start using SQLite in your Go applications 
again, it is the gift that just keeps on giving. If you don't believe me
believe the
[Library of Congress](https://www.loc.gov/preservation/digital/formats/fdd/fdd000461.shtml).



[^1]: (Hei Qt-Ryhmä, teidän pitäisi harkita minun palkaamista. Vitsi, vitsi.)
 
