---
layout: post
title: Concrete vs Abstract
published: false
---

Don't let talk of "Concrete vs. Abstract" in the industry misguide you 
into missing the point of abstractions in the design of computer programs.

## On abstraction and the real world

I have been told many times, in different ways, that the "abstract" has 
less to do with the "real world", than the "concrete", which in turn deals 
with more "real", "practical", stuff.

But what is an abstraction? 

Assume you have a problem. Then, to have an abstraction means to have a 
way to talk about **the problem**, and **nothing else**. 

This is why, when using lists, you'll see something like `length: List[A] => Int` 
(where `A` is a type parameter).

The problem that the function solves is "compute the length of a list". It's not 
"compute the length of a list of bananas", or "compute the length of a list of dinosaurs as 
long as today isn't Friday", or anything else.

If it helps, you can make up some story, about how when the first humans 
that sat down to implement the computation, realized that the nature of 
the list's elements was irrelevant to the process of computing the length of the list.

However, clearly something like `lengthOfListOfBananas: List[Banana] => Int` is be a perfectly 
valid function. And we can declare a relation between `length` and `lengthOfListOfBananas`. 
Namely, that the latter can be called a *specific instance*, or *specialization*, of the former. 

But in no way is `length` somehow "farther away from the real world". The "abstract" problem:
"compute the length of a list" is a very real problem! (it might not be *your* problem at some 
point in time, though)

The abstract `length` function is just the solution to what is common, or, the 
**essence**, of the "compute the length of a list" problem.

What does it mean for a programmer to have found the **essence** of a problem? 
It means that they can then create a single solution to deal with the essential, and 
reuse it in all – this is key: not some, not many, but *all* – of the specializations.

My recommendation is then that, as a computer programmer, instead of playing the 
"Abstract vs. Concrete" game, and engaging in pointless debate (or, way worse, confused 
decision-making during software design), you should think of it in terms of 
"essential vs. non-essential", always with respect to a well-defined problem P.

## On concreteness and problem definition

Where does "concrete" enter the picture, then? 

If "abstract" corresponds to "essential", then "concrete" corresponds to "non-essential".

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
of a well-defined problem, in order to even make sense at all. 

Once the problem is spelled out, the next question is whether it is a 
problem worth solving, and the answer to that is up to you, or, in a 
less autonomous situation, up to your boss, economic situation, society, etc.

Back to the science of software design. There is no fixed "level of abstractness" 
of anything; which is another way of saying: nothing is simply essential or 
non-essential, "in general".

There are only problems, sub-problems, different problems, etc. each of them with 
an essence waiting to be discovered.

## The process of abstracting, the tools, and the results of the process

Even when what a programmer in "the industry" is telling you isn't incoherent, 
or confused, you should still be prepared to ask what they're talking 
about *within* the subject of abstractions. 

The things involved are: the problem, the process of abstraction, the tools 
for abstraction, the resulting solution.

The problem is not the same as the process. The process is not the same as the tools. The tools are not the same as the result.

Back to the abstract `length`. This function is the *resulting solution* to 
the essence of a problem. It is not the problem. It is not the tool 
you used for abstracting (finding the essence of) the problem. It 
is, rather specifically, the solution, stored as something you and others can use.

Nevertheless, be prepared to listen to programmers refer to the essence, 
the tools for finding the essence, and the resulting solution, all, as 
"the abstraction". And then proceed to tag them vaguely as "bad", "unnecessary", 
etc.

## On common phrases

On that note: how does what I've said so far play with some of the phrases people
in the industry often throw around? 

Let's see.

### "That's too abstract"

This would translate to "That's too essential", which is ridiculous. 
Chances are they are not talking about the process of identifying the essential 
and the non-essential, and therefore **they are not talking about abstraction at all**.

### "Abstraction should not be a goal"

This one is strange. 
Clearly, if you have a problem `P`, and you need to solve it, then identifying the 
essence of it *has* to be your immediate goal, otherwise you can't know what 
to solve. And considering the fact that we *rarely* attain all the knowledge 
about the essence of a problem, then it seems that the process of abstraction 
is certainly a perpetual goal.

Maybe they mean it in the sense that, if the goal is to swim in the ocean, 
and you're in the desert, then traveling to the ocean is not the goal?

In any case, if you find yourself in a situation where what you initially thought was non-essential 
noise is actually essential, then great, now you know more about the problem, and 
should update your solution accordingly. If this revision turns out to be a nightmare to make, 
it will be for reasons entirely unrelated to the idea of abstraction.
Maybe your programming language sucks and its type system makes modifications a
dangerous and/or tedious endeavor, in which case the problem is *the tool used for abstraction*, 
which is not the same as *abstraction as a tool*.

Blaming *abstraction as a tool* for nightmares caused by a clumsy language/type system/etc. is 
like blaming the *software version numbering as a tool* for nightmares 
caused by clumsy software dependency managers.

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

