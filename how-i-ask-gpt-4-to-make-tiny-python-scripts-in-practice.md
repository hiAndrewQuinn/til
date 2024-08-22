---
title: How I ask GPT-4 to make tiny Python scripts in practice
date: 2024-08-22
tags: 
- automation
- cost-optimization
- heuristics
- law-of-diminishing-returns
- speed
- software-dev
- simple-suboptimal-solutions
- python
- gpt
---


1. First get a working script. "Hey GPT-4, write me a ChatGPT script that does <X>."
2. Manually check over the script and iterate until it's giving me what I want.
3. "Now wrap the script into a [`click`](https://click.palletsprojects.com/en/8.1.x/) command-line interface." I almost always specify to use an `--input` flag and an `--output` flag.
4. If the data it's working with is human-readable, "Make it so that if `--input` is not specified, it reads data from stdin."
5. If the data it's writing is human-readable, "Make it so that if `--output` is not specified, it emits data to stdout."
6. If the script is complicated enough that error logging is warranted: "Add logging and [`colorlog`](https://pypi.org/project/colorlog/). Ensure all error messages are written to `stderr` so that it does not clash with output."

This advice is optimized for **small** Python scripts, usually under 200 lines in total,
for automating semi-mundane tasks like

- Converting CSV or JSON into a more structured Markdown document.
- Cleaning up and working programmatically with Excel sheets.
- Creating tiny REPLs to help with human categorization of mundane data.

I often find myself creating tiny scripts like this to shuffle things in 
and out of the various enterprise systems I work with. Python is famously
the second-best tool for everything, and it hasn't let me down yet.
