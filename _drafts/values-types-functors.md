---
layout: post
title: Values, Types, Functors.
published: false
---

## Aim

A progressive sequence of overviews of fundamental programming 
concepts, from values to functors, for a reader who might not 
necessarily be familiar with programming at all.

## Disclaimer

There is, of course, no total accuracy and completeness in the 
following material. Some topics have been mentioned but not expanded
upon, for the sake of keeping the focus on the main goal. 

Hopefully, this will provide incentive for the reader to engage in 
further study on their own.

## 1. General notions

Almost every concept we use in the programming world originates, 
or derives, from a concept that predates and/or transcends computer programming.

In this section we're going to introduce some general notions, which 
will later be placed in context of programming languages.

### 1.1. What is a value?

A value is something that encodes and conveys information.

### 1.2. What is a type?

Types are what we use to **communicate, exploit, and check whatever knowledge 
we have about our values**. 

### 1.3. Abstraction

"In programming this happens when a pattern repeats itself and we 
wish to “separate” that pattern from the 'particular instances' 
in which it appears." – Paul Hudak

Abstraction is about eliminating irrelevant detail and identifying 
the essence.

It's also about revealing common ideas in seemingly unrelated areas.

## 2. The use of computers

The general notions suggest the motivations we might have for getting 
computers in the picture.

### 2.1. What do we do with values in a computer?

The typical end of programming is to have something in the physical 
world be affected according to the resulting value of a computation. 

The effect may be the communication and/or unveiling of information, 
the transmission of voltage for controlling devices, etc.

We make computers do what we want by having them create and run 
programs, and we design and communicate what these programs should
do, in languages that have been tailored as a middle ground between 
support for abstract human thought, and support for machine-interpretable 
unambiguous specification.

Computers spawn and carry out computations, as specified by us. 

What to compute, for achieving a solution to a problem, is 
a question whose answer is partly a matter of computability – 
which is in fact a concept that predates computers – and models of 
computation.

### 2.2. Models of computation

In 825, a clever Persian called Al-Khwarizmi wrote the book 
"On the Calculation with Hindu Numerals", which specified several 
procedures that we now call algorithms.

Twentieth's century efforts to formalize the idea of an "algorithm" 
and abstract away physical details of the device used for the calculations, 
led to the development of modern computability theory.

* Turing machines
* Lambda calculus
* Theory of recursive functions
* Other – proposed, but not established or mature – models inspired by physics, chemistry, biology.

The first three models can express the same class of functions. Alonzo 
Church's thesis explains that they compute all computable functions.

When folks say a programming language is **Turing complete**, they 
mean that any computable function can be written in this language.

It's interesting to note that a model of computation is not something
to be necessarily viewed as a programming language. It is a rather 
more fundamental and abstract tool, and actual programming languages 
can be *based* on it – e.g. the so-called functional programming 
languages are based on the Lambda calculus.

* *Computability* is only one aspect. There also the  *complexity*.

Exercises:

1. If the three "chief" models of computation can compute all 
computable functions, what other criteria might we use for choosing 
one over the others in a particular situation?

## 3. Enter programming languages

A lot of the tasks that the so-called "real world programmer" does in 
their daily life are a form of language design. Sure, these languages 
may not be the "big", "general purpose", "Turing complete" languages 
we picture when we say "programming language", but the principles 
of programming language design apply nonetheless, and familiarity 
with them is useful for avoiding design mistakes.

We can now put the previously mentioned notions of value, type, etc. 
in a programming language context.

### 3.1. Values

* Explain what terms and expressions are and how Values are what they evaluate to:
  - We phrase our computational ideas as *expressions* of some *type*.

When it comes to values, a programming language gives us constructs 
which determine two things:

1. The canonical forms of the values of a type.
2. How to manipulate values of a type for computing more values.

In relation to the first point: there are certain 
**fundamental data structures** – such as lists, maps, tuples, 
and trees, to name a few – that are commonly used for structuring 
values, according to our needs.

If we have a problem, and our current information is represented 
as some value `x` – which might be a compound value – the available 
solutions to our problem will depend on how `x` is represented.

We will expand on the second point when we get to functions and 
computations, which will eventually become the focus of this
post.

For now, let's continue by noting that, out of the observation 
that quite often we need to have several values with the same structure, 
arises the notion and utility of classifying values into types.

### 3.2. Types

Consider a value `x`.

What do we know about this value, and what operations can we apply to it?

The answer is that we cannot do anything actually meaningful or useful 
with `x`, if we're not informed about the type of value it is.

Types are what we inevitably get to when we start asking: 
What is the difference between `"picture.jpeg"` and `42`? What is 
the meaning of `"Hello"` divided by `42`?.

As soon as we start building our systems, we start recognizing that 
some values from our system's Universe belong together, and 
some operations make sense only on some classification, or 
category, of values. 

