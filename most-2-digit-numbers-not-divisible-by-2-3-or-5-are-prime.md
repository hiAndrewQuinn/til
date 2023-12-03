---
title: Most 2 digit numbers not divisible by 2, 3, or 5 are prime
date: 2023-12-04
tags: 
- fun
- math
- heuristics
---

There are only four single-digit primes: 2, 3, 5, and 7. So all two-digit numbers are either prime, or divisible by one of these four numbers.

Of the four, 2, 3 and 5 are all very easy to spot check whether a number is divisible by them or not (for 3, add the digits first, and see if that sum is divisible by 3). If a given 2-digit number doesn't fall into this category, 7 times out of 8, it's prime.

Speaking of 7, it's the odd one out. You can't spot check 7 very quickly. But luckily there are only three 2-digit numbers divisible by 7 that are not divisible by 2, 3, or 5. Naturally they are multiples of 2 primes greater than or equal to 7 itself: 7 x 7 = 49, and 7 x 11 = 77, and 7 x 13 = 91.49 is pretty easy to remember as 7-squared, and 77 is kind of obvious, so that just leaves 91 as the joker in the deck.
