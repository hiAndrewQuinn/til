---
title: "Binary search isn't about search III. Loop invariant of rightmost element search"
date: 2025-03-09
tags: 
- data-structures-and-algorithms
- software-dev
---

If you followed
["Binary search isn't about search"](https://til.andrew-quinn.me/posts/binary-search-isn-t-about-search/)
and
["Binary search isn't about search II"](https://til.andrew-quinn.me/posts/binary-search-isn-t-about-search-ii-loop-invariant-of-leftmost-element-search/)
properly, the following statements should suffice as a summary:

```python
L[0:l] < T < L[r:len(L)]    # ordinary binary search loop invariant
L[0:l] < T <= L[r:len(L)]   # leftwise binary search loop invariant
```

Let's complete the triptych. Take a wild guess what invariant we use for *rightmost* element binary search:

```python
L[0:l] <= T < L[r:len(L)]   # rightwise binary search loop invariant
```

## A motivating example

Consider again an array like

```python
[0, 0, 0, 0, 1, 1, 1, 1]
        # ^ wanted
```

Clearly if we want to slide `l` up to anywhere useful at all, `L[0:l]` has to include at least a couple
of `0`s. `r` labors under no such pretense. Hence why our equalities go loose-strict, or weak-strong,
for this third set of invariants.

## What do we return now?

The ordinary b-search we wrote returns `mid`; the leftwise b-search returns `l` or `r`, since they always converge to the same value by our invariants.
*Rightwise* search is very similar; `l` and `r` converge here as well, but we have to return the element *immediately before* them to get 
the element we actually care about. So we will either `return l - 1` or `return r - 1`.

## The code

```python
def rightmost_bsearch(L, T):
  l, r = 0, len(L)

  while l < r:
    # Loop invariants. Always true! Comment out in production!
    for somewhat_smol in L[0:l]:
      assert somewhat_smol <= T         # Note: Weak inequality now.
    for lorg in L[r:len(L)]:
      assert lorg > T

    mid = (l + r) // 2

    if L[mid] > T:
      r = mid
    else:
      l = mid + 1

  return r - 1                          # return the first element AFTER L[r:len(L)].
```

Why `r - 1`? I just like sticking with the theme of `r`ightwise. There's no difference.

## Some useful mnemonic properties

The three approaches to binary search we have presented here all have properties people
could quibble about. I like them regardless because a binary search I can reliably write
by reasoning about invariants and inequalities from first principles is far more useful
to me in practice than getting the absolute bleeding edge performance out of an algorithm
before I have reason to think such a thing is warranted.

For example, we haven't broached the topic of switching to sequential search when `len(L)`
is small. This is a common and wise optimization in languages like C, where you can
carefully reason about what actually is in the cache and what the CPU is likely to
retrieve the fastest; however, in a language like Python, it just doesn't pay for the
casual DSA student to worry about things like this.

I have stuck with *strong* equalities where possible, both in our invariants and in our
`while l < r:` loops, because I similarly find those easier to reason about than weak
ones. Maybe Real Analysis really did teach me something after all. 'Til next time.
