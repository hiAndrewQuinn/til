---
title: Lua is a pretty good config language
date: 2026-01-06
tags: 
- complementary-goods
- software-dev
- simple-suboptimal-solutions
- devops
- lua
- configuration
- configuration-as-code
- scheme
---


Lua and Scheme occupy curiously similar places in my noggin, becuase my
primary use case for both has been as scripting languages embedded into other,
larger projects. Lua of course is basically designed for this job, but it's
a solid intermediate format to target even if you have no immediate intentions
to use the programming language parts at all. A TSV file like

```tsv
10.0.0.5  192.168.1.1 80  tcp
10.0.0.6  192.168.1l.1  443 tcp
```

can be given a lot more structure on the cheap 
by writing a small transpiler of sorts to turn it into

```lua
local rules = {
  { src = "10.0.0.5", dst = "192.168.1.1", port = 80,  proto = "tcp" },
  { src = "10.0.0.6", dst = "192.168.1.1", port = 443, proto = "tcp" },
}
```

This may not seem like a lot of work. It isn't. What you get in return is the
ability to bring in a full programming language for anything you need *after*
doing the translation. Want to validate your shiny new Lua config file? Easy:

```lua
local function validate(r)
  assert(type(r.port) == "number", "Port must be a number")
  assert(r.proto == "tcp" or r.proto == "udp", "Invalid protocol")
  return r
end

local rules = {
  validate{ src = "10.0.0.5", dst = "192.168.1.1", port = 80,  proto = "tcp" },
  validate{ src = "10.0.0.6", dst = "192.168.1.1", port = 443, proto = "tcp" },

}
```

If you need to translate back down to TSV for interop, no sweat:

```lua
local rules = {
  { src = "10.0.0.5", dst = "192.168.1.1", port = 80,  proto = "tcp" },
  { src = "10.0.0.6", dst = "192.168.1.1", port = 443, proto = "tcp" },
}

for _, r in ipairs(rules) do
  print(string.format("%s\t%s\t%d\t%s", r.src, r.dst, r.port, r.proto))
end
```

It's easier to sell version controlling this to management if you need to,
by the way. TSVs by all rights should be version controlled, but life has a
funny way of getting in the way of that.

Suppose you want to start nesting your data like in JSON, YAML or HCL. Lua is
pretty nice for that too:

```lua
local infrastructure = {
  {
    hostname = "web-prod-01",
    location = "us-east-1",
    interfaces = {
      { name = "eth0", ip = "10.0.0.5",  public = false },
      { name = "eth1", ip = "44.200.5.1", public = true },
    },
    services = {
      { port = 80,  proto = "tcp", label = "http" },
      { port = 443, proto = "tcp", label = "https" },
    }
  },
  {
    hostname = "db-prod-01",
    location = "us-east-1",
    interfaces = {
      { name = "eth0", ip = "10.0.0.10", public = false },
    },
    services = {
      { port = 5432, proto = "tcp", label = "postgres" },
    }
  }
}
```

Over time this starts to remind me more and more of `pf`, the DSL used for
packet filtering and firewalls on the BSDs. I mean that with the highest
praise.

Obviously Scheme can represent these structures quite nicely as well, the
closest example being alists I suppose:

```scheme
(define infrastructure
  '((host
      (hostname . "web-prod-01")
      (location . "us-east-1")
      (interfaces
        ((name . "eth0") (ip . "10.0.0.5")  (public . #f))
        ((name . "eth1") (ip . "44.200.5.1") (public . #t)))
      (services
        ((port . 80)  (proto . tcp) (label . "http"))
        ((port . 443) (proto . tcp) (label . "https"))))
    (host
      (hostname . "db-prod-01")
      (location . "us-east-1")
      (interfaces
        ((name . "eth0") (ip . "10.0.0.10") (public . #f)))
      (services
        ((port . 5432) (proto . tcp) (label . "postgres"))))))
```

However, in my experience, Lua is a bit easier to integrate into existing
brownfield work, and a *lot* easier to get developers to accept. Non-Blub
programmers like yours truly get scared of the implicit power of Blub when
we want something that is easy to grep through. Lua just looks like JSON with
functions.

How much do you have to pay in binary weight to embed Lua? Not a lot - 
[compiling Lua 5.5 from source](https://www.lua.org/start.html) weighs in at
314 kilobytes as of today. What about the sandboxing story so some Roblox
hacker doesn't `os.execute("rm -rf /")` your box? Turns out the guys behind
Roblox (World of Warcraft, Balatro, etc.) also care a great deal about this
not happening and so it's very easy to sandbox Lua code:

```lua
-- 'os' and 'io' libraries excluded intentionally
local safe_env = {
  print = print,
  string = string,
  table = table,
  assert = assert,
}

local config_func = loadfile("config.lua", "t", safe_env)

-- now it's safe to run!
config_func()
```

This lets us move from static to logically powered data, without inheriting
the arbitrary code execution nightmares scripting languages in this employ
usually bring in. Still not as good as, say,
[Dhall](https://dhall-lang.org/),
but unless you're working with Haskellers it's probably as good as it gets.
