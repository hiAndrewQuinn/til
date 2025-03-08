---
title: Binary search isn't about search II. Loop invariant of leftmost element search
date: 2025-03-08
tags: 
- data-structures-and-algorithms
- math
- todays-lucky-10000
- tutorial
- worse-is-better
---

In the first
["Binary search isn't about search"](https://hiandrewquinn.github.io/til-site/posts/binary-search-isn-t-about-search/)
post, we spoke about 
[using `assert` statements to enforce your loop invariants](https://hiandrewquinn.github.io/til-site/posts/binary-search-isn-t-about-search/#hl-2-5).
Our plain old everyday binary search invariant can be summarized as such:

1. For all x in `L[0:l]`[^1], x is *strictly* less than `T`, the element we are searching for.
1. For all y in `L[r:len(L)]`[^2], y is *strictly* greater than `T`, the element we are searching for.

Or, if we want to be even terser, we could note this as simply

```python
L[0:l] < T < L[r:len(L)]    # ordinary binary search loop invariant
```

Suppose our array has duplicates, though; the ordinary binary search will find one of them, but
it makes no claims as to *which* one. Indeed, 
[different binary searches will find different indices](https://github.com/hiAndrewQuinn/python-binary-search-experiments/blob/main/binary-showdown.py),
which you can prove for yourself by running the linked script.

What if we want to get the *first* matching element in the array?

## An example which suggests a new invariant

Let's consider a simple array which looks like the following:

```python
[0, 0, 0, 0, 1, 1, 1, 1, 1, 1]
           # ^ wanted!
```

We don't know yet exactly how to get this first `1`. But we do know we need `mid` to eventually get
in the area. The first invariant, `L[0:l] < T`, seems fine; we could slide `l` right up to the
first `1`, so that `L[0:l]` contains only zeroes. The *second* invariant, `L[r:len(L) < T`, however,
has to be weakened -- there's just no way to make this nonempty which *doesn't* contain `1`s.

Let's see what we can design with the new invariant,


```python
L[0:l] < T <= L[r:len(L)]   # leftwise binary search loop invariant
```

That suggests an implementation that looks like

```python
def leftmost_bsearch(L, T):
  l, r = 0, len(L)

  while l < r:
    for smol in L[0:l]:
      assert smol < T
    for somewhat_lorg in L[r:len(L)]:
      assert somewhat_lorg >= T         # note: weak inequality now.

    mid = (l + r) // 2

    if L[mid] < T:
      l = mid + 1
    else:
      r = mid

  return l                              # return the first element AFTER L[0:l].
```

And, indeed, 
[this works](https://github.com/hiAndrewQuinn/python-binary-search-experiments/blob/main/duplicates.py#L72-L102)!
Running the Python script at the link will show you a fancy command-line visualization of
this very thing in practice.

Our example will end looking like so:

```python
# At the end of the loop:
# L[0:l]
#|=========|
[0, 0, 0, 0, 1, 1, 1, 1, 1, 1]
            #|===============|
            # L[r:len(L)], end
```


## Why not `return mid`?

The last thing we should mention is that, in our "ordinary" invariant-based binary search,
we either `return mid` or we return `-1` (for "Not Found"). Here, we elect to return `l`.
But why? How can we remember this?

Take a look again at the invariant

```python
L[0:l] < T <= L[r:len(L)]   # leftwise binary search loop invariant
```

Unlike 

```python
L[0:l] < T < L[r:len(L)]    # ordinary binary search loop invariant
```

the new weak inequality means we actually *can* find values of `l` and `r` such that
`L == L[0:l] + L[r:len(L)]` in every case. In other words, `L[l:r]` can and should always
be allowed to dwindle to nothing. This is also a characteristic the rightmost element
search has!

## What happens when we leftmost search for an element that isn't there?

Our ordinary binary search gives us `-1` when `T not in L`. Our leftwise element
search, however, does something much more interesting: It gives us the index
where that element *would* be inserted if it *was* there.

You can visualize this if you return to our early example. Suppose we had some
larger number than 1, but we tried searching for `1`. Our invariants would
still give us *exactly the same indices* at the end:

```python
# Search for T == 1
# L[0:l]
#|=========|
[0, 0, 0, 0, 99999, 99999, 99999, 99999, 99999, 99999]
             #|======================================|
             # L[r:len(L)], end

[0, 0, 0, 0, 99999, 99999, 99999, 99999, 99999, 99999]
           # ^ where 1 would be inserted, if we kept it sorted.
```

You could of course get your "normal" `if T not in L return -1` property back
without affecting the time complexity by changing that end statement to
something like

```python
def leftmost_bsearch_with_failure(L, T):
  l, r = 0, len(L)

  while l < r:
    for smol in L[0:l]:
      assert smol < T
    for somewhat_lorg in L[r:len(L)]:
      assert somewhat_lorg >= T

    mid = (l + r) // 2

    if L[mid] < T:
      l = mid + 1
    else:
      r = mid

    if l < len(L) and L[l] == T:        # new
      return l                          # new
    else:                               # new
      return -1                         # new
```

Next up: Rightwise element search. If this all made sense to you there should
be little to surprise you there.


[^1]: This is Python range notation. `L[0:l]` is empty when `l == 0`. In general it's equal to `[ L[0], L[1], L[2], ..., L[l-2], L[l-1] ]`, but *never* including `L[l]` itself.
[^2]: Idiomatic Python would write these as simply `L[:l]` and `L[r:]`, but we're trying to make a point here.
