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

And what does it mean for a programmer to have found the **essence** of a problem? 
Well, it means that they can then create a single solution to deal with the essential, and 
reuse it in all – this is key: not some, not many, but *all* – of the specializations.

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

Even when the ideas the programmer is telling you isn't incoherent, or 
confused, you should still be prepared to ask what they're talking 
about *within* the world of abstractions. The process is not the 
as the tools. The tools are not the same as the result.

Back to `length[A]`. This function is the *result* of having found 
the essence of a problem. It is not the problem. It is not the tool 
you used for abstracting (finding the essence of) the problem. It 
is, rather specifically, your recording, of the solution you came 
up with.

Nevertheless, be prepared to listen to programmers refer to the essence, 
the tools for finding the essence, and the resulting 
solution, as "the abstraction".

## On common phrases

So how does what I've said so far play with phrases people often throw around?

### "That's too abstract"

This would translate to "That's too essential", which is ridiculous. 
So chances are they are not talking about the essential and the 
non-essential, and therefore **they are not talking about abstraction at all**.

### "Abstraction should not be a goal"

This one is strange. Abstraction is not the goal for whom? and when?
Clearly, if you have a problem P, and you need to solve it, then identifying the 
essence of it *has* to be your immediate goal, otherwise you can't know what 
to solve. And considering the fact that we *rarely* attain all the knowledge 
about the essence of a problem, then it seems that we'll be perpetually looking 
for it. Therefore the process of abstraction is certainly a perpetual goal.

Maybe they mean it in the sense that, if the goal is to swim in the ocean, 
and you're in the desert, then traveling to the ocean is not the goal?

In any case, if you find in a situation where what you initially thought was non-essential 
noise is actually essential, then great, now you know more about the problem, and 
should update your abstraction accordingly. If this evolution becomes a nightmare, 
it will be for reasons entirely unrelated to "the utility of abstraction as a tool". 
Maybe your programming language sucks and its type system makes modifications a
dangerous and/or tedious endeavor, in which case the problem is *the tool used for abstraction*, 
which is not the same as *abstraction as a tool*.

Blaming "abstraction" (as a tool) for nightmares caused by a poor language/type system/etc. is 
like blaming the idea of software version numbering (as a tool) for nightmares 
caused by poor software dependency managers.

### "Don't abstract early"

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
reduced to some truistic advice such as "think before you act".

Also, note that *abstraction* cannot possibly be "indirection". Abstraction is precisely 
the opposite: It is what deals with a problem more directly, with **nothing** in 
between, and **nothing** around it.

