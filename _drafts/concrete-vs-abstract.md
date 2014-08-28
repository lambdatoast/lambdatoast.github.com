---
layout: post
title: Concrete vs Abstract
published: false
---

Don't let talk of "Concrete vs. Abstract" in the industry misguide you 
into missing the point of abstractions in the design of computer programs.

## On abstraction and the real world

I have been told many times, in different ways, that the abstract has 
less to do with the "real world" than the "concrete", which deals 
with more "real", "practical", stuff.

But what is an abstraction? 

Assume you have a problem. Then, to have an abstraction means to have a 
way to talk about **the problem**, and **nothing else**. 

This is why, when using lists, you'll see something like `length: List[A] => Int` 
(where `A` is a type parameter).

The problem that the function solves is "compute the length of a list". It's not 
"compute the length of a list of bananas", or "compute the length of a list of dinosaurs as 
long as today isn't Friday", or anything else.

If it helps form the example, you can make up some story, about how when the first humans 
that sat down to implement the computation, realized that the nature of 
the list's elements was irrelevant to the process of computing the length of the list.

However, clearly something like `lengthOfListOfBananas: List[Banana] => Int` is a perfectly 
valid function. And we can declare a relation between `length` and `lengthOfListOfBananas`. 
Namely, that the latter can be called a *specific instance*, or *specialization*, of the former. 

The programmer who created `length` simply found, and presumably solved, the **essence** of the problem. 
In no way is their work somehow divorced from the "real world".

## Think essential vs. non-essential instead

So what does it mean for a programmer to have found the essence of a problem? 
It means that they can then create one solution, and reuse it in all – this is 
key: not some, not many, but *all* – of the specializations of the problem.

What you could try to do is frame it in terms of "essential vs. non-essential", 
instead of "abstract vs. concrete", at least initially, as a way to keep yourself, 
and your team, on the right track. 

## On concreteness

Where does "concreteness" enter the picture?

Well, if "abstract" corresponds to "essential", then "concrete" corresponds to "non-essential".

However, a `lengthOfListOfBananas` function could very well be essential to *somebody's* problem!

That's where a crucial question in this discussion is revealed. A question that 
most people skip over when they decide to megaphone their advice and views on 
software design. Namely: **What is the problem?**

## On identifying the problem

Whatever the problem is, it has an essential part, and a non-essential part. 

If, in your software design brainstorm, you replace "abstract vs. concrete" 
with "essential vs. non-essential", then any further discussion will **necessarily** 
have to take place in the context of a well-defined problem, in order to even 
make sense at all. 

This will force you to spell out the problem, and the next question will be 
whether it is a problem worth solving, and the answer to that will depend on 
many factors: you, your boss, your economic situation, society, etc.

What you'll see is that defining the problem goes in parallel with 
identifying the essence of it, which again, is what designing an 
abstraction is.

There's actually no fixed "level of abstractness"; that is, nothing 
is either essential or non-essential "in general".

## Abstraction: The process, the tools, and the result

Be prepared for listening to programmers conflating many aspects of the 
whole subject of this discussion.

Consider the following aspects: the problem, the process of abstraction, 
the tools for abstraction, the resulting solution.

The problem is not the same as the process. The process is not the same as the tools. The tools are not the same as the result.

And yet, you'll hear programmers calling each of these things "the abstraction", and
then probably proceeding to tag it vaguely as "bad", "unnecessary", etc. which 
brings me to the next section:

## Common phrases

How does what I've said so far align with the things people in 
the industry often say? 

Let's see.

### "That's too abstract"

This would translate to "That's too essential", which is just ridiculous. 
Chances are people who say this, are not talking about the essential and 
the non-essential, and therefore **they are not talking about abstraction at all**.

### "Abstraction should not be a goal"

This one is strange. 

If you have a problem `P`, and you need to solve it, then identifying the 
essence of it *has* to be your immediate goal, otherwise how do you know what 
you're trying to solve?

If you find yourself in a situation where what you initially thought was non-essential 
is actually essential, because now you know more about the problem, then you 
should update your design accordingly. If this revision turns out to 
be a nightmare to complete, it will be for reasons entirely unrelated to the 
idea of "using abstraction".

Maybe your programming language sucks and it makes modifications a dangerous 
and/or tedious activity, in which case the problem is the *tool used for abstraction*, 
which is not the same as the problem being *abstraction as a tool*.

So, mail your complaints to the right mailbox. The Intergalactic Ministry of Abstraction 
doesn't like to waste time reading letters that should have been sent to 
the Stagnation Enforcement Committee for your programming language of choice.

### "Don't abstract early"

This one is related to the previous one, but it's especially incoherent, given 
that **nothing** you use as a programmer *isn't* abstracted. Literally not one thing. 
From the monoid coproduct, to the list, to the memory pointer, to the assembly syscall. 
All of them are the result of abstraction.

For example, when you write the primitive `5` in your language, you are using an abstraction. 
You are not caring about the huge amount of non-essential aspects (physics, electronics, etc) 
involved in having an electronic digital computer use the Hindu–Arabic "number five".

Additionally, if "Don't abstract early" gets translated to "Don't identify the 
essence of the problem early", then the advice goes from simply incoherent 
to flat out harmful.

But again, let's assume the best intentions of the person saying these things, and once 
consider that they might not be referring to abstraction as a tool. In that case, 
they probably mean "Don't put layers of indirection before you know you will need them", 
which can be reduced to "Don't use things before you know you will need them", and eventually 
reduced to some truistic advice such as "think before you act", which you already knew.

But note that *abstraction* cannot possibly be "indirection". Abstraction is precisely 
the opposite: It is for you to deal with a problem directly, with **nothing** in
between.

### "Don't abstract"

This one is totally meaningless. So I'll leave it as a fun exercise for 
you. That is, apply the same things I did for the previous ones: Rephrase 
it in terms of "essential vs. non-essential"; If it makes no sense, then
find out, or ponder, what the person *really* meant when they said this.
