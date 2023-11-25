#!/usr/bin/env fish

# USAGE: `source <this-file.fish>`, then call fzf-tags.
function fzf-tags
    sed -n -e '/^tags:/,/^---/p' *.md |
        rg '^- ' |
        cut -c 3- |
        sort |
        uniq -c |
        fzf --multi |
        awk '{print "- " $2}'
end
