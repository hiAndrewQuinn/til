---
title: Lessons learned from 6 months of operating a teensy-tiny news archive
subtitle: "Technically closer to 8 months, but who's counting?"
date: 2024-06-01
tags: 
- law-of-diminishing-returns
- hugo
- git-as-a-database
- github-actions
- documentation
- selkouutiset-archive
- secondary-language-acquisition
- cost-optimization
- cloud-costs
---


1.**The best websites are [home-cooked meals](https://www.robinsloan.com/notes/home-cooked-app/).** [Andrew's Selkouutiset Archive](https://hiandrewquinn.github.io/selkouutiset-archive/) was birthed after I realized there was no obvious way to fetch the *previous* articles of the "Easy Finnish" daily news broadcast. This annoyed me as a student of the language. "Here we have a stream", I thought, "of high-quality, human-written, interesting practice material, and no easy way to access it!" So I went out of my way to create such a way, and me and my language skills have been profiting off of it ever since. A very small website, for a very specific need, just leaves a delightful aftertaste in the mouth.

2. **Cronjobs and Git complement each other nicely.** ASA runs off of 3 Git repos, each submoduling and iterating upon the last. The first repo archives the page as-is with a cronjob. The second repo turns the first repo into cleaned-up Markdown with an English translation with another cronjob. The third repo turns the cleaned-up Markdown into a Hugo website with a third cronjob. If at any point an issue appears, with e.g. the shell scripts that do the actual cleaning, I always have the option to simply revert to a previous commit and work fresh.

3. **Simplicity is underrated.** Everything about this website is done as simply as I could stand. For example, notice how there's no database at all. In essence we are using Git itself as our database, specifically that very first repo. That means this site is *entirely static*, and can be deployed directly to Github Pages without any complications. I don't think I've had to tweak anything about that flow in the last 3 months.

4. **Working locally is *hella* underrated.** Originally I started this because I got tired of spending 15 minutes every morning copying and pasting that day's news, along with its Google Translation to English, into Anki. Later I got tired of spending 5 minutes per article copying and pasting the actual archive, even though the whole translation was right there as well. Because I made sure to make the intermediate repo as easy to work with as possible, I later found it very straightforward to write [a little Python program](https://github.com/Selkouutiset-Archive/selkokortti/tree/main) that could process *all* of the news into a flashcard format. Crucially, because all of the Git repos are things anyone else can pull down, this program *clones its own local copy* of Repo #2 and creates flashcards on that copy on the local filesystem, making it probably an order of magnitude faster than even the fastest response-request cycle could get (and much more deterministic too).

5. **Bare HTML never goes out of style.** My archive doesn't use any JavaScript at all, it's just HTML with the smallest amount of classless CSS I could get away with to make it easy to read the Finnish and English side-by-side. At one point I thought perhaps I should add in some code to help people find the dictionary forms of the rarer words, but it turns out [I already wrote a command line tool to solve that general case](https://github.com/hiAndrewQuinn/finstem). Adding JavaScript in to a non-JS website to solve that task felt like way more complexity than it was worth.

6. **[pandoc](https://pandoc.org/) is the bee's knees!**
