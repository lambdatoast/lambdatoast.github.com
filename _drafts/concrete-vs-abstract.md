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

The programmer who created `length` simply found, and solved, the **essence** of the problem. 
And in no way is their work somehow "farther away from the real world".

## Think essential vs. non-essential instead

So what does it mean for a programmer to have found the essence of a problem? 
It means that they can then create one solution, and reuse it in all – this is 
key: not some, not many, but *all* – of the specializations of the problem.

My recommendation is then that, as a computer programmer, instead of playing the 
"Abstract vs. Concrete" game, and engaging in pointless debate (or worse: confused 
decision-making in software design), you think of it in terms of 
"essential vs. non-essential".

## On concreteness and problem definition

Where does "concreteness" enter the picture?

Well, if "abstract" corresponds to "essential", then "concrete" corresponds to "non-essential".

However, a `lengthOfListOfBananas` could certainly be essential to someone's problem!

That's where a core question in this discussion is revealed. A question that 
people skip over when they decide to share their advice and views on all things software, namely: 
**What is the problem?**

Whatever the problem is, it has an essential part, and a non-essential part. 

If, in your software design discussion, you rephrase "abstract vs. concrete" 
into "essential vs. non-essential", then any further discussion will **necessarily** 
have to take place in the context of a well-defined problem, in order to even 
make sense at all. 

This will force you to spell out the problem, and the next question will be 
whether it is a problem worth solving, and the answer to that will depend on 
many things: you, your boss, your economic situation, society, etc.

That's getting into the social aspect of it all. 

Back to software design: The point is that there is no fixed 
"level of abstractness" of anything I know; which is another way of 
saying: nothing that I know is either essential or non-essential "in general".

There are only problems, of many kinds, some of them related, and each of 
them with an essence.

## Abstraction: The process, the tools, and the result

You also be prepared for having a programmer conflating many 
aspects of the whole notion of abstraction.

Consider the following participants in this game: the problem, 
the process of abstraction, the tools for abstraction, the resulting solution.

The problem is not the same as the process. The process is not the same as the tools. The tools are not the same as the result.

And yet, you'll see programmers calling any of these things "the abstraction", and
then proceeding to tag it vaguely as "bad", "unnecessary", etc.

## On common phrases

On that note: how does what I've said so far play with some of the phrases people
in the industry often throw around? 

Let's see.

### "That's too abstract"

This would translate to "That's too essential", which is ridiculous. 
Chances are people who say this, are not talking about the essential 
and the non-essential, and therefore **they are not talking about abstraction at all**.

### "Abstraction should not be a goal"

This one is strange. 
Clearly, if you have a problem `P`, and you need to solve it, then identifying the 
essence of it *has* to be your immediate goal, otherwise how do you know what 
you're trying to solve?

If you find yourself in a situation where what you initially thought was non-essential 
noise is actually essential, because you now know more about the problem, you 
should update your solution accordingly. If this revision turns out to be a nightmare to make, 
it will be for reasons entirely unrelated to the idea of abstracting things.

Maybe your programming language sucks and it makes modifications a dangerous 
and/or tedious activity, in which case the problem is *the tool used for abstraction*, 
which is not the same as the problem being *abstraction as a tool*.

Mail your complaints to the right mailbox. The Intergalactic Ministry of Abstraction 
doesn't like to waste time reading letters that should have been sent to 
the Stagnation Enforcement Comittee of whatever your favorite programming language is.

### "Don't abstract early"

This one is related to the previous one, but it's especially incoherent, given 
that **nothing** you use as a programmer *isn't* abstracted. Literally not one thing. 

For example, when you write the primitive `5` in your language, you are using an abstraction. 
You are not caring about the huge amount of non-essential aspects 
(operational concerns such as hardware electronics, etc) involved in using "the number five". 
Having the primitive `5` as a tool of expression is the solution to the essence of 
the problem that is "working with the arabic number `5` on a von neumann machine".

Additionally, when "Don't abstract early" gets translated to "Don't identify the 
essence of the problem early", then the so-called advice goes from simply incoherent 
to flat out harmful. 

But let's assume the best intentions of the person saying these things, and once 
again consider that they might be referring to something that has nothing to do with 
the utility of abstraction. 

Then they probably mean "Don't put layers of indirection before you know you will need them", 
which can be reduced to "Don't use things before you know you will need them", and eventually 
reduced to some truistic advice such as "think before you act".

Also, note that *abstraction* cannot possibly be "indirection". Abstraction is precisely 
the opposite: It is for you to deal with a problem directly, with **nothing** in
between. With the least possible amount of assumptions.

### "Don't abstract"

This one is absolutely meaningless. I'll leave it as an exercise for 
you. That is, apply the same things I did for the previous ones: Rephrase 
it; If it makes not sense, find out what the person *really* meant; Etc.
