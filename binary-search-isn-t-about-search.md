---
title: "Binary search isn't about search"
subtitle: "It's about what is always true, and what is only transiently with us."
date: 2025-03-07
tags: 
- data-structures-and-algorithms
- software-dev
- todays-lucky-10000
---

Suppose you're trying to track down a bug that appeared in a series of Git commits.
You've been idly keeping track of where this bug appears in your
[lucky](https://github.com/not-an-aardvark/lucky-commit)
commits by hand, while busy with other things. So far you've compiled this table:

```
0000000    🧼 clean, no bug.
0000001    🧼
0000002    🧼
0000003    🧼
0000004    🧼
0000005    🧼
0000006    🐛 bug first appears here.
0000007    🐛
0000008    🐛
0000009    🤔 bug mysteriously disappears...
```

Then an EMP explodes in your vicinity and scrambles your memory circuits. The Internet
is down, you don't have the
[git-bisect man pages](https://git-scm.com/docs/git-bisect)
downloaded locally, and all you remember is that your first commit was good, your last
commit was good but for reasons you don't understand, and *something* bad is probably
still lurking in there. But where?

It turns out this problem can be reframed as a common binary search of sorts.
However, just because binary search is common
does not mean it is at all *easy*.
[Donald Knuth](https://en.wikipedia.org/wiki/Donald_Knuth)
himself comments:

>Although the basic idea of binary search is comparatively straightforward,
the details can be surprisingly tricky, and many good programmers have done it
wrong the first few times they tried. --Donald Knuth, *The Art of Computer Programming, Second Edition, Volume 3: Sorting and Searching*, section 6.2.1, "Searching an Ordered Table"

[Jon Bentley](https://en.wikipedia.org/wiki/Jon_Bentley_(computer_scientist)),
the writer of *Programming Pearls*, gave the task of writing an ordinary binary search,
not even a variant, to a group of professional programmers at IBM, and found that *90%*
of their implementations contained bugs. The most common one was apparently accidentally
running into an infinite loop.

Luckily, Bentley also gives us a structured way for us to think through these to get
much better results: The *loop* invariant.

## What is always true in the Badlands?

A normal binary search looks kind of like this in Python:

```python
def bsearch(L, T):
  l, r = 0, len(L)

  while l < r:          # ... or wait, is it l <= r?
    mid = (l + r) // 2
    if L[mid] == T:
      return mid
    elif L[mid] < T:
      pass             # do... something, with l and r.
    else:
      pass             # do... something else.

  return -1 # nothing found.
```

Instead of thinking about this sorted array as one loathsome beast, think about it
instead as the *combination of three subregions*: `L[0:l]`, `L[l:r]`, and `L[r:len(L)]`.
(Python's indexing, which includes the left index but *not* the right index,
is such that `L == L[0:len(L)] == L[0:l] + L[l:r] + L[r:len(L)]`.)

Here's where things get interesting: Since we are the ones deciding how `l` and `r`
creep along, we can just *arbitrarily decide* that we never want an element in
`L[0:l]` to be greater than or equal to `T` itself. And ditto for `L[r:len(L)]` and
never containing anything that is *less* than or equal to `T`.

Let's write these in as `assert` statements, for a laugh:

```python
def bsearch(L, T):
  l, r = 0, len(L)

  while l < r:
    for smol in L[0:l]:            # new - slow, delete for production!
      assert smol < T              # new
    for lorg in L[r:len(L)]:       # new
      assert lorg > T              # new

    mid = (l + r) // 2
    if L[mid] == T:
      return mid
    elif L[mid] < T:
      pass
    else:
      pass

  return -1
```

These simple `assert`s are what we call *loop invariants*. 
They are *always* true, 
from the very first iteration of the loop to the very last. If they are
violated, we have a problem. And one interesting consequence of them
being always true, is that they imply that if `T` is anywhere in the
array at all, it has to be in `L[l:r]` -- it just won't fit anywhere else.

Now. If `L[mid] < T`, what does that imply about the region `L[0:l]`?
It implies we can *grow* this exclusionary zone of small-timers to
encompass everything up to *and including* the `mid`point. Python's
indexing then suggests we want to use

```python
def bsearch(L, T):
  l, r = 0, len(L)

  while l < r:
    for smol in L[0:l]:
      assert smol < T
    for lorg in L[r:len(L)]:
      assert lorg > T

    mid = (l + r) // 2
    if L[mid] == T:
      return mid
    elif L[mid] < T:
      l = mid + 1                  # new
    else:
      pass

  return -1
```

If we hit that `else`, similarly, it means that `L[mid] > T`.
So we can pull *back* our `L[r:len(L)]` region to include everything
at and including that `L[mid]`. Again, being mindful of Python's
semantics:

```python
def bsearch(L, T):
  l, r = 0, len(L)

  while l < r:
    for smol in L[0:l]:
      assert smol < T
    for lorg in L[r:len(L)]:
      assert lorg > T

    mid = (l + r) // 2
    if L[mid] == T:
      return mid
    elif L[mid] < T:
      l = mid + 1
    else:
      r = mid                      # new

  return -1
```

Finally: What about when `l == r`? Well, at least in Python, when
that happens, the `L[l:r]` region is actually *empty* -- which would
fit with what we have defined up until now. 

## Testing it out

Surprisingly (at least to those of us who have tried and failed
to implement binary search in anger before) our work is done.
Deciding upon these two inequalities for the "low" region and the
"high" region gave us enough clues to logically figure out a
deduction. 

Changing either loop invariant to a *loose* equality, aka
`smol <= T` or `lorg >= T`, leads
us to natural derivations of the leftmost and rightmost element
binary searches. We will work these out in future posts.

[The following Github Gist](https://gist.github.com/hiAndrewQuinn/ccaff5b92105fbef9ad4d15993577a41)
is meant to be copied, pasted to a `test.py`, and ran as-is 
to see that this binary search does indeed seem to work. I'm
not silly enough to claim it has no bugs at all, but at least
the obvious ones seem like they have been invalidated by our
loop invariants. And, hey, the tests run pretty fast even though
we "accidentally" left in those `assert`s after all.
