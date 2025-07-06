---
title: Switching Vim colorschemes based on which keyboard layout I have active
date: 2025-07-06
tags: 
- automation
- dotfiles
- personal
- productivity
- shell
- sway
- i3
- i18n
- vim
- bash
---


Did you know Vim has a client-server model baked in? Of course it does. If you run

```bash
vim --servername LOVE
```

, then in another terminal something like

```bash
vim --servername LOVE --remote-send "<Cmd>colorscheme peachpuff<CR>"
```

, you'll find your Vim terminal switch to the creamy default theme all true gangsters 
love - without you actually having to do anything.

I frequently flip between a US- and Finnish-based keyboard while doing
my language studies.
I already had
[a tiny shell script in place which plays a seventh major chord every time they switch](https://news.ycombinator.com/item?id=41519046),
courtesy of
[Sway WM](https://swaywm.org/):

```bash
bindsym $mod+Space exec --no-startup-id ~/.config/sway/switch_layout.sh
```
```
```
So when I found this out, I realized I could very quickly make my life
easier by just adding something like

```bash
if [[ "$layout" == "Finnish" ]]; then
  vim --servername LOVE --remote-send "<Cmd>colorscheme peachpuff<CR>" &
elif [[ "$layout" == "English (US)" ]]; then
  vim --servername LOVE --remote-send "<Cmd>colorscheme default<CR>" &
fi
```

Studying or not,
I basically always have Vim open somehwere in my field of vision.
This turns out to be a very useful extra way to cut down on error rates, 
like when I mean to type `ö` instead of `;`.


## The complete `switch_layout.sh` script

This is a little more complex, as I often have *multiple* Vim sessions
open simultaneously, and they all get their own server names. The
`xargs` stuff is just to make sure the command gets sent to all of them.

```bash
#!/bin/bash

VIM_SERVER="VIM"

swaymsg input '1:1:AT_Translated_Set_2_keyboard' xkb_switch_layout next

layout=$(swaymsg -t get_inputs | jq '.[].xkb_active_layout_name' | sort -u | head --lines=1 | tr -d '"')

A=440
C_SHARP=554.37
E=659.25
G_SHARP=830.61

function change_vim_color() {
  vim --serverlist | grep "^VIM" | xargs -I _ -- vim --servername _ --remote-send "$1"
}

if [[ "$layout" == "Finnish" ]]; then
  change_vim_color "<Cmd>colorscheme blue<CR>" &

  # ascending seventh major
  play -n synth 0.2 sine $A vol -30dB &
  play -n synth 0.2 sine $C_SHARP vol -30dB &
  sleep 0.2
  play -n synth 0.2 sine $E vol -30dB &
  play -n synth 0.2 sine $G_SHARP vol -30dB &


elif [[ "$layout" == "English (US)" ]]; then
  change_vim_color "<Cmd>colorscheme habamax<CR>" &

  # descending seventh major
  play -n synth 0.2 sine $G_SHARP vol -30dB &
  play -n synth 0.2 sine $E vol -30dB &
  sleep 0.2
  play -n synth 0.2 sine $C_SHARP vol -30dB &
  play -n synth 0.2 sine $A vol -30dB &

fi

# Send notification with the current layout
notify-send -u low "Switching keyboard layouts: $layout"
```
