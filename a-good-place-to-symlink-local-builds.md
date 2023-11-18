---
title: A good place to symlink local builds
date: Sat Nov 18 10:31:10 AM EET 2023
tags: anki,linux,symlinks,builds
---

I've been a big fan of both [spaced repetition](https://gwern.net/spaced-repetition) in general and the [Anki spaced repetition system](https://github.com/ankitects/anki) in particular for a long time now. So today, after a fresh new install and [blinging out](https://github.com/hiAndrewQuinn/shell-bling-ubuntu) of Ubuntu 23.10, I decided to take the next step, as I often do with programs I use a lot, and try to build and compile it myself.

This turned out to be pretty easy! The [docs](https://github.com/ankitects/anki/blob/main/docs/development.md#running-anki-during-development) warn that `./run` is slower than the non-optimized build, but I don't notice much of a difference on my machine. It did however leave me with the question: Where should I put the `anki` symlink to `./run`?

The options which were in my $PATH at the time of writing:

```fish
~ 
❯ echo $PATH | tr ' ' '\n'
~/.cargo/bin
~/.local/bin
~/.fzf/bin
/usr/local/sbin
/usr/local/bin
/usr/sbin
/usr/bin
/sbin
/bin
/usr/games
/usr/local/games
/snap/bin
```

(One of the nice things about the [fish shell](https://fishshell.com/) is that adding things to your path is super easy. Just run `fish_add_path -U where/ever` and it's there for life! Even better, it adds to the _front_ of the path, so you get this natural gradient of more-specific to less-specific to your needs. You can tell this project is my first time working with [rustup](https://rustup.rs/)! because the `~/.cargo/bin` is so new!)

GPT-4 was kind enough to give me a rundown of what each of these is used for, which looks quite sensible:

| Directory                | Description |
|--------------------------|-------------|
| `~/.cargo/bin` | Contains executables related to Rust programming, managed by Cargo. |
| `~/.local/bin` | Common place for **user-installed software, specific to your user account.** |
| `~/.fzf/bin`   | Likely contains the executable for `fzf`, a command-line fuzzy finder. |
| `/usr/local/sbin`         | For system administration programs installed locally, not part of the system-wide installation. |
| `/usr/local/bin`          | Contains user programs installed system-wide, not part of the system distribution. |
| `/usr/sbin`               | For software that is part of the standard system distribution, used for system administration. |
| `/usr/bin`                | Contains binary executables for software that comes with the operating system and additional packages. |
| `/sbin`                   | Contains system management and administration programs. |
| `/bin`                    | Contains essential binary executables required for the system to boot and run. |
| `/usr/games`              | For game executables. |
| `/usr/local/games`        | Similar to `/usr/games`, but for games installed locally. |
| `/snap/bin`               | Contains executables for applications installed through Snap. |

Looks like `~/.local/bin/` is the place to put it!
