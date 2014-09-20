---
layout: post
title: Concrete vs Abstract
published: false
---

Don't let talk of "Concrete vs. Abstract" in the industry misguide you 
into missing the point of abstraction.

I have been told many times, in different ways, that "the abstract" has 
less to do with the real world than "the concrete", which deals with the 
practical, real world stuff.

However, after asking a lot about it, and thinking a lot about it, I've 
concluded that such a view is not even wrong: it is utter nonsense. And 
I'm writing this article about it, because I think it matters that you know 
this. Otherwise it can mislead you into confused design of your computer 
programs.

I also want to recommend an already existing, more explicit, *and* 
familiar, language for talking about this subject, so that we stop propagating 
bad advice such as "don't abstract too much!"

Countless times I've dealt with the consequences of innocently adopting such 
advice, as a maintainer of codebases.

## On abstraction and the real world

Assume you have a problem. Then, to have an abstraction is to have a 
way to talk about the *problem*, and *nothing* else. 

Consider the function `successor`:

    successor x = x + 1

You can think of this function as "an expression `x + 1` waiting for a value to 
plugged into `x` in order to compute the result".

The problem that the function solves is "compute the successor of a number". It's not 
"compute the successor of 9", "compute the successor of 42 as long as today isn't 
Friday", or *anything* else.

From here on, I'm going to refer to the "compute the successor of a number" problem as 
SuccessorProblem.

Now, consider something like `successor_of_forty_one = 41 + 1`, which is a perfectly valid 
function as well. Nothing wrong with it.

The problem `successor_of_forty_one` addresses is not SuccessorProblem, though. It is 
the "compute the successor of forty-one" problem. Let's call it SuccessorOfFortyOneProblem.

We can declare a relation between `successor` and `successor_of_forty_one`, 
*with respect to the problems they solve*. Namely, the latter can be called a *specific instance*, 
or *specialization*, of the former. Indeed, `successor_of_forty_one` can be defined in 
terms of `successor`, i.e. `successor_of_forty_one = successor 41`. 

The programmer who created `successor` simply found, and presumably solved, the **essence** 
of SuccessorProblem. In no way is their work somehow divorced from the "real world". In no 
way is `successor_of_forty_one` "more practical" or "closer to the real world" than `successor`.

## Think essential vs. non-essential instead

What does it mean for a programmer to have found the essence of a problem? 
It means that they can then create one solution, and reuse it in all – this is 
key: not some, not many, but *all* – of the specializations of the problem. E.g. 
the solution for SuccessorProblem *must* work for SuccessorOfFortyOneProblem, and 
all possible instances of SuccessorProblem.

What I propose then is that you frame your conversation in terms 
of "essential vs. non-essential", instead of "abstract vs. concrete", at least internally, 
as a way to keep yourself, and your team, on the right track. 

## On concreteness

Where does "concreteness" enter the picture, anyway?

Well, if "abstract" corresponds to "essential", then I guess "concrete" corresponds to "non-essential".

However, the `successor_of_forty_one` function could very well be essential to *somebody*'s problem.
It's certainly addressing the essence of SuccessorOfFortyOneProblem!

That's where a crucial question in this discussion is revealed. A question that 
most people skip over when they decide to megaphone their advice and rants on 
software design (e.g. "Don't abstract!", etc.) Namely: **What is the problem?**

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

*Nothing* is either essential or non-essential "in general". It makes 
no sense to even use those words without defining what the problem is.

## Abstraction: The process, the tools, and the result

Be prepared for listening to programmers conflating many aspects of the 
whole subject of this discussion.

Consider the following aspects: the problem (e.g. SuccessorProblem), the 
process of abstraction (e.g. identifying the essence of SuccessorProblem), 
the tools for abstraction (e.g. functions, procedures, etc.), and the resulting 
solution (e.g. writing a `successor` function).

The problem is not the same as the process. The process is not the same as the tools. The tools are not the same as the solution.

And yet you'll often hear programmers calling each of these things "the abstraction", and
then vaguely tagging them as good/bad, necessarily/unnecessary, too much this, 
lacking that, etc. 

## Common phrases

Let's apply what I've been saying to some of the things people in 
the industry often say.

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
"don't identify the essence of the problem and then forget to solve it" But, who does that? 

Also, what if the job *is* to just create a model of the essence of the problem, 
so that others can talk about the problem and/or solve their own specializations of 
the problem?

Maybe they just mean "When solving a problem P, don't create models for things that 
aren't the essence P and thus no one suffering from P will really need". In this case, that's obviously
right, however "abstraction should not be a goal" is a very confusing way to phrase this advice.

If you find yourself in a situation where what you initially thought was non-essential 
is actually essential (or vice versa), because you've obtained more knowledge about the problem, then you 
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

In this case, they often mean "Don't put layers of indirection before you know you will need them", 
which is totally unrelated to the usefulness of abstraction, since abstraction is not "indirection". 
Indeed, *abstraction* cannot possibly be "indirection". Abstraction is precisely the opposite: 
It is for you to deal with a problem directly, with **nothing** in between.

### "Don't abstract"

This one is totally meaningless, so I'll leave it to you as an exercise!
That is, apply the same "technique" I did for the previous ones: Rephrase 
it in terms of "essential vs. non-essential"; If it makes no sense, or sounds 
massively harmful, then find out, or just ponder, what the programmer giving 
this "advice" *really* meant when they said this.

## Final notes

I started this post with this sentence: 

> Don't let talk of "Concrete vs. Abstract" in the industry misguide you into missing the point of abstraction.

And I meant exactly that, and no more. 

Namely, I am *not* encouraging you to karate kick your way into ongoing 
conversations and demand that everyone stops using the terms they're 
using.

I'm just warning you about what can happen if the "abstract vs. concrete" 
view, accompanied by phrases such as "that's too abstract!", is absorbed by 
your mind and ends up *actually* informing your choices in program design. 
That would be a disaster. 

And so I'm proposing the simple "essential vs. non-essential" view, and a 
phrase such as "is this essential to the problem?" as a better question 
not only for asking but also for allowing its answers to inform your program 
design.

