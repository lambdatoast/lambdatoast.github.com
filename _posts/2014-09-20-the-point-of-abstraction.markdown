---
layout: post
title:  "The point of abstraction"
date:   2014-09-20 00:43:06
categories: programming
---

Don't let talk of "Abstract vs. Concrete" in the industry misguide you.

I have been told many times, in different ways, that "the abstract" has 
less to do with the real world than "the concrete," which supposedly deals with the 
practical, real world stuff.  

However, I've recently concluded that this is a nonsensical claim, and
I'm writing this article about it, because I think it is important that you know 
this. Otherwise you can be misled into confused design of computer programs.

I also want to recommend an already existing, more explicit, *and* 
familiar language for talking about this subject, so that we stop propagating 
bad advice such as "don't abstract too much!" Countless times I've suffered, as 
a hired maintainer of software, the consequences of innocent adoption of such advice.

## On abstraction and the real world

Assume you have a problem. Then, to have an abstraction is to have a 
way to talk about the *problem*, and *nothing* else. 

Consider the function `successor`:

    successor x = x + 1

You can think of this function as "an expression `x + 1` waiting for a 
value to be plugged into `x` in order to compute its successor."

The problem that the function solves is "compute the successor of a number." It's not 
"compute the successor of 9." It's not "compute the successor of 42 as long as today isn't 
Friday." Or *anything* else.

From here on, I'm going to refer to the "compute the successor of a number" problem as 
SuccessorProblem.

Now, consider something like `successor_of_forty_one = 41 + 1`, which is a perfectly valid 
function as well. Nothing wrong with it.

The problem that `successor_of_forty_one` solves is not SuccessorProblem, though. It is 
the "compute the successor of forty-one" problem. Let's call it SuccessorOfFortyOneProblem.

There is a relation between `successor` and `successor_of_forty_one`, 
*with respect to the problems they solve*. Namely, the latter can be called a *specific instance*, 
or *specialization*, of the former. In fact, `successor_of_forty_one` can be defined in 
terms of `successor`:

    successor_of_forty_one = successor 41

The programmer who created `successor` found, and presumably solved, the **essence** 
of SuccessorProblem. In no way is their work somehow divorced from the real world. In no 
way is `successor_of_forty_one` "more practical" or "closer to the real world" than `successor`.

## Think essential vs. non-essential instead

What does it mean for a programmer to have found the essence of a problem? 
It means that they can then create one solution, and reuse it for all – this is 
key: not some, not many, but *all* – the specializations of the problem. e.g. 
the solution for SuccessorProblem *must* work for SuccessorOfFortyOneProblem, and 
all of the possible instances of SuccessorProblem.

Anyway, I propose that, when engaging in communication and deliberation related to program design,
you speak and think – or at least just think – in terms of essential vs. non-essential, instead 
of abstract vs. concrete, as a way to keep yourself, and your team, on the right track. 

## On concreteness

Where does "concreteness" enter the picture, then?

If "abstract" corresponds to "essential", then "concrete" may correspond to "non-essential."

But that's odd. The `successor_of_forty_one` function could very well be essential to *somebody*'s problem.
It's certainly solving the essence of SuccessorOfFortyOneProblem!

That's where a crucial question in this discussion is revealed. A question that 
most people skip over when they decide to megaphone their advice and rants on 
software design (e.g. "Don't abstract!") 

The question is, of course: *What problem are we talking about?*

## Identifying the problem

Whatever your problem is, it has an essential part, and a non-essential part. 

If, in your software design brainstorm, you replace abstract vs. concrete 
with essential vs. non-essential, then any further discussion will **necessarily** 
have to take place in the context of a well-defined problem, in order to even 
make sense at all. 

This will force you to spell out the problem, and so the next question will be 
whether such a problem is worth solving, and the answer to that will depend on 
many factors: you, your boss, your economic situation, society, etc.

*That* is where the notions of "real world", "practicality", etc. enter the picture. That 
is, whether something is "practical in the real world" or not, is entirely unrelated to it being an 
*abstraction*. "Real world" is a property of problems. It's not a property of abstractions.
And whether a problem is a "real world problem" is a discussion totally orthogonal 
to the process of abstraction.

When you change your "level of abstraction", what you're moving closer to, 
or away from, is some *problem*, not "the real world."

*Nothing* is either essential or non-essential "in general". It makes 
no sense to even use those words without defining what the problem is.

## Abstraction: The process, the tools, and the result

Be prepared for listening to programmers conflating many aspects of the 
whole subject of this discussion.

Consider the following elements: 

* The problem (e.g. SuccessorProblem)
* The process of abstraction (e.g. identifying the essence of SuccessorProblem)
* The tools for abstraction (e.g. a programming language with functions, procedures, etc.)
* The resulting solution (e.g. writing a `successor` function)

The problem is not the same as the process. The process is not the same as the tools. The tools are not the same as the solution.

And yet you'll often hear programmers calling each of these things "the abstraction", and
vaguely tagging them as good/bad, necessary/unnecessary, etc.

## Common phrases

Let's apply what I've been saying to some of the things people in 
the industry often say.

> That's too abstract

This would translate to "That's too essential", to which I can only 
answer "You say it like it's a bad thing!"

