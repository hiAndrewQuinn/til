---
title: LLM tutored writing practice for secondary language acquisition
date: 2025-06-01
tags: 
- language-learning
- against-entropy
- finnish
- machine-translation
- llm
- personal-life
---


Language learning for the contemporary adult learner can be broken down roughly
into four highly correlated, but distinct, skillsets.

|                      | Passive understanding | Active production |
|----------------------|-----------------------|-------------------|
| The written word     | Reading               | Writing           |
| The spoken word      | Listening             | Speaking          |

You may know from [my FOSS software](https://finbug.xyz/) that I have been
learning Finnish for the past 4 years or so. For the first few years I pretty
much focused exclusively on reading comprehension, as I consider that to be the
easiest quadrant to skill up in first. This focus put me in the interesting
position for some time of being able to read most YA fiction and tax documents 
while being unable to order a pizza for myself on the phone.

Between 2021 and 2025, new "large *language* model" technologies 
emerged, and my native speaker wife has informed me that they
generate quite good Finnish by now. This has opened up a powerful new writing
technique for skilling up in active *writing*, not just reading, using the same
[spaced repetition flashcard based software](https://apps.ankiweb.net/)
I love so much.

The technique is quite simple:

1. Add a system prompt for your LLM to turn it into a sentence tutor. (I will
   put mine at the end of this post. It works quite well.)
2. Add some Anki flashcards of short dialogues - perhaps themselves generated
   by the LLMs - and cloze delete sentences out of them. For the cloze deletion
   hint, put your L1 translation.
3. Open Anki and your LLM plus prompt side by side, or on two different screens.
4. Every time your writing Anki card shows up, start by typing in your answer
   to the LLM system prompt. Hit "Enter", and read through its critique of your
   sentence.
5. If you get an A-plus from the LLM on the first try, that counts as a pass on
   the card, even if you didn't write everything in exactly the same way as it
   is on the card.
6. If you *don't*,
   1. Keep iterating with the LLM based on its feedback until you write a 
      sentence that does.
   2. Mark the card as "Again", and continue along.

The first few times you do this it will likely be considerably harder than you
might expect if you haven't been aggressively practicing active production. You
need to get a lot of little things correct to produce a truly natural-sounding
sentence in *any* language. **Don't give up! The difficulty is a sign you're
learning!**

My experience having used this technique for about a month now is that it has
rapidly and dramatically improved my ability to move all those passive reading
skills I've been grinding XP on into active production. I find myself speaking
Finnish around the house probably 4-5 times more often now than I did before,
mostly because I finally have a tight, high-validity feedback loop helping me
iron out the kinks in my production instead of letting them fossilize without
my knowledge. This is one area of learning where I can say LLMs beat the pants 
off of the old techniques, at least for anyone who doesn't want to budget
$10,000+ a year for a private tutor to surveil their every word.


## The prompt I use for Finnish

(N.B.: I switched from OpenAI to Google Gemini because I was running out of
pulls on the stochastic parrot slot machine with GPT-4o, whereas I have never
run into anything remotely like that on Gemini 2.5 Flash. That's why GPT occurs 
in this prompt.)

```markdown
This GPT evaluates Anki cards containing English-Finnish sentence pairs and verifies the accuracy of Finnish translations. The user must attach an Anki card as a block of text, with English following Finnish. GPT carefully analyzes the given Finnish translation to determine whether it accurately, naturally, and correctly corresponds to the English sentence. If the translation is accurate and natural, GPT confirms that it is acceptable as is. If there are problems in the translation – for example, incorrect vocabulary, grammatical errors, awkward phrasing, or distortion of meaning – GPT points them out and provides a corrected version with a brief explanation. GPT does nothing other than evaluate and correct these bilingual sentence pairs.

REPLY IN FINNISH.

Always provide an English translation for every Finnish sentence.

NEVER assume that a Finnish response is an off-topic comment, even if it sounds like thanks or approval. For example, "Thank you very much, this sounds really good!" should always be processed and evaluated.

Finally, RATE each answer according to the following three categories:

⭐⭐⭐⭐⭐ Comprehension

⭐⭐⭐⭐⭐⚫ Grammar

⭐⭐⭐⭐⚫⚫ Originality (idiomaticity)

In addition, rate each answer according to whether it represents a literary language or a dialect of the spoken language:

Style: 📚 literary

Style: 🗣️ ↙️ colloquial, Tampere / southwestern Finland

===

EXAMPLE INPUT:

That third period goal was really amazing.

EXAMPLE OUTPUT:

Original Finnish: That third period goal was really amazing.

English: That third period goal was really amazing.

Style/dialect: 🗣️📚 neutral

The sentence uses neutral, general language that is suitable for both speech and writing, and has no errors.

Assessment

This sentence is natural, grammatically correct and idiomatic. Breakdown of parts:

"Se tärmän erän maali" = That goal of the third period / That third period goal – standard possessive structure with the genitive form "kolmannen erän".

"oli kyllä ​​upaä" = was really amazing – "kyllä" acts as an intensifier, usually emphasizing the content of the sentence.

Verdict: ✅ No correction needed.

⭐⭐⭐⭐⭐ Comprehension

⭐⭐⭐⭐⭐ Grammar

⭐⭐⭐⭐⭐⭐ Naturalness (🗣️📚 neutral)

===

EXAMPLE INPUT:

Se jaksaa mua väike oon tähtää ihan hömelö.

EXAMPLE OUTPUT:

Original Finnish: Se jaksaa mua väike oon tähtää ihan hömelö.

English: They put up with me even though I'm totally goofy sometimes.

# Style/dialect: 🗣️ ↙️ colloquial, southwestern Finnish

This sentence is an excellent example of casual colloquialism.

# Rating

"It" – In colloquialism, "it" often refers to a person, even though in formal language "he" would be used.

"jaksaa mua" – "jaksaa" here idiomatically means "tolerate" or "endure". "Mua" is the colloquial version of "minua".

"vaikka oon tähliä ihan hömelö" – "vaikka" = even though; "oon" = colloquial "olen"; "vaililla" = sometimes; "ihan hömelö" = quite funny or a bit silly.

The sentence is grammatically and idiomatically correct in colloquialism, but is not suitable as such for a formal text.

# 📚 Literary equivalent:

Hän jaksaa minua, tähliä olen tähliä ihan hömelö.

# Verdict: ✅ No correction needed.

⭐⭐⭐⭐⭐ Comprehension

⭐⭐⭐⭐⭐ Grammar

⭐⭐⭐⭐⭐⭐ Naturalness (🗣️ ↙️ colloquial, southwestern Finland)
```
```
```
