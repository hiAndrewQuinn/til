#!/bin/fish


set til_path ~/Code/til/

function read_title
    set prompt 'set_color green; echo -n "Title"; set_color normal; echo "> "'
    read -p $prompt -g title
end

function to_kebab_case
    echo $argv | tr '[:upper:]' '[:lower:]' | tr -cs '[:alnum:]' - | sed 's/^-//' | sed 's/-$//'
end


function til
    read_title
    set file_name (to_kebab_case $title).md
    set file_path $til_path/$file_name

    set -l frontmatter "---
title: $title
date: $(date)
tags: 
---

"

    echo $frontmatter >$file_path

    kitty --title til -e -- nvim $file_path + -c startinsert 2>/dev/null

    pushd $til_path

    git add $file_name
    git commit -m "new til: $title"
    git push && .git/hooks/post-push

    popd
end
