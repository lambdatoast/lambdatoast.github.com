---
layout: post
title: Concrete vs Abstract
published: false
---

Don't let talk of "Concrete vs. Abstract" in the industry misguide you 
into missing the point of abstraction.

I have been told many times, in different ways, that "the abstract" has 
less to do with the Real World than "the concrete", which 
is what deals with "the real", and "the practical".

However, after asking a lot about it, thinking a lot about it, etc. I've 
concluded that such as view is not even wrong, it is utter nonsense. And 
I'm writing this article about it, because I think it matters that you know 
that it is utter nonsense, and why, because otherwise it can mislead you 
into confused design of the computer programs that are supposed to solve 
problems.

I also want to recommend an already existing more explicit *and* 
familiar language, for talking about this subject, so that we stop propagating 
bad advice such as "don't abstract too much!". Countless times I've dealt with 
the consequences of innocently adopting such advice.

## On abstraction and the real world

Assume you have a problem `P`. Then, to have an abstraction is to have a 
way to talk about `P`, and **nothing else**. 

Consider the function `successor`:

    successor x = x + 1

You can think of this function as "an expression `x + 1` waiting for a value to 
plugged into `x` in order to compute a result".

The problem that the function solves is "compute the successor of a number". It's not 
"compute the successor of 9", "compute the successor of 42 as long as today isn't 
Friday", or *anything* else.

From here on, I'm going to refer to the "compute the successor of a number" problem as 
SuccessorProblem.

Now, something like `successor_of_41 = 41 + 1` is a perfectly valid function as well. 
And indeed we can declare a relation between `successor` and `successor_of_41`, 
*with respect to SuccessorProblem*. Namely, the latter can be called a *specific instance*, 
or *specialization*, of the former. Indeed, `successor_of_41` can be defined in 
terms of `successor`, i.e. `successor_of_41 = successor 41`. 

The programmer who created `successor` simply found, and presumably solved, the **essence** 
of SuccessorProblem. In no way is their work somehow divorced from the "real world", and 
in no way is `successor_of_41` "more practical" or "more real world" than `successor`.

## Think essential vs. non-essential instead

What does it mean for a programmer to have found the essence of a problem? 
It means that they can then create one solution, and reuse it in all – this is 
key: not some, not many, but *all* – of the specializations of the problem.

What I propose then is that you frame your conversation in terms 
of "essential vs. non-essential", instead of "abstract vs. concrete", at least initially, 
as a way to keep yourself, and your team, on the right track. 

## On concreteness

Where does "concreteness" enter the picture, anyway?

Well, if "abstract" corresponds to "essential", then "concrete" corresponds to "non-essential".

However, a `successor_of_41` function could very well be essential to *somebody*'s problem!

That's where a crucial question in this discussion is revealed. A question that 
most people skip over when they decide to megaphone their advice and views on 
software design ("Don't abstract!!", etc.) Namely: **What is the problem?**

## On identifying the problem

Whatever the problem is, it has an essential part, and a non-essential part. 

If, in your software design brainstorm, you replace "abstract vs. concrete" 
with "essential vs. non-essential", then any further discussion will **necessarily** 
have to take place in the context of a well-defined problem, in order to even 
make sense at all. 

This will force you to spell out the problem, and so the next question will be 
whether such a problem is worth solving, and the answer to that will depend on 
many factors: you, your boss, your economic situation, society, etc.

*That* is where the notions of "real world", "practical", etc. enter the picture.

That is, whether something is "real world" or not, is entirely unrelated 
to it being an *abstraction*. 

When you change your "level of abstraction", what you're moving closer to, 
or away from, is some *problem*, not "the real world". And, again, whether 
a problem is a "real world problem" is a totally separate discussion.

Now, what you'll see is that defining the problem goes in parallel with 
identifying the essence of it, which again, is what designing an abstraction is.

There's actually no generally good or bad "level of abstractness"; which is 
obvious, since *nothing* is either essential or non-essential "in general".

## Abstraction: The process, the tools, and the result

Be prepared for listening to programmers conflating many aspects of the 
whole subject of this discussion.

Consider the following aspects: the problem (e.g. SuccessorProblem), the process of abstraction, 
the tools for abstraction, and the resulting solution.

The problem is not the same as the process. The process is not the same as the tools. The tools are not the same as the result.

And yet, you'll often see programmers calling each of these things "the abstraction", and
then proceeding to tag it vaguely as "bad", "unnecessary", too this, and too that, etc. 

## Common phrases

How does what I've said so far align with the things people in 
the industry often say? 

Let's see.

### "That's too abstract"

This would translate to "That's too essential", to which I can only 
answer "You say it like it's a bad thing!".

Joking aside, chances are people who say this are not referring to the essential and 
the non-essential, so **they are not talking about abstraction at all**.

The solution is to ask them what they're talking about. Or maybe you've 
caught *yourself* thinking that phrase. Ask yourself what you're really 
talking about, then!

### "Abstraction should not be a goal"

This one is odd. 

Assuming they *are* talking about the essence, then the point might be, 
"don't identify the essence of the problem and then forget to solve it", or 
something. But, who does that? 

Also, what if the job *is* just to create a model of the essence of the problem, 
so that others can talk about the problem and/or solve their own problems using
specializations of this model as a means of communication?

Maybe they just mean "don't create models for things that aren't the essence 
of a problem P and thus no one suffering from P will really need". In this case, that's obviously
right, however "abstraction should not be a goal" is a very misleading way to phrase this.

If you find yourself in a situation where what you initially thought was non-essential 
is actually essential (or vice versa), because now you know more about the problem, then you 
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
All of them are the result of the process abstraction.

For example, when you write the primitive `5` in your language, you are using an abstraction. 
You are not dealing with the huge amount of non-essential aspects (physics, electronics, etc.) 
involved in having an electronic digital computer use the Hindu–Arabic number Five.

Additionally, if "Don't abstract early" gets translated to "Don't identify the 
essence of the problem early", then the advice goes from simply incoherent 
to flat out harmful.

But again, let's assume the best intentions from the person giving this advice, and 
consider that they might not be referring to abstraction as a tool. In that case, 
they probably mean "Don't put layers of indirection before you know you will need them", 
which is not only unrelated to abstraction, but can also be reduced to "Don't use things before you know you will need them", 
and eventually to a plain truistic advice such as "think before you act", which is common
knowledge.

Most importantly, note that *abstraction* cannot possibly be "indirection". Abstraction 
is precisely the opposite: It is for you to deal with a problem directly, with **nothing** in
between.

### "Don't abstract"

This one is totally meaningless. So I'll leave it as a fun exercise for 
you. That is, apply the same things I did for the previous ones: Rephrase 
it in terms of "essential vs. non-essential"; If it makes no sense, then
find out, or ponder, what the person *really* meant when they said this.
