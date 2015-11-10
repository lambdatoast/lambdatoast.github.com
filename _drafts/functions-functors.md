---
layout: post
title: From Functions to Functors
published: false
---

# From Functions to Functors

Category Theory – "CT" from here on – is the study of transformations, in a general sense. A very general sense. It has been called "thinking with arrows," because whenever CT folks talk about *anything*, they do so in terms of things flowing from source to target. 

CT has also been enthusiastically embraced by Functional Programming folks, which isn't surprising, because when *they* talk about anything, they do so in terms of things flowing from source to target!

In this article the aim is to make you familiar with the notion of **functoriality**.

# 1. Preparation

Before stepping into CT, I want to get us all on the same page, by doing a quick review of plain old *functions*.

## 1.1. Functions

You probably already have an intuition for what a function is, but let's grab a precise definition from Wikipedia:

> A function is a relation between a set of inputs and a set of permissible outputs with the property 
> that each input is related to exactly one output.

Reading it carefully, you will note that, first of all, functions operate on *sets* – which for our purposes, are just collections of distinct things. 

For example:

Let `Color = { Yellow, Red }` and `Fruit = { Banana, Peach, Tomato }` be two sets.

Here's one way to relate **Color** to **Fruit**:

    (Yellow, Banana) (Yellow, Peach) (Red, Tomato)

That is a fine *relation* between sets, but not a valid *function*, because it relates the `Yellow` input to both `Banana` and `Peach`.

Now let `Work = { Elements, Othello }` and `Author = { Shakespeare, Hemingway, Euclid }`.

And here's one relation:

    (Elements, Euclid) (Othello, Shakespeare)

That is a relation which *is* a valid function: Each input is related to exactly one output.

For history points, here's a quote from 1835 by the German mathematician Peter Dirichlet:

> If a variable y is so related to a variable x that whenever a numerical value is assigned to x, there is a rule according to which a unique value of y is determined, then y is said to be a function of the independent variable x.

It doesn't exactly roll off the tongue, but it is supposedly the first modern formal definition of a function. That is, the notion had existed for a while, but only vaguely defined.

