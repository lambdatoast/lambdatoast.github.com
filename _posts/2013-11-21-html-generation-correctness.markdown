---
layout: post
title:  "HTML generation and correctness"
date:   2013-11-21 00:43:06
categories: html programming types scala
---

I'm [brainstorming][ironhtml-repo] a little library for generating HTML in Scala, and due to my ever-growing concerns regarding correctness, 
I've decided to go for a purely functional and strictly type-safe approach. By "strictly type-safe" I mean that everything I can enforce through types, I 
will enforce. I won't go for "ease of use" and "flexibility" first. The latter should take care of itself if I know what I'm doing with 
generics, parametric polymorphism, and typeclasses. The former is not well-defined, even for myself as currently the only user of this library!.

## HTML and content models

The HTML specification has the concept of a "[content model][content-model]", which basically provides the requirements that 
an HTML element's contents must meet.

It'd be really easy (and fast) to write some functions that would allow me to create some HTML structure, and 
then write some other functions to traverse it and separately (and thus optionally) validate it. But I'm interested in correctness and using 
the type system as much as possible, so I'm designing this library's API in a way that simply won't (or shouldn't!) allow me to create incorrect HTML 
structures or render incorrect markup.

My interest is not to actually implement *all* the rules of the specification, but to grab a subset of it that is relevant to my use 
of HTML generation in my current projects, and try to do as much as possible with the type system to enforce its rules. The "Content Model" requirements meet this criteria. 
I'm certainly not interested in the unfortunate amount of convoluted inconsistencies that I've noticed in the overall specification.

I played around for a bit with unboxed union types, which can be implemented in an [intellectually stimulating but somewhat hacky][unboxed-unions] way, but 
very soon I started to get hit with insane run-time errors of compile-time type-checked code (correctness's worst nightmare!), so now I'm back to wrapping 
types in a totally type-safe custom union type, and then using implicits for allowing both a friendlier use of the library and a simpler implementation. Also, 
I had to use implicit prioritization for getting around the fact that sometimes the `x` in `f(x: AnyOf3[A,B,C])` could be `A` *and* `B`. This last part was 
a bit difficult to achieve, and I'll write more about it when I figure out exactly what made it difficult, by answering some key questions: Are my types nonsensical 
theoretically? Is the type system weak or strong in this instance? i.e. Am I being able to compile nonsensical things? or is the type system making it difficult for me 
to compile sensible things?

## What's next?

I think a proper API for dealing with HTML attributes is in order. Right now an element's attributes are just a `List[(String,String)]` 
(the tuple acting as a "name" and "value" pair). I will probably make a better type to enforce some basic rules. A `NonEmptyString` type for the "name" part of the tuple 
 is the most obviously needed thing I'd like to enforce at compile-time. 

Meanwhile, I'll keep studying the spec, and refactoring the current codebase, which is lacking some organization and consistency, modularization-wise.

## Now reading

* The [HTML specification][html-spec], of course.
* Philip Wadler's awesome "Theorems for free!" [paper][theorems-free].

## Now playing

* Creedence Clearwater Revival - [Chameleon][ccr-chameleon]
* Melt-Banana - [Candy Gun][candy-gun]

[content-model]:  http://www.whatwg.org/specs/web-apps/current-work/multipage/elements.html#content-models
[unboxed-unions]: http://www.chuusai.com/2011/06/09/scala-union-types-curry-howard/
[ironhtml-repo]:  https://github.com/lambdatoast/ironhtml
[html-spec]:      http://www.whatwg.org/specs/web-apps/current-work/multipage/index.html#contents
[theorems-free]:  http://ttic.uchicago.edu/~dreyer/course/papers/wadler.pdf
[ccr-chameleon]:  http://www.youtube.com/watch?v=1IUr_GQ_NSk
[candy-gun]:      http://www.youtube.com/watch?v=RgnoBN007Vc
