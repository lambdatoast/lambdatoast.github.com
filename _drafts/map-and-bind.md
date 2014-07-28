---
layout: post
title: Map and bind – Best Friends Forever
published: false
---

## Goal of this post

Tell you about the data flows that make people 
adopt (or reinvent) functors, monads, etc.

## Audience

You should know what a function is. You should know 
what a value is, what a type of a value is, and 
what type constructors are.

The following kind of syntax and statement should make 
sense to you:

"Given `x: A` and `f: A -> B`, then `f(x): B` is a 
well-formed expression."

If any part of that sentence seems odd, then first 
read [this short post][values-types] I wrote on the subject.

## Example scenario
...

## Loading a user

    fun loadUser(UUID): User
    fun userName(User): Name

So, ideally, we would like to have this data flow:

    UUID -> User -> Name

Which, assuming some value `x` of type `UUID`, we would compute this way:

    userName(loadUser(x))

Obtaining a `Name` from the `x`.

But now assume a typical situation where one of these functions, 
say, `loadUser`, doesn't always "Just Work". Meaning, you can always 
expect a meaningful result from `userName`, but not from `loadUser`.

In that case, you say `loadUser` is *partial*: only for *some* of 
the possible values of its input type (`UUID`), will it evaluate to 
a valid output, but for other `UUID`s, it won't.

    // Imagining the Set of all values of type UUID
    UUID = { 0, 1, 2, 3, ..., Infinity } 

On the other hand, `userName` is *total*: for *every possible input* 
of its input type, it will evaluate to a valid output. 

## Seeing the partiality in our data flow

Using the fact that type annotations are just another view of logical 
propositions, we can state our data flow...

    UUID -> User -> Name

...in a more logically and computationally revealing way:

    "A UUID implies a User, which implies a Name"

That reveals the wrongness – or naivety, if you will – of our 
proposed data flow.  

While it'd be awesome if a UUID *implied* a User, the truth is 
that it doesn't. There's not a User for *every possible UUID*, so 
pretending that having a UUID *implies* having a User, is a brittle
way to design, document, and present our data flow.

But again: functions *are* logical implications. And we *want* to 
create a function, therefore we *want* to state a logical implication!.

It seems that the right way to go is to state a more *accurate* implication.

## Taking partiality into account

Here's a more accurate chain of implications:

    UUID -> User or NULL -> Name or NULL

In informal speak:

    "A UUID implies a User or NULL, which implies a Name or NULL"

Now the type is more *honest*. However, we can do better than 
`User or NULL`.

## NULL is unneeded, unsafe, unclear, and an acknowledged historical mistake.

...

## A more meaningful abstraction

Let's define a kind of data that expresses the idea of not 
being certain about the existence of a value of some type:

    data Possibly a = some(x: a) | nothing

This is read, in informal speak:

    "All data of the `Possibly a` type, will be either some value 
    `x` of some type `a`, or nothing at all."

We have declared a "closed" type: Values of its type can only be 
constructed with the specified `some` and `nothing` functions. 
The `nothing` function, suitably, takes no arguments.

Here's a program that just declares some values manually:

    x : Possibly UUID = some 42
    y : Possibly UUID = nothing
    z : Possibly User = nothing

Using our Possibly type, the more accurate chain of implications would be:

    UUID -> Possibly User -> Possibly Name

Which you read:

    "The existence of a UUID, implies the possibility of a User, 
    which in turn implies the possibility of a Name"

Note how the introduction of partiality makes the rest 
of the data flow partial as well. It's a chain of information: 
once a link in the chain becomes partial, the rest of the 
information can't be assumed to exist for certain.

Seeing the more accurate chain of implications, you 
can picture the possible data flows, assuming a UUID:

    UUID ----> Nothing   ----> Nothing
         \---> Some User ----> Some Name

Now that the chain of implications is more accurate, it's 
time to update the types of the operations involved.

## Updating the type of loadUser

    fun loadUser(UUID): Possibly User

## Updating the type of userName

...

## Maintaining separation of concerns and modularity

...

Points to make:

* The code author's data flow propositions are not necessarily the user's propositions.
* maintaining `userName` not knowing about `Possibly`
* E.g. Should the numeric `+` operation care about whether its Number 
  arguments were obtained purely or as the result from a potentially
  failing http request? And if the answer is yes, 
  then should it assume that the right type for handling the potential 
  failure is `Possibly` or something? No. You 
  will either reach impracticality or impossibility, if you try to apply 
  that kind of approach to 
  writing functions. It is also *anti* modular. When you design operations
  as functions, 
  the argument of the function should *only* carry exactly the information 
  that the function needs. Anything else, with regards to the input, is not 
  of the function's concern. Now, as for the *output* of the function, 
  that *is* entirely the concern of the function, and so the output type 
  should express things very clearly, without any loss of relevant information.
* Introducing `map`
* Idea of "lifting" userName

## Applicative
...

[values-types]:   /