**Exercise 1:** I still would like to relate colors to fruits, keeping **Color** as the input set. Can you think of a way to relate them using a valid function? (Hint: **Fruit** per se doesn't have to be the output set.)

## 1.2. Functions in a programming language

Let's reiterate the mathematical specification for a function (last time, I promise):

> A function is a relation between a set of inputs and a set of permissible outputs with the property 
> that each input is related to exactly one output.

First things first: We need those input and output *sets* for our functions to operate on.

That's easy. We're going to say that the *types* in our programming language are those sets. For example:

1. `boolean`, whose elements are the values `true` and `false`. 
2. `number`, whose elements are... too many to list. Let's just say (...`-3`,`-2`,`-1`,`0`,`1`,`2`,`3`...)

In Javascript:

    function square(x) { return x * x }

In Haskell:

    square x = x * x

So `square` is a function. A proper, well-behaved function, because: 

1. It **relates** the elements of an input set, i.e. *values of the `number` type* in our programming language, to the elements of another set
2. It **satisfies the property** that each input value relates to only one output value, i.e. `square(2)` equals `4`, always and forever.

Functions are useful in programming for various reasons. A big one is that in our programs we like to use *values* to encode information. 

And if we use values to encode information, then functions, by definition, allow us to **relate information to other information, in a reliable way**:

* "...relation between a set of inputs and a set of permissible outputs..." → "relate bits of information to other bits of information..."
* "...with the property that each input is related to exactly one output" → "...in a reliable way"

(Yes, I'm saying functions are good *by definition*. Don't say they aren't. They are!)

For vocabulary points: note that `square`'s input and output sets are the same (`number` and `number`.) This makes `square` an "*endo*function."

## 1.3 Functions in your mind

Think about your functional programs *equationally*. Forget about the `return` syntax ceremony when thinking about functions.

The main benefit (or rather, the root of all the benefits) of FP is **equational reasoning**, which is a direct result of using *functions*. So `square(4)` doesn't "return" `16`. It *is* `16`. It is just another way of *expressing* it. It is an *expression*. An *expression* of `16`. It does nothing else but be an expression of `16`. 

Approach it the same way you do arithmetic in your mind: Not "2 + 2 returns 4," but "2 + 2 *equals* 4".

## 1.4. Summary

Alright, preparation done. We've reviewed the following things: 

* What *functions* are, and the mathematical object they operate on (*sets*)
* How we can apply the idea of a function in a programming language
* Why functions are useful

We can now jump into CT.

# 2. Categories

A category is something similar to a set, in the sense that it too is a collection of things, some of which are "objects," some of which are "arrows". 

The objects can be anything, and so can the arrows.

And if you're still reading after I literally used the words "things," "something," and "anything," while describing a concept: Thank you for sticking around! 

There's more to it, of course. Namely, **there are certain *equational properties* that must be satisfied** in order for something to be considered a category. Whatever satisfies those properties can *reliably* use all the categorical tools (machine-wise and brain-wise), proofs, etc. that apply to it.

Fittingly, in FP equational reasoning is second nature, so we can always demonstrate whether or not a given equational property is satisfied.

We will now dive into each part that a category is made up of. As we go through it, we will see how a programming language gives rise to a category. I will unimaginatively call this category "**PL**".

## 2.1 Objects

The objects in a category can be almost anything: Sets, topological spaces, types, algebras, bananas, zombies, etc. Even other categories.

They are not the interesting part of a category, just like sets are not the interesting part of functions.

## 2.2 Objects in a programming language

One of the most studied categories is the one called **Set**, which is the one where the objects are, unsurprisingly, *sets*.

We've previously decided that our programming types are *sets*. We'll keep relying on this method, i.e. deciding that an X in the programming language represents a Y in math (as long as it precisely satisfies the definitional properties of Y).

In this case, I'm going to say that that **the types in our programming language are the implementation of the objects in our PL category.**

There's not much code to write here, if we're using Javascript. Let's just say that the language provides us with `number`, `boolean`, and other types.

If you're playing with another language, like Haskell, where you can create types and user-defined primitive values of those types, e.g. `data Fruit = Banana | Peach | Tomato`, then the `Fruit` type would be an object in the category.

OK so the types are **PL**'s objects. Moving on.

## 2.3 Arrows

Just like with objects, arrows too can be anything: functions, other kinds of mappings, as well as stuff such as numbers, etc.

The idea is that we choose things which can be **meaningful** as connections between objects of the category in question.

Graphically, the arrows would be the edges in a directed graph (which is how they are usually drawn).

## 2.4 Arrows in a programming language

We're going to make the obvious choice here. If *types* are our objects in **PL**, then:

**The arrows in PL are our functions between the types.**

For example, we have already added an arrow to our category: The `square` function, which is an arrow from the `number` object to itself. 

OK, so this is all well and good, but it seems pointless. I mean, we're just *calling* existing things by new words (types serve as "the objects", functions serve as "the arrows"). It seems pretty intuitive, but useless. 

Now, in the previous section I mentioned that arrows could be *anything*, e.g. natural numbers, which perhaps are not something you've ever imagined presenting as an arrow. How could, say, the number `2`, serve as an arrow? Where would that arrow come from and go to? And how could *that* possibly be **meaningful**?

The answer lies in the next part a category must have, the part that gives it meaning, and structure: the arrow composition operation.

## 2.5 The arrow composition operation

**This is key**. This is where the magic happens. This is what functors will carefully preserve, when they do their thing.

This operation has the symbol `∘` in CT books, and is what handles the domain-specific way that arrows in your categories compose.

`∘` (which is useful to pronounce "after") is a binary operation, that takes two arrows, and *somehow* produces another arrow, i.e. however it makes sense to do so, for the category in question.

`∘` must be associative, i.e. let three arrows `f`, `g`, `h`, be composable, then `(h ∘ g) ∘ f = h ∘ (g ∘ f)`.

## 2.6 The arrow composition operation, in a programming language

So far, the objects in **PL** are types, and the arrows are *functions*. 

Since `∘` is supposed to compose arrows, and *functions* are our arrows, then in our programming language this operation has to compose functions:

        // (b → c, a → b) -> (a → c)
        function compose(g, f) { return function (x) { return g(f(x)); }; }

I went with the name `compose` instead of `after`, because `after` would make more visual sense if we were allowed to define infix functions in JS, e.g. `g after f`. But we can't do that in plain JS.

To be clear: The program `compose(g, f)` is the implementation of what the mathematician would write as `g ∘ f`.

**Exercise**: Verify that `compose` satisfies the associativity property. I.e. `compose(compose(h, g), f)` equals `compose(h, compose(g, f))`.

## 2.7 Arrow composition in the big picture

When we design computer programs, we look for building blocks that can be put together, in order to create new things, which themselves can be building blocks for something else.

We look for that sort of thing, because it keeps complexity under control. Not just in programming, but in general. Two lego pieces composed together are a lego piece. Two unix programs piped together are a unix program.

Function composition is FP's classic answer to this. And the generalization (and as we'll see later, "preservation") of such composition, in a mathematically precise way, is what CT contributes to the matter.

## 2.8 Identity arrows

Every object in a category must have an identity arrow. That is:

If there's an object `X`, then there's got to be an identity arrow `idX: X → X`

If there's an object `Y`, then there's got to be an identity arrow `idY: Y → Y`

And so on, for *all* objects in the category.

Of course, it's not enough to just draw an arrow from an object to itself and *call it* an identity. The following equational property is what makes an arrow an *identity*:

* Given two objects `X` and `Y`, and an arrow `f : X -> Y`: If `f ∘ idX = f = idY ∘ f`, then we say that `idX` and `idY` are the identities of their respective objects.

The utility of this seemingly useless arrow will be made clear later.

## 2.9 The Identity arrows in a programming language

Or I should say "arrow," in singular! Because luckily for us, we have parametric polymorphism in our programming languages, so the following function can be the identity arrow for *every* object in **PL**:

		// a -> a
    function id(x) { return x }

**Exercise**: Show that the identity equations hold, i.e. `compose(id, square)` is the same as just `square` is the same as `compose(square, id)`.

**Exercise**: Show that `square`, even though it is an arrow from an object to itself (`number -> number`), it is not the identity for it.

## 2.10 Summary

To sum up, a category consists of: objects, arrows, arrow composition, and identities.

We're observing that our programming language gives rise to a category **PL** in which the corresponding parts are: types, functions, function composition, and the polytypic identity function.

There's plenty more to say about categories. Namely, categorical constructions which arise in enough places (many of them relevant to programming languages) to deserve their own names and study, e.g. products, exponential objects, etc. but I will skip those for now, because the basic knowledge we have now is enough to introduce the basics of functoriality.

Let's step back and look at our progress so far:

1. We revised *functions*, which are **mappings between sets**.
2. We noted that *types and their values* correspond to *sets and their elements* nicely, and shifted our discourse to say **mappings between types**.
3. We introduced the "collections with algebraic rules of compositionality" things, called *categories*, which hold both our types and their mappings.

It is now time to talk about **mappings between categories**!

# 3. Functors

A category, being a mathematical object itself, can totally be subject to transformation. And this transformation is done by what is called a *functor*.

A functor maps a category to another category while *preserving the structure*, in precisely the following way:

Given two categories `C` and `D`, a functor `F : C -> D` consists of **two parts**:

1. **The object part**: Each object `X` in `C` is mapped to an object `F(X)` in `D`.
2. **The arrow part**: Each arrow `f: X -> Y` in `C`, is mapped to an arrow `F(f) : F(X) -> F(Y)` in `D`.

Additionally, this "two-part mapping," if you will, must be such that, for all **C**-objects `A` and composable arrows `f` and `g`, the following equational properties hold:

1. `F(idA) = idF(A)`
2. `F(g ∘ f) = F(g) ∘ F(f)`

Satisfying these equations is what makes the functor "preserve the structure".

**A notation clarification**: when you see an object named `F(X)` in `D` (as a result of the object part of a functor `F`), the object is given such a name in order to communicate the following two things about it:

* It was "brought over to" `D` by a functor named `F`.
* It "came from" the object named `X` in the source category `C`.

Particularly, the naming `F(X)` does **not** imply that `F`, the *functor* itself, is a "container," or anything like that.

Easy vocabulary points: If the target and source categories of a functor are the same, then we say the functor is an "*endo*functor." 

## 3.1 Functors in a programming language

First let's substitute what we already implemented for **PL**, into the mathematical definition of a functor, to get a good idea of what we have to implement next:

> A Functor maps a category to another category while *preserving the structure*

Replace "category":

> A Functor maps a **{collection of types and functions between them}** to another **{collection of types and functions between them}** while *preserving the structure*

Replace "structure":

> A Functor maps a {collection of types and functions between them} to another {collection of types and functions between them} while *preserving the* **{composition of the functions}**

OK so let's implement a couple of example functors in our little **PL** category.

## 3.2 A functor for the Array data type

In Javascript:

    // Implements component (2) of the Functor specification. This one for arrays.
    // (a -> b) -> (array a -> array b)
    function arrayMap(f) {
      return function (xs) { return xs.map(f); }
    }

    // A new function for testing composition:
    // number -> boolean
    function isEven(n) { return n % 2 == 0; }

    // Test the (isEven ∘ square) composition.
    var r0 = isEven(square(3)); // false

    // Create the new functions
    var squareArr = arrayMap(square);
    var isEvenArr = arrayMap(isEven);
    
    // Test the (isEvenArr ∘ squareArr) composition.
    var r1 = isEvenArr(squareArr([2,3,4])); // [true, false, true]

Things to note:

* **Preservation of composition**: in computing `r1`, we were able to, within the category of **PL** (as target of the endofunctor), make use of the fact that `isEven` and `square` compose! 
* **Separation of concerns**: `arrayMap` (a.k.a the arrow part) allows us to use existing functions in a context (arrays) they are not even aware of, i.e. neither `isEven` nor `square` have any idea of what an array is.

## 3.3 A functor for the Option data type

    // (a -> b) -> (option a -> option b)
    function optionMap(f) {
      return function (o) {
        return o.value ? some(f(o.value)) : o;
      }
    }
    function some(x) { return { value: x }; }
    function none() { return { }; }

    // Test programs (assume existence of `compose`, `square`, and `isEven`):

    // (option number -> option boolean)
    var p1 = compose(optionMap(isEven), optionMap(square));

    // (option number -> option boolean)
    var p2 = optionMap(compose(isEven, square));

Things to note:

* **Equational refactoring**: Note that `p2` is the same as `p1`, by the functorial property of `F(g ∘ f) = F(g) ∘ F(f)`. Implementation-wise, you could say `p1` is less memory efficient, so we can safely "refactor" `p1` into `p2`, with all certainty that they denote the same program.
* **The Option data structure is our fault**: Whether you prefer sprinkling `null`s all over your code over representing partiality in a data type, or not, is a discussion CT is not interested in. CT didn't bring the Option container-like data type into the picture, *we* did. CT only reveals to us that we can define a *functor* **for** it, **if** the implementation satisfies all the functorial properties involved.

## 3.4 A functor for the Result data type

    // (a -> b) -> (result a -> result b)
    function resultMap(f) {
      return function (r) {
        return r.isSuccess ? success(f(r.value)) : r;
      }
    }
    function success(x) { return { isSuccess: true, value: x }; }
    function failure(err) { return { isFailure: true, value: err }; }

    // Test programs (assume existence of `compose`, `square`, and `isEven`):

    // (result number -> result boolean)
    var p1 = compose(resultMap(isEven), resultMap(square));
    // (result number -> result boolean)
    var p2 = resultMap(compose(isEven, square));

    var r1 = p1(success(3)); // { isSuccess: true, value: false }
    var r2 = p2(success(3)); // { isSuccess: true, value: false }
    var r3 = p1(failure('Could not get number from the user')); // { isFailure: true, value: 'Could not get number from the user' }

# Extra: CT is point-free math

In the world of sets and functions, an *injective* function is a "one-to-one" function. I.e. no two different input values are mapped to the same output value. Each one gets a different output.

The usual set-speak for describing this precisely is:

> For all `x,y ∈ X` then `f(x) = f(y)` implies `x = y`.

Now, in the category **Set**, CT provides the following "point-free" (no mention of set elements, set membership, etc.) precise description of injectivity:

> `f : A -> B` in the category **Set** is injective when, given `g, h : X -> A`, then `f ∘ g = f ∘ h` implies `g = h`.

And the name in CT for `f` is "monic", or a "monomorphism".

Let's show that the *monomorphisms* in the category of **Set** are exactly the injective functions. 

First, by contradiction:

1. Let `f : A -> B` be injective
2. Let `g, h : X -> A`
3. Let `f ∘ g = f ∘ h` but `g != h` (i.e. we intend to show that there can be an injective `f` which is not a monomorphism.)

If `g != h`, then there exists an `x ∈ X` such that `g(x) != h(x)`.

Now, since `f` is injective, it will relate different inputs to different outputs, so if `g(x) != h(x)` then `f(g(x)) != f(h(x))`.

But `f(g(x)) != f(h(x))` means that `f ∘ g != f ∘ h`, which contradicts our 3rd point `f ∘ g = f ∘ h`.

So no, you can't have `f` be injective and not be a monomorphism.

Conversely:

1. Let `f : A -> B` be a monomorphism (i.e. "`f ∘ g = f ∘ h` implies `g = h`" holds), but *not* an injective function
2. Let `g, h : X -> A`

If `f` is *not* injective, then there exist `a1,a2 ∈ A` such that `a1 != a2` and `f(a1) = f(a2)`.

Then there can be two different functions `g` and `h` that, for a given `x ∈ X`, will produce those `a1` and `a2`, such that `f(g(x)) = f(h(x))`.

But then we have `g != h` and `f ∘ g = f ∘ h`, which contradicts our point that `f` is monic.