* Verification of what we think we know is a great way to connect us in depth with the domain of our problem.
* With types we can communicate and enforce, e.g. that a heart surgery robot should move once by 3**mm** instead of 3**cm**.
* Note: the "static" vs. "dynamic" type *system* question is a separate discussion.

### 3.3. Functions

Functions are *mappings* from input values to output values.

Functions are how we capture a pattern of operation on a type of 
value.

From now on `f` will be the name of a function value, and if we want to 
denote that `f` takes an `A` and computes a `B`, we say `f: A -> B`.

Symbolically, the `->` in `A -> B` is meant to resemble an arrow, 
denoting a passage from a domain `A`, to a co-domain `B`.

We will say more about `->` and `A -> B` in the following sections.

Our `f` transforms an `A` to a `B`, which is the same as saying it 
*maps* values of the `A` type to values of the `B` type. 

Finally, note that, since functions operate on and compute values, and 
we specify them with an input and an output type, then they can also
be viewed as a tool for specifying the **behavior** of the values 
of the types involved.

### 3.4. Programs

"A program can be regarded as an (abstract) mechanism embodying as 
such the design of all computations that can possibly be evoked by 
it" – http://www.cs.utexas.edu/users/EWD/transcriptions/EWD02xx/EWD288.html

You will have noticed that the actual language and syntax of our 
examples is made up for our purposes. This is because the plain old 
text in which we write programs is *not* what's important.  What's 
important is the computations, which is something "created" by the 
computer, as dictated by our specifications. 

It is the shape and structure, so to speak, of our computations, 
that we're interested in. Concrete text such as `f: A -> B` is just 
a medium for communicating what we're talking about. 

It's a good idea to think about programming as a process of 
"designing computations", instead of "writing programs".

And consequently, we should view the following material as an 
introduction to "common shapes of manageable and composable 
computations".

### 3.5. Abstractions

Given the basic notion of Abstraction we introduced earlier, 
we can see that, in a context of programming languages and the design 
of computations, a benefit of creating abstractions is to have a 
*single* solution apply to many different problems, provided certain 
commonalities are found.

Notes on **Functional Abstraction**:

"In discerning the nature of a repeating pattern it is sometimes 
helpful to first identify those things that are not repeating, i.e. 
those things that are changing." – Paul Hudak

## 4. Polymorphism. Generic vs. Specific. Parametricity.

* Polymorphic types
* "Polymorphic functions arise naturally when defining functions on 
  lists and other polymorphic data types" – Paul Hudak

### 4.1. General vs. Specific

### 4.2. Parametricity

* Constraining/confining where values comes from and where they are going.

## 5. More on Functions and Computation

At this point it should be clear that we are following the idea of 
**computation as functional transformation**.

* Separation of what we want to do with how we want to do it.

### 5.1. Compositionality. Modularization. Combining functions

* Can a function be a value?
* The description of the function
* Higher-order functions

"In denotational semantics one follows an ideal of compositionality, 
where the meaning of a compound phrase is 
given as a function of the meaning of its parts." – Plotkin

## 6. Type Constructors and Kinds

In the previous section we asked "what do we know about the value 
`x`?", and noted that the process of specifying what we know about 
our values leads naturally to classifying them with types.

Now we ask: When is a type **able to classify values**?

There are things that have a similar responsibility over types as 
types have over values.

These things are called **kinds**, and they describe what we know 
about a type. 

We are particularly interested in that kind information denotes that 
we either have a type which is ready to classify values, or a *type 
constructor*, which is *not* ready to classify values and is instead 
a tool for what the term implies: constructing types.

### 6.1. A simple kind of type

A type `A` of kind `*` is readily able to classify values, so we can just 
have a value `x` of type `A`.

### 6.2. A constructor kind of type 

Consider the following kind: `* -> *`.

Called a type constructor, it takes one argument which must be 
a `*` kind of type, and with it it constructs the "final" – "actual", 
"concrete", if you will – type for values to be classified.

So, if `F` is of the `* -> *` kind, then it is a type constructor, and 
so it will take another type, say `A`, as a parameter. And finally 
we'll have values of type "`F` *of* `A`".

You might have noticed that `* -> *` looks and works like a function, 
but in the realm of types. That's a good observation.

It bears repeating: a type constructor of kind `* -> *` **cannot be used to 
classify values** until it is applied to a `*` kinded type, and the result
of the application is a fully constructed `*` kinded type, which can then 
classify values.

The reason we've introduced type constructors is that, first of all, 
we use them *all the time*:

* A pair of bananas
* A mailbox with some mail
* A bunch of aliens

Secondly, abstracting over type constructors is immensely useful
for describing fundamental computations that exist in the world 
of programming.

