---
title: The Rule of Four
date: 2023-11-24
tags: 
- communication
- productivity
- heuristics
---


A communication heuristic, optimized for **asynchronous communication of detailed concepts between human beings.**

Not really a TIL, I've been sitting on this one for a while.

## Rationale

### Existence “proof”

-   Our short term memory can hold [at best](https://www.quantamagazine.org/overtaxed-working-memory-knocks-the-brain-out-of-sync-20180606/) about 7 +/- 2 chunks of information at a time.
-   Start with the lower end of that: 5 chunks.
-   Assume that whatever someone is “really” trying to do takes up 1 of those 5.
-   We’re left with 4 chunks.

### Conclusion

Organize your work processes as much as possible so that they can be effectively understood using **at most 4 chunks of short-term memory**. If you feel a process is too complicated to be held like that, find conceptual fault lines to hack against until it’s true.

### Extension

If you have to use more than 4 chunks of *your own* short-term memory to do something, you haven’t internalized it deeply enough to call yourself “fluent” with it yet. Call the point where you are first able to do this the birth of understanding.

Some nuances:

-   Not everything has to be understood to fluency. The birth of understanding arises out of practice carrying the burden of knowledge. Often times you can simply relinquish the load, and focus your efforts elsewhere.
-   The birth of understanding is only the *initial* stage of understanding. The flipside to my point above: You can absolutely reduce something all the way down to unconscious muscle memory if you *really* want to. It’s just very expensive to do so.

## Concrete examples

### General office work

-   When planning a project, break it down into at most **4 main milestones** that must be achieved in order to successfully complete the project.
-   Limit a meeting’s agenda to at most **4 main points**, so that the attendees can follow the discussion even if they’re a little bit distracted.
-   When delegating a task, or documenting a process, break it down into at most **4 smaller sub-tasks**.
    -   Nesting is *extremely* helpful here - don’t be afraid to give each of those 4 sub-tasks 4 sub-sub-tasks each, etc. The number of “ground level” tasks grows geometrically as you nest further, so you’ll find you almost never have to actually go beyond 3 layers or so.

### Software development

-   When designing a software application, try to stick to at most **4 main modules** or components that encapsulate the core functionality of the application.
    -   External libraries can of course be called in, but their use must be “obvious”. Reserve specialized technical knowledge for those 4 main modules; if you can’t build what you want to with that limitation, start by building a library that hooks 2 or 3 of them into one another so you can reduce the 4 to 3/2/1.
-   In a single function or method:
    -   Limit the [cyclomatic complexity](https://en.wikipedia.org/wiki/Cyclomatic_complexity) of the function to 4. That is to say, keep the function to at most 4 linearly independent paths; if it goes over, refactor into 2 different functions.
        -   This can be difficult to calculate, however, so here are some upper-bound heuristics that correspond well to “lower cognitive complexity”, even if they don’t strictly guarantee one of 4 or below:
            -   Limit the nesting of loops and if statements to 4, this will help to avoid deep nesting, which can make the code harder to understand and maintain.
            -   Limit the number of conditional statements or branches in each section to 4 or fewer.
            -   Limit the indentation to 4 tabs or fewer.
    -   If your function requires multiple independent sections, each doing different higher-order things, constrain it to to at most 4 sections, even if the cyclomatic complexity of each section is 1 (maybe because you refactored it well!).
    -   Use at most **4 main parameters or arguments**.
        -   Consider using list or container types if you think you have to go beyond 4.
            -   Try *not* to use too much in the way of variable-argument amounts if possible. They might look cleaner, but they’re ultimately harder to work with than a good old fashioned list of flags.
    -   Use at most **4 main variables** in the function body.
        -   Main variables should be descriptively named.
        -   Throwaway variables like explicit counters should be as short as possible, ideally a single character. This will keep the focus on the 4 or fewer descriptive variables.
            -   Of course, if you have 4 or more *throwaway* variables, you’re probably doing too much to be readable at a glance.
        -   Parameters almost always count as “main variables”!

## Places where the Rule of Four does *not* make much sense

### Non-technical communication

Most conversations in real life aren’t about maximizing the other participant’s ability to grok what you’re talking about at a high level.

### Synchronous communication

If you are physically present to respond to the other person in the moment, you can quickly clarify things on the spot. There is less need to pause and think about how to best structure what you’re saying in such an environment, although it might make you look like a smarter person.

### Informal conversation

In casual conversations with friends, family or colleagues, the focus is usually on maintaining a comfortable and natural flow of conversation, rather than simplifying and focusing the information to make it more manageable.

-   You might think that nontechnical == informal, but no! I’ve had many technical informal conversations in my life, and many formal but thoroughly nontechnical ones.

### Certain kinds of research (very rare)

Some scientific research requires a level of detail that may be *literally impossible* to simplify things down to 4 chunks of information. The outer reaches of game theory and computational complexity theory were apparently like like some time ago; differential equations is also notorious for being a sprawling kudzu of mostly special-case techniques.

It’s a good idea to flag this kind of stuff before the reader wades in, so that they know that at least some of this essential complexity will *have* to go to long term memory before things really ‘click’..

