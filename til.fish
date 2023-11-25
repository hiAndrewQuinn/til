#!/bin/fish


set til_path ~/Code/til/

source fzf-tags.fish

function read_title
    set prompt 'set_color green; echo -n "Title"; set_color normal; echo "> "'
    read -p $prompt -g title
end

function to_kebab_case
    echo $argv | tr '[:upper:]' '[:lower:]' | tr -cs '[:alnum:]' - | sed 's/^-//' | sed 's/-$//'
end

function til
    pushd $til_path

    read_title
    set file_name (to_kebab_case $title).md
    set file_path $til_path/$file_name

    set tags (fzf-tags)

    set -l frontmatter "---
title: $title
date: $(date --iso-8601)
tags: 
$tags
---

"

    echo $frontmatter >$file_path

    kitty --title til -e -- nvim $file_path + -c startinsert 2>/dev/null


    git add $file_name
    git commit -m "new til: $title"
    git push && .git/hooks/post-push

    popd
end
