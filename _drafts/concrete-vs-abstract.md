---
layout: post
title: Concrete vs Abstract
published: false
---

The talk of "Concrete vs. Abstract", as commonly practiced in "the industry", 
can be very unhelpful and misguiding, causing programmers to design programs badly.

## On abstraction and the real world

I have been told many times, in different ways, that the "abstract" has 
less to do with the "real world", than the "concrete", which in turn deals 
with more "real", "practical", stuff.

But what is an abstraction? 

If you have a problem, then to have an abstraction means to have a way to talk 
about **the** problem, and **nothing** else. 

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
Well, it means they can then create a single solution to deal with the essence problem, and 
reuse it in all (this is key: not some, not many, but *all*) of its possible specializations.

My recommendation is then that, as a computer programmer, instead of playing the 
"Abstract vs. Concrete" game, and engaging in pointless debate (or, way worse, confused 
decision making during software design), you should think of it in terms of "essential vs. non-essential", 
always with respect to a well-defined problem P.

Where does "concrete" enter the picture, then? If we're replacing terms here, and "abstract" 
corresponds to "essential", then "concrete" corresponds to "non-essential".

However, a `lengthOfListOfBananas` is clearly very essential to someone working with bananas!

That's where the core question of this discussion is revealed. A question that 
people skip over when they decide to talk about almost all things software, namely: 
**What is the problem?**

Now, whatever the problem is, it has an essential part, and a non-essential part. 

"Compute the length of a list" is the essence of "Compute the length of a list of bananas".
"Compute the length of a list of bananas" might be the essence of something else. Which 
brings up the questions: is P the essence of Q (a.k.a. is Q a specialization of P)? Or 
is P a sub-problem in a collection of problems that you refer to as Q?

If you rephrase "abstract vs. concrete" into "essential vs. non-essential", 
then any further discussion will **necessarily** have to take place in the context 
of a well-defined problem, in order to make sense at all.

The problem you define will become *The Problem*, and it will be as "real 
world" as any problem can be. Then the question is whether the problem 
is a problem worth solving, but that question is for you to decide, or, 
in a less autonomous situation, for your boss, friends, society, etc. to 
decide with, or for, you. 

Back to software design. There is no fixed "level of abstractness" of anything; 
which is another way of saying that nothing is simply essential or non-essential, "in general".

There are only problems, sub-problems, different problems, etc. each of them with 
an essence waiting to be discovered.

Where does all of this leave you with regards to phrases such as "that's too abstract"?

## "That is too abstract"

This would translate to "that's too essential". But what the hell do they think 
they're advicing you to actually do, if they actually meant this? I don't know. 

Chances are they are **not** talking about the essential and the non-essential, 
and therefore **they are not talking about abstraction at all**.

## "Abstraction should not be a goal"

This one is very strange. Abstraction is not the goal for whom? and when?
Clearly, if you have a problem P, and you need to solve it, then identifying the 
essence of it *has* to be your immediate goal, otherwise you can't know what 
to solve. And considering the fact that we *rarely* attain all the knowledge 
about what the essence of a problem is, then it seems that we'll always be 
looking for the essence of the problem. So creating an abstraction of the problem, 
**is** our long term goal.

Now, if you later realize that some of what you thought was non-essential 
noise is actually essential, then great, now you know more about the problem, and 
should update your abstraction accordingly. If this evolution becomes a nightmare, 
it will be for reasons entirely unrelated to the utility of abstracting. 
Maybe your programming language sucks and its type system is inexpressive. You exposed 
too many things. Maybe you were so mistaken about what the problem was that the 
previously considered non-essential parts were actually the very essence of the problem.
Etc, etc.

Don't blame the idea of abstraction for things caused by a poor language/type system/etc.
It's like blaming the idea of software version numbers for things caused by poor 
software dependency managers.

## "Don't abstract early"

This one is related to the previous one, but it's especially incoherent, given 
that **nothing** you use as a programmer *isn't* an abstraction. Literally not one thing. 

For example, when you write the primitive `5` in your language, you are immediately in the realm 
of abstraction. You are not caring about a huge amount of non-essential aspects 
(operational concerns such as hardware electronics, etc) of using "the number five". 
`5` being the essential part of "working with the arabic number `5` on a von neumann machine".

Moreover, when "Don't abstract early" gets translated to "don't identify the 
essence of the problem early", then it goes from simply not making sense to flat out 
harmful. 

But let's assume the best intentions, and say that, once again, they must 
be referring to something that has nothing to do with the utility of abstraction. 
Then they probably mean "Don't put layers of indirection before you know you will need them", 
which can be reduced to "Don't use things before you know you will need them", and eventually 
reduced to some truistic thing such as "think before doing".

Note that *abstraction* cannot possibly be "indirection". Abstraction is precisely 
the opposite: It is what deals with a problem more directly, with **nothing** in 
between, and **nothing** around it.

## Design Patterns (as in the GoF book, etc)

Patterns must be found in the *problem*, not in the 
*design*. Remember: Essential or non-essential. Abstract, or specialized.
In the context of a problem.

Finding the essence is finding the abstraction. Creating a solution for 
the essence is creating a solution for *all* the specializations of the 
problem.

Design patterns, as in the GoF book, just don't enter the picture 
at all, in this problem-defining and problem-solving process. 

When you're getting started on working on the process, the book is flat out 
not appropriate – you should be focused on studying *your* problem instead.

When you're done finding the essence of your problem, the book 
isn't necessary: you have found the abstraction. 

Finally, when you want to know if your abstraction is something already 
known, then the book is once again not appropriate, given that the 
recipes in it aren't mathematically principled. 

You're better off asking a mathematician if there's a known mathematical 
object/operation/etc that describes **exactly** what you're doing. Then 
you can implement thorough scientific tests to ensure that your 
implementation is sound.
