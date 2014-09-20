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
concluded that such a view is not even wrong, it is utter nonsense. And 
I'm writing this article about it, because I think it matters that you know 
this, otherwise it can mislead you into confused design of your computer 
programs.

I also want to recommend an already existing, more explicit, *and* 
familiar, language for talking about this subject, so that we stop propagating 
bad advice such as "don't abstract too much!".

Countless times I've dealt with the consequences of innocently adopting such 
advice, as a maintainer of codebases.

## On abstraction and the real world

Assume you have a problem `P`. Then, to have an abstraction is to have a 
way to talk about `P`, and **nothing else**. 

Consider the function `successor`:

    successor x = x + 1

You can think of this function as "an expression `x + 1` waiting for a value to 
plugged into `x` in order to compute the result".

The problem that the function solves is "compute the successor of a number". It's not 
"compute the successor of 9", "compute the successor of 42 as long as today isn't 
Friday", or *anything* else.

From here on, I'm going to refer to the "compute the successor of a number" problem as 
SuccessorProblem.

Now, something like `successor_of_forty_one = 41 + 1` is a perfectly valid function as well. 
And indeed we can declare a relation between `successor` and `successor_of_forty_one`, 
*with respect to SuccessorProblem*. Namely, the latter can be called a *specific instance*, 
or *specialization*, of the former. Indeed, `successor_of_forty_one` can be defined in 
terms of `successor`, i.e. `successor_of_forty_one = successor 41`. 

The programmer who created `successor` simply found, and presumably solved, the **essence** 
of SuccessorProblem. In no way is their work somehow divorced from the "real world". In no 
way is `successor_of_forty_one` "more practical" or "closer to the real world" than `successor`.

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

However, a `successor_of_forty_one` function could very well be essential to *somebody*'s problem!

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

*That* is where the notions of "real world", "practical", etc. enter the picture. That 
is, whether something is "real world" or not, is entirely unrelated to it being an 
*abstraction*. "Real world" is a property of the problem, not of your abstractions, 
and whether a problem is a "real world problem" is a discussion totally orthogonal 
to the process of abstraction.

When you change your "level of abstraction", what you're moving closer to, 
or away from, is some *problem*, not "the real world".

Now, what you'll see is that defining the problem goes in parallel with 
identifying the essence of it, which again, is what designing an abstraction is.

*Nothing* is either essential or non-essential "in general". It makes 
no sense to talk about them without defining what the problem is.

## Abstraction: The process, the tools, and the result

Be prepared for listening to programmers conflating many aspects of the 
whole subject of this discussion.

Consider the following aspects: the problem (e.g. SuccessorProblem), the 
process of abstraction (e.g. thinking about the essence of SuccessorProblem), 
the tools for abstraction (e.g. functions, procedures, etc.), and the resulting 
solution (e.g. writing a `successor` function).

The problem is not the same as the process. The process is not the same as the tools. The tools are not the same as the result.

And yet you'll often hear programmers calling each of these things "the abstraction", and
then proceeding to vaguely tag it as good/bad, necessarily/unnecessary, too much this, 
lacking that, etc. 

## Common phrases

How does what I've said so far interact with the things people in 
the industry often say? 

Let's see.

### "That's too abstract"

This would translate to "That's too essential", to which I can only 
answer "You say it like it's a bad thing!"

Joking aside, chances are people who say this are not referring to the 
essential and the non-essential, so **they are not talking about abstraction at all**.

A way to handle this is to ask them what they're really talking about. Or maybe you've 
caught *yourself* uttering this phrase. Ask yourself what you're really 
talking about, then!

### "Abstraction should not be a goal"

This one is odd. 

Assuming they *are* talking about the essence, then their point might be, 
"don't identify the essence of the problem and then forget to solve it". 
But, who does that? 

Also, what if the job *is* to just create a model of the essence of the problem, 
so that others can talk about the problem and/or solve their own problems using
specializations of this model as a means of communication?

Maybe they just mean "When solving a problem P, don't create models for things that 
aren't the essence P and thus no one suffering from P will really need". In this case, that's obviously
right, however "abstraction should not be a goal" is a very confusing way to phrase this advice.

If you find yourself in a situation where what you initially thought was non-essential 
is actually essential (or vice versa), because now you know more about the problem, then you 
should revise your design accordingly. If this revision turns out to 
be a nightmare to achieve, it will be for reasons entirely unrelated to the 
the fact that you're "using abstraction".

Maybe your programming language sucks, and it makes modifications a dangerous 
and/or tedious activity, in which case the problem is the *tool used for abstraction*, 
which is not the same as the problem being *abstraction as a tool*.

### "Don't abstract early"

This one is related to the previous one, but it's especially incoherent, given 
that **nothing** you use as a programmer *isn't* abstracted. Literally not one thing. 
From the monoid coproduct, to the list, to the memory pointer, to the assembly syscall. 
All of them are the result of abstraction.

For example, when you write the primitive `5` in your language, you are using an abstraction. 
You are not dealing with the tons of non-essential aspects (physics, electronics, etc.) 
involved in having an electronic digital computer use the Hindu–Arabic number Five.

Additionally, if "Don't abstract early" gets translated to "Don't identify the 
essence of the problem early", then the advice goes from simply incoherent 
to flat out harmful. So again, let's assume the best intentions from the person giving 
this advice, and consider that they might not be referring to abstraction as a tool. 

In that case, they probably mean "Don't put layers of indirection before you know you will need them", 
which is not only unrelated to the usefulness of abstraction, but can also be reduced to 
"Don't use things before you know you will need them", and eventually to a plain truistic advice 
such as "think before you act", which is common knowledge.

Most importantly, note that *abstraction* cannot possibly be "indirection". Abstraction 
is precisely the opposite: It is for you to deal with a problem directly, with **nothing** in
between.

### "Don't abstract"

This one is totally meaningless. So I'll leave it to you as an exercise.
That is, apply the same "technique" I did for the previous ones: Rephrase 
it in terms of "essential vs. non-essential"; If it makes no sense, or sounds 
massively harmful, then find out, or just ponder, what the person *really* meant 
when they said this.
