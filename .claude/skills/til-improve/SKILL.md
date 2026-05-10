---
name: til-improve
description: This skill should be used when the user invokes "/til-improve", asks to "improve a TIL post", "polish this blog post", "enrich this markdown file", "add tags to this TIL", "hyperlink this post", "add footnotes", or wants to apply the full editorial + hypertextualization pipeline to a Markdown file in the til repo.
version: 0.1.0
---

# TIL Improve — Editorial & Hypertextualization Pipeline

Transform a raw TIL Markdown post into a rich, convivial, highly-linked piece of writing ready for Hugo/rumdl compilation. Apply all five stages in order; do not skip stages unless there is an explicit reason documented inline.

## Stage 1: Metadata & Tagging

Read the post's frontmatter. Select **5–7 tags** from the known corpus (see `references/tag-corpus.md`).

Rules:
- Prefer existing high-frequency tags that genuinely fit the post's themes.
- Follow a power-law distribution: broad tags (`shell`, `automation`, `productivity`) should appear more often than hyper-niche ones.
- Invent **at most 2 new tags** if the corpus truly lacks coverage for a core theme. New tags should be lowercase, hyphenated, and feel at home next to existing ones.
- Replace the existing `tags:` block in the frontmatter entirely; do not append.

## Stage 2: Copyediting & Tone

Apply all four sub-rules in a single editing pass.

### 2a. Acronym Expansion (Google Style)
Expand every acronym the first time it appears: write the acronym first, then the expansion in parentheses immediately after. Example: `FST (Finite State Transducer)`. On subsequent appearances, use the acronym alone.

### 2b. Clarity & Grammar
Correct spelling, typos, punctuation, and grammar. Rewrite structurally confusing sentences so a C1 English speaker can parse them without re-reading. Preserve the author's voice — fix, don't rewrite wholesale.

### 2c. The Convivial Filter
Remove all profanity and foul language. Rewrite those passages to maintain a jolly, welcoming, intellectually curious tone, even if the subject matter is cynical, morose, or very technical.

### 2d. Title Check
Ensure the `title:` frontmatter value is sentence-case, grammatically correct, and free of double-spaces or trailing punctuation. Do not rewrite creative or quirky titles — only fix outright errors.

## Stage 3: Enrichment — The Rabbit Hole Protocol

Add depth and serendipity to the post. This is the most creative stage.

### 3a. External Hyperlinking
Identify niche concepts, named theories, specific tools, or unusual claims in the body. Link them to high-quality external sources. Quality priority order:
1. Gwern, LessWrong, Slate Star Codex / ACX, Marginal Revolution, obscure but excellent niche blogs
2. Official documentation or spec pages
3. Wikipedia (only for introductory overview; acceptable but not preferred)

Avoid linking common words or phrases that don't benefit from a reference. Do not invent URLs — only link to pages you are confident exist with the correct URL.

### 3b. Footnote Generation
Use Hugo-compatible Markdown footnotes (`[^1]`, `[^2]`, etc.) liberally. A good footnote:
- Does **not** merely restate what the linked text already says.
- Riffs 2–3 layers deep: implications, history, weird trivia, counterarguments, or adjacent curiosities.
- Comes back up for air and ties back to the main thread.

Place the footnote reference inline in the text and collect all `[^N]:` definitions at the bottom of the file, after the main body.

### 3c. Internal Linkage
Search for opportunities to link to the author's own work:
- Other TIL posts in `/home/andrew/Code/til/` that are meaningfully related.
- GitHub repositories at `https://github.com/hiAndrewQuinn/` that are directly relevant.
- The author's site at `https://andrew-quinn.me/`.

For each tag applied in Stage 1, recall at least 3 other TILs sharing that tag. If a serendipitous connection exists, draft a sentence or footnote linking them. Use relative-style internal links for TILs that Hugo will resolve, e.g. `[my other post](/til-slug/)`.

To discover which TILs share a tag, `grep` the `til/` directory for posts containing that tag in their frontmatter.

## Stage 4: Formatting & Tooling

### 4a. rumdl Formatting
After editing is complete, run `rumdl fmt` on the file if `rumdl` is available on the system. If it is not installed, apply the most common rumdl-style fixes manually:
- Single blank line between blocks (no double-blank-lines except before headings if the project uses them).
- ATX-style headings (`##`, not underline-style).
- Fenced code blocks with explicit language labels where identifiable.
- No trailing whitespace.
- File ends with a single newline.

### 4b. Hugo Compatibility
Check that rumdl formatting does not break Hugo shortcodes or goldmark rendering. The `hugo.toml` at `/home/andrew/Code/til-site/hugo.toml` enables `unsafe: true` for goldmark, so raw HTML inside Markdown is permitted.

### 4c. Proactive Deprecation Fixes
While editing `hugo.toml` or any Hugo config file (only if it is in scope for the current task), apply these renames:
- `languageCode` → `locale`
- `languages.en.languageName` → `languages.en.label`
- `.Language.LanguageDirection` → `.Language.Direction`
- `.Site.LanguageCode` → `.Site.Language.Locale`

Do **not** touch `hugo.toml` during a normal `/til-improve` run unless the user explicitly requests Hugo config changes.

## Stage 5: Workflow & Hand-off

**NEVER commit or push.** The final deliverable is the edited `.md` file on disk. Preparing a draft for human review is the sole goal.

After writing the improved file, output a **completion summary** with exactly these sections:

```
## Changes Summary

### Tags Applied
[list the 5–7 tags, noting which (if any) are new]

### Major Edits
[bullet list: acronym expansions, rewrites, tone fixes, title fix if any]

### External Links Added
[bullet list: anchor text → URL]

### Footnotes Added
[count and brief description of what each footnote covers]

### Internal Links Added
[bullet list: linked post/repo → reason for link]
```

Then append this exact block verbatim (no paraphrasing):

```
---

Agent Status: Draft complete. Ready for human review.

How to review these changes:
If you want a side-by-side diff in your terminal using Vim:
    git difftool -t vimdiff [filename.md]
(Use ]c to jump to the next change, [c for the previous, and :qa to quit).

Alternatively, if you have delta installed, just run git diff [filename.md] for a beautiful syntax-highlighted review!
```

## Additional Resources

### Reference Files

- **`references/tag-corpus.md`** — Frequency-ranked list of existing tags from the TIL corpus. Consult before selecting or inventing tags.

## Quick Reference Checklist

- [ ] Stage 1: 5–7 tags selected from corpus; ≤2 new invented
- [ ] Stage 2a: All acronyms expanded on first use
- [ ] Stage 2b: Spelling, grammar, clarity corrected
- [ ] Stage 2c: No profanity; convivial tone throughout
- [ ] Stage 2d: Title is sentence-case and clean
- [ ] Stage 3a: Niche concepts hyperlinked to quality external sources
- [ ] Stage 3b: Footnotes added, each riffing 2–3 layers deep
- [ ] Stage 3c: Related TILs and GitHub repos linked where relevant
- [ ] Stage 4a: `rumdl fmt` applied (or manual equivalents)
- [ ] Stage 4b: Hugo goldmark compatibility confirmed
- [ ] Stage 5: Completion summary output; diff reminder appended; NO commits made