Joking aside, chances are people who say this are not referring to the 
essential and the non-essential, so **they are not talking about abstraction at all**.

A way to handle this is to ask them what they're really talking about. Or maybe you've 
caught *yourself* uttering this phrase. Ask yourself what you're really 
talking about, then!

> That's too abstract (meaning "non-physical")

Leaving aside the tons of fuzziness that the "non-physical vs. physical" view itself carries with it
(see [recommended reading](#recommended-reading)); leaving aside the irony of opening 
such a philosophical can of worms while (presumably) arguing for more "real world practicality"; 
I still can't make head or tail of this point. It's certainly not talking about solving problems. 
The best approach then is to ask them "too non-physical for what?"

Maybe they really mean "That's not modelling the physical machine M". And surely by now you 
know the question that's coming: *What is the problem?* 

If the problem is "Model the machine M such that using the non-physical 
model makes people feel like they're physically using M", and the resulting 
"solution" doesn't solve that problem, then the resulting solution is aiming at the wrong problem.
But this situation has got nothing to say about the utility of abstraction as a tool.

Last note on this point: Don't forget that the point of abstraction
is about satisfying goals and solving problems, not about blindly representing how the world 
"really is". Consider this: "Represent a machine M how it 'really is' in the physical world," 
Call it RepresentMachinePhysicalBehaviorProblem. It is *a* problem. It may or may not 
be *your* problem. If it is, then solve it. If it isn't, don't go around assuming it is. 

> Abstraction should not be the goal

This one is odd. 

Assuming they *are* talking about the essence, then their point might be: 
"don't identify the essence of the problem and then forget to implement the solution for 
common specializations of the problem". But what if the job *is* to just create a model 
of the essence of the problem, so that others can talk about the problem and/or solve 
their own specializations of the problem?

Or maybe they mean "When solving a problem P, don't create models for things that 
aren't the essence of P and thus no one suffering from P will actually need". However, 
"abstraction should not be the goal" is a very strange way to express such commonsensical advice.

By the way, if you find yourself in a situation where what you initially considered non-essential 
is revealed to be actually essential (or vice versa), after you've obtained more knowledge about the problem, then you 
should revise your design accordingly. If this revision turns out to 
be a nightmare to implement, it will be for reasons entirely unrelated to
the fact that you used abstractions.  Maybe your programming language sucks, and it makes 
modifications a dangerous and/or tedious activity, in which case the problem is 
the *tool used for abstraction*, which is not the same as the problem being *abstraction as a tool*.

> Don't abstract early

This one is related to the previous one, but it's extra odd, given 
that *nothing* you use as a programmer *isn't* abstracted. Literally not one thing. 
From the monoid coproduct, to the list, to the memory pointer, to the assembly syscall. 
All of them are the result of abstraction.

For example, when you write the primitive `5` in your language, you are using an abstraction. 
You are not dealing with the tons of non-essential aspects (physics, electronics, etc.) 
involved in the "make an electronic digital computer use the Hindu–Arabic number Five" problem.

Additionally, if "Don't abstract early" gets translated to "Don't identify the 
essence of the problem early," then the advice goes from simply odd 
to flat out harmful. But again, let's assume the best intentions from the person giving 
this advice, and consider that they might not be referring to abstraction as a tool. 

They will often really mean something like "Don't create layers of indirection before you know you will need them", 
which is again entirely commonsensical, and, most importantly, totally unrelated to the 
usefulness of abstraction, since "abstraction" is *not* "indirection".  

Indeed, *abstraction* cannot possibly be indirection, since it is precisely the opposite: 
Abstraction is how you deal with a problem directly, with **nothing** in between!

> Don't abstract

This one is totally meaningless on its own, so I'll leave it to you as an exercise.
That is, apply the same "technique" I did for the previous ones: Rephrase 
it in terms of "essential vs. non-essential"; If it makes no sense, or sounds 
massively harmful, then find out, or just ponder, what the programmer giving 
this "advice" really meant when they said this.

## Final notes

I started this post with the sentence: 

> Don't let talk of "Abstract vs. Concrete" in the industry misguide you.

And I meant exactly that, and no more. 

Namely, I am *not* encouraging you to karate kick your way into ongoing 
conversations and demand that everyone stops using the terms they're 
using.

I'm just warning you about what can happen if the "abstract vs. concrete" 
view, accompanied by phrases such as "that's too abstract!", is absorbed by 
your thought process and ends up *actually* informing your choices in program design, 
which would lead to disaster. 

Secondly, I'm proposing the simple "essential vs. non-essential" view, accompanied 
by queries such as "is X essential to the problem?" which are better, both 
for asking with clarity about what you mean, and for allowing its answer to inform 
your program design choices.

Finally, note that my advice replaces a duality which I consider harmful, 
with another one which I consider helpful. Whether a duality view of programs 
and problems is "good" is a discussion out of the scope of this article.

## Recommended reading

* [On Understanding Types, Data Abstraction, and Polymorphism](http://lucacardelli.name/Papers/OnUnderstanding.A4.pdf) – L. Cardelli, P. Wegner
* [The Philosophy of Computer Science](http://plato.stanford.edu/entries/computer-science/) – Stanford Encyclopedia of Philosophy


