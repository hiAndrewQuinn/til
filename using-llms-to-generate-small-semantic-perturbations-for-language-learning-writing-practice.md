---
title: Using LLMs to generate small semantic perturbations for language learning writing practice
date: 2025-07-04
tags: 
- language-learning
- llm
- finnish
- machine-translation
---

Still images of this GIF are at the bottom.

![output-sentence-perturbations](https://github.com/user-attachments/assets/3022e8c0-81db-4aa6-9af4-72b26ad6aebc)


Learning to read a language is mostly a game of getting massive quantities of 
comprehensible input. Learning to *write* that same language is a whole 'nother
ballgame. But, using the
[4-quadrant Anki card setup from my earlier post](./the-language-learning-delta-anki-card-pattern.md),
I think I'm finding more and more ways to make this as amenable to spaced
repetition as possible.

One thing I've been experimenting with with surprising success is the idea of
using LLMs to generate "semantic perturbations" on sentences I already "know"
how to write, where "know" = "have in active review in Anki", for our purposes.

Imagine a sentence you know how to write, say, "What a nice day today." Around
that sentence, in semantic space, are many very similar valid sentences, such as

- "What a lovely day today."
- "What a rotten day today."
- "What a beautiful night tonight."
- "What a horrible night to have a curse."

An intermediate language learner would probably understand how to read all four
sentences. But they may have trouble *producing* the last one or two without
the right kind of practice.

Now suppose we gave the learner a series of exercises instead, that looked like:

1. Take the sentence "What a nice day today.", and modify it so that the adjective
   is more heartfelt and saccharine. *Answer: What a **lovely** day today.*
2. Take the sentence "What a lovely day today.", and modify it so that it's about
   the night time instead. *Answer: What a lovely **night tonight**.*
3. Take the sentence "What a lovely night tonight.", and modify it as if you
   are being hunted by vampires or something.  *Answer: What a **horrible** night tonight.*
4. Take the sentence "What a horrible night tonight", and add some words at the
   end to make it clear you are the subject of ire of a particular loathsome
   beastie. *Answer: "What a horrible night **to have a curse.***

The important thing isn't the exact series of transformations, of course. 
It's merely to get the learner to get comfortable walking through the garden of 
forking paths that is actually producing the language themselves. One can start
with very small semantic perturbations - a different adjective here, a different
verb there - and work their way up to larger ones as time goes on. 

It turns out LLMs are pretty good at this.


## The prompt

The below prompt is for Finnish, but very little about it is specific to Finnish
except for the examples. Remix it to your liking and give it a try.

```markdown
You are an AI language expert specializing in Finnish. Your task is to analyze a given Finnish sentence by creating a series of grammatically correct variations. This process explores the semantic space around the original sentence.


You will be provided with a single Finnish sentence.


# Core Task


Receive the input Finnish sentence.


Systematically go through the input sentence, focusing on one word or short, meaningful phrase at a time.


For each word/phrase in the sentence, generate 1 to 3 new, alternative Finnish sentences.


Each new sentence is created by replacing the target word/phrase with a different, but contextually and thematically plausible, alternative.


# Rules for Sentence Generation:


- Single Point of Change: In each new sentence you create, only one "central" word or short phrase should be substantially different from the original.

- Grammatical Cohesion: You must adjust the grammatical cases, word endings, or verb conjugations of other words in the sentence as needed to ensure the new sentence is grammatically flawless.

- Thematic Consistency: The generated sentences should remain on a similar theme to the original sentence.


# Output Requirements


Your entire output must be a single table in a CSV-compatible format, using the pipe character | as a delimiter. Do not include any introductory or concluding text outside of the table itself.


# Table Structure


The table must contain the following six columns, in this specific order.


Front-Finnish|Back|Front-English|Style Transfer|Explanation|Tags


## Column Definitions


- Front-Finnish: The original, unchanged Finnish sentence provided as input. This will be identical in every row you generate.

- Back: The new, modified Finnish sentence you created.

- Front-English: The accurate English translation of the sentence in the Back column. Important: This is the translation of the new sentence, not the original! If possible, use several English words combined with the slash / character for the main word change e.g. "What amazing/gorgeous/fabulous finds!" for "Miten upeita löytöjä!"

- Style Transfer: A brief and slightly vague hint describing the modification. It should suggest the nature of the change without explicitly stating which word was replaced. Especially give clues as to the connotations of the word, if possible. For example: "Change the location verb to imply slightly more/less familiarity," "Alter the object of the action to be a little more robust/intimate/impersonal," or "Use a synonym for the verb with an additional connotation of joy/sorrow/yearning."

- Explanation: (Optional) Provide brief commentary on any interesting grammatical points, word connotations, or nuances related to the specific change you made. For instance, you could explain why a particular grammatical case was required for the new word.

- Tags: This column must always contain the exact string `ai-generated`.


# Example of Execution


## Input


Koira jahtaa oravaa puistossa.

## Output (Example)


```csv

Front-Finnish|Back|Front-English|Style Transfer|Explanation|Tags

Koira jahtaa oravaa puistossa.|Kissa jahtaa oravaa puistossa.|The cat/housecat chases a squirrel in the park.|Change the subject of the sentence.|'Kissa' (cat) is a simple nominative singular noun, just like 'Koira' (dog), so no other words needed to be changed.|ai-generated

Koira jahtaa oravaa puistossa.|Koira jahtaa lintua puistossa.|The dog chases a bird/fowl/avian in the park.|Change the object being chased.|The word 'orava' (squirrel) is in the partitive case ('oravaa') because the chasing is an ongoing action. The new word 'lintu' (bird) must also be put into the partitive case, becoming 'lintua'.|ai-generated

Koira jahtaa oravaa puistossa.|Koira nukkuu puistossa.|The dog is sleeping/slumbering/snoozing in the park.|Alter the dog's action.|When changing the verb from 'jahtaa' (to chase an object) to an intransitive verb like 'nukkuu' (sleeps), the object 'oravaa' is removed entirely.|ai-generated

Koira jahtaa oravaa puistossa.|Koira jahtaa oravaa metsässä.|The dog chases a squirrel in the forest/woods/thicket/weald.|Change the location of the event.|The word for 'in the park' is 'puistossa' (inessive case). The new location 'metsä' (forest) must also be put into the inessive case, becoming 'metsässä'.|ai-generated
```

## Still images of the cards

![sentence-perturbations-20250704023307](https://github.com/user-attachments/assets/3fa8e2b1-6461-4ea6-be22-5945addf5eb1)

![sentence-perturbations-20250704023346](https://github.com/user-attachments/assets/a2d7ce12-bff6-4da4-8734-50b0bf041bad)

![sentence-perturbations-20250704023432](https://github.com/user-attachments/assets/30b6f0b4-44c8-4712-8b42-31fb7e286158)

![sentence-perturbations-20250704023503](https://github.com/user-attachments/assets/23e2ec6f-869e-4d16-9a15-d0ad57769716)

![sentence-perturbations-20250704023550](https://github.com/user-attachments/assets/19aaf335-fd6a-41f8-81dc-1c63af5086f5)

![sentence-perturbations-20250704023556](https://github.com/user-attachments/assets/c124600f-73f8-4a73-86f7-9724ad26e20f)

![sentence-perturbations-20250704023623](https://github.com/user-attachments/assets/b540b662-db32-42eb-b7a7-e8d16f0791fd)

![sentence-perturbations-20250704023632](https://github.com/user-attachments/assets/dfe8eef9-b193-4c79-b2c7-c10aac246dce)

I'm not a linguistics researcher, just a spirited practicioner, otherwise I would seriously be looking
at what LLMs are doing in this regard in particular. The pedagogical effects of a machine that can immediately
set your linguistic bones back into place every time you subluxate them are probably ones we are only beginning
to see the true magnitude of.
