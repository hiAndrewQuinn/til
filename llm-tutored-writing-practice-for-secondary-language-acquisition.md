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

---

Here are some screenshots of the loop in action. First I open the two side by side:

![image](https://github.com/user-attachments/assets/29ad4af6-ccf2-4d90-8a6e-411283200259)

I am asked to translate "Yes, private beach and rowboat included in the price."
I give it my best shot: "Kyllä, yksityinen ranna ja vene sisältyvät hintaan."
I am a little shaky on yksityinen being the right word, but confident on the rest.
I also either don't know, or can't retrieve from passive memory, the word for "rowboat"
specifically - I substitute "vene", the generic word for boat.

![image](https://github.com/user-attachments/assets/8614add8-4c72-47b8-8212-79f2f0ddbcb6)

I hit enter. To my surprise, yksityinen was right - but ranna, the word next to it,
was wrong! It should have been ranta, with a T.

![image](https://github.com/user-attachments/assets/de9a6cc3-8164-4d0e-ab93-4502cfa7f697)

I try again. I still can't bring to mind what "rowboat" would mean. LLMs are great at
this kind of semantic search, so I make up a word that vaguely fills the space -
ponnistusvene, a fake Finnish word that connotes "pushing boat".

![image](https://github.com/user-attachments/assets/3bfee769-e2bc-4409-aa59-9a81f3f26a8e)

The LLM recommends two words that look like they might hold promise: soutuvene, and
kumivene. Let's try the first one. Does that mean rowboat?

![image](https://github.com/user-attachments/assets/cb051c34-c3c0-4d65-8614-5a0e9d592217)

It does! Now let's finally see what is on the other side of the Anki card:

![image](https://github.com/user-attachments/assets/a33778ba-4c99-4bb6-9a8e-8bf3f37d3b34)

I can *read* this perfectly fine, even though I couldn't produce it. The language
here is much more laid back and informal than the book-speak I actually wrote:
"Joo" instead of "Kyllä" (yes), "oma" (your own) instead of "yksityinen" (a private),
"kuuluu" (belongs to) instead of "sisältyivät" (is included in). Nevertheless, had I
generated the sentence we ended up with on the right on my first go, I would still
probably mark the Anki card as Good, because I would have said the same thing
semantically - just in a more formal register. And that's fine by me, for now.

---

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