Ignoring the bananas, aliens, etc. for a moment: Can anything be 
said about the type constructors "a bunch of `*`", "a box of `*`", 
etc.  without even thinking/knowing what `*` might be?

### 6.3. A higher kind of type 

## 7. Checkpoint: Putting things together. Fundamental relations.

* There are fundamental data structures for values
* There are also certain **fundamental descriptions of computations**

That is, there are fundamental transformations, correspondences, 
etc. that we can recognize, structure as a combination of operations, 
name, communicate, and verify. In a word: formalize.

These formalizations allow for program reuse, generic abstraction, 
predictability, machine-based verification, and quite importantly: 
demonstrably principled expectations from our system.

There is something to be said about e.g. passing a value `x: A` and 
a function `f: A -> B` to a function which is expected to compute a 
a value of type `B`.

Instead of going around carrying a pack of recipes in our pocket, 
we want to have a clear understanding of insights and principles that 
have been distilled into terse, precise formulations.

### 7.1. Types in programming language interpretation

We've already made the point that types are fundamental and 
inevitable when trying to design computations. We did this by asking 
the "what can we do with some value `x` question?". 

* Look back at the definition of a *language*
* Give a simplified notion of interpreting a language
* Note how types are essential for knowing how to interpret the stream of symbols.

## 8. Properties. Rules. Laws.

Rules play a central role in the specification of behavior.

They are what allow us to say, e.g. If property P holds for all `B`, 
then given `x: A` and `f: A -> B`, property P holds for `f(x)`.

We are familiar with this process. It's the same thing we do when 
building things from little blocks. We make sure the little blocks 
"work" (whatever that means), so that we can then rely on the 
composed system "working".

The laws of behaviour of a structure is then just the collection of 
the transitions it can make.

Looking back at our definitions Abstraction, we can see that laws are 
a direct result of it.

"Proof by calculation is one way to connect the problem specification 
with the program solution." – Paul Hudak

Let's see some examples of properties, relevant to what we've talked 
about.

### 8.1. Example 1 – Function composition is associative

Given `f: A -> B`, `g: B -> C`, and `h: C -> D`, we have that 
`(h . g) . f` is equal to `h . (g . f)`.

## 9. Proof. Inference.

* The development of proof theory, and relevance to computer science.
* Example of inference: if the assumption that all A have property P 
  leads to an impossibility, the existence of an A with the contrary property not-P can be inferred.

## 10. Introducing an algebraic view

### 10.1. What is an algebra?

* Simply put: A set (called carrier) together with some functions that return values which are elements of that set.
* i.e. Boolean algebra: Carrier is a set with True and False. Operations are conjunction, disjunction, and negation.
* Signature of the algebra.

### 10.2. Algebraic reasoning

The observation of how often languages have been designed with the `+` 
operation denoting integer addition, real addition, and string concatenation, 
suggests an age old interest programmers have had in – what Luca 
Cardelli and Peter Wegner have called – "approximate similarity of 
algebraic structure" that some operations have.

The abstractions we're studying here are no more than the principled 
and logically consistent study of this interest in "forms" of 
computations.

## 11. Morphisms

### 11.1. Homomorphisms

Given two algebras of the same class, a function between their
carrier sets that **preserves the structure** of the class, is called a 
homomorphism.

* Preserving the structure means satisfying some properties.

### 11.2. Isomorphisms

* Review function composition.
* "Cancelling" function of a function. 
* The `id` function.
* A homomorphism that has a cancelling homomorphism is called an isomorphism.

## 12. A logical correspondence

* The Curry-Howard isomorphism
* `A -> B` as a logical implication
* Quantification
* Other logical correspondences

## Resources

* "Two Puzzles About Computation", Samson Abramsky.
* ["On a language proposal for the Department of Defence", by Edsger W.Dijkstra](http://www.cs.utexas.edu/users/EWD/transcriptions/EWD05xx/EWD514.html)
* Gordon Plotkin's "The Origin of Structural Operational Semantics".
* [SECD machine](http://en.wikipedia.org/wiki/SECD_machine)
* [Practical Foundations for Programming Languages](http://www.cs.cmu.edu/~rwh/plbook/book.pdf)
* [Theory of Computation](http://en.wikipedia.org/wiki/Theory_of_computation)
* [Value (computer science) @ Wikipedia](http://en.wikipedia.org/wiki/Value_(computer_science))
* [On Understanding Types, Data Abstraction, and Polymorphism](http://lucacardelli.name/papers/onunderstanding.a4.pdf)
* [Why type systems are interesting](http://lambda-the-ultimate.org/node/100)
* [All About Monads](http://www.haskell.org/haskellwiki/All_About_Monads)
* [Kinds](http://en.wikipedia.org/wiki/Kind_(type_theory))
