---
layout: post
title: Concrete vs Abstract
published: false
---

"Concrete vs. Abstract" discussions are bullshit that confuses, and hurts, newcomers, 
totally unnecessarily.

To be clear, I'm not saying that the individual terms "abstract" and "concrete" are 
bullshit (though the latter might be), but rather that the notion of 
"Concrete vs. Abstract", as commonly used and propagated like a virus, 
in "the industry", is very unhelpful. It leads programmers down several paths 
of wrongness, in thinking, and therefore in practice.

I have been told many times that when something is abstract, it has less to do with 
the "real world". whereas when something id concrete, it deals with "real", "practical", 
stuff.

But what is an abstraction? 

To have an abstraction means to have a way to talk about **the** problem, and **nothing** else. 

This is why, when using lists, you'll see something like `length: List[A] => Int` 
(where `A` is a type parameter).

The problem that the function solves is "compute the length of a list". It's not 
"compute the length of a list of bananas", "compute the length of a list of dinosaurs", etc.

At this point you could make up some story, if it helps you, about how when the first humans 
that sat down to implement the computation, realized that the nature of the list's elements 
was irrelevant to the process of "computing the length of a list".

However, clearly something like `lengthOfListOfBananas: List[Banana] => Int` would be a perfectly 
valid function. And we can make a difference between `length` and `lengthOfListOfBananas`. The 
latter can be called a "specific instance", or "specialization" of the former. 

But in no way is `length` somehow "farther away from the real world". The "abstract" problem:
"compute the length of a list" problem is a very real problem! (it might not be *your* problem
at some point in time, or ever, though)

Abstract `length` is just what is common, or, the **essence**, of the "compute the length 
of a list of banana" problem. That is its relation to `lengthOfListOfBananas`.

And what does it mean for a programmer, when they have found the **essence** of a problem? 
Well, it means they can then create a single solution to deal with the problem, in many 
of its possible specializations.

My recommendation is then that, as a computer programmer, instead of playing the 
"Abstract vs. Concrete" game, and engaging in pointless debate (or, way worse, confused 
decision making during software design), you should think of it in terms of "essential vs. non-essential", 
always with respect to a well-defined problem P.

Where does "concrete" enter the picture, then? If we're replacing terms here, and "abstract" 
becomes the "essential", then "concrete" would become the "non-essential".

However, a `lengthOfListOfBananas` is very damn essential to someone working with bananas!
And that's where the core problem with this discussion is revealed. It is a question that 
people ignore when they talk about almost all things software, which is: **What is the problem?**

Whatever the problem is, it has an essential part, and a non-essential part. 

Any "abstract vs. concrete" discussion, must be re-phrased into the "essential vs. non-essential", 
**and** take place in the context of a well-defined problem.

The problem you define, will then become **the** problem, and it will be as real 
world as anything can be, regardless of what your boss, your parents, society, your 
favorite "software architecture" book, etc. might say. 

There is no fixed "level of abstractness" of anything; which is another way of saying that 
nothing is simply essential or non-essential "in general", from *all* perspectives.

So, where does that leave us with phrases such as "that's too abstract". Well, that is 
then translates to "that's too essential". And what the hell would people mean, if 
they actually mean this? I don't know. Chances are they are **not** talking about 
essential and non-essential, and therefore **they are not talking about abstraction at all**.
You will have to ask them more about what the problem is.
