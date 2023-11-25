# Today I Learned (TIL)

I learn a lot of new things every day. At some point I decided I wanted to have
a public record of some of them, so I wrote a [shell script](./til.fish) to let
me open a terminal, type `til`, and immediately jot down whatever little tidbit
I just came across. This repo is the result of that.

## Quickstart

_Trouble with all the programs I run in my various `.fish` scripts? Try [Shell Bling Ubuntu](https://github.com/hiAndrewQuinn/shell-bling-ubuntu), that should contain most of 'em._

1. Fork the repo.

```fish
# NOTE: THIS IS THE FISH SHELL. FISH. 🐟

set gh_prompt 'set_color yellow; echo -n "My Github username is"; set_color normal; echo " :: "'
read --prompt $gh_prompt GITHUB_USERNAME
set check_gh (curl -sH "Accept: application/vnd.github.v3+json" https://api.github.com/users/$GITHUB_USERNAME | jq '.message' | tr -d '"')

if test "$check_gh" = "Not Found"
          set_color red; echo "Not found";  set_color normal; sleep 2; echo "Quitting the shell. Press Ctrl+C to stop."; sleep 3; exit 1
  else
          set_color green; echo "$GITHUB_USERNAME found!"; set_color normal;
  end



mkdir -p ~/Code/
cd ~/Code/
git clone https://github.com/$GITHUB_USERNAME/til.git
cd til/
rm -rf .git/

# Get our fish shells into your directory, then test them out.
cp *.fish ~/.config/fish/functions/

sleep 2
fzf-tags # for dynamic tag selection.
         # TAB to select, you can select multiple tags.

sleep 2
til      # for writing a new TIL. Includes fzf-tags. Magic! ✨
```
