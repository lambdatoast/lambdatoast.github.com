---
layout: post
title:  "Elm Shakes Me Like a Monkey"
date:   2013-07-06 00:43:06
categories: elm programming
---

*NOTE: [Elm's online editor][elm-edit] is your friend.*

I've been doing all kinds of programming for years, but I've never found a subject interesting enough for me to actually want to blog about it.  
{% highlight haskell %}
main = plainText "Alright let's write a blog because... blogs!"
{% endhighlight %}
The truth is that when it comes to programming languages, tools, etc. I tend to oscillate radically -- think square wave -- between two states: *extremely-excited-about-it*, and *bored-to-death*.  
**Elm** is the first language that looks like it's going to keep me excited for at least several trimesters to come.  
{% highlight haskell %}
textForm s pos = plainText s |> toForm |> move pos
render t = collage 200 200 [ textForm "OMG"    ((sin t)*50,0)   |> rotate (t*2)
                           , textForm "HELLO!" (50,(sin t)*25)  |> rotate (0-t/4) ]
main = lift render (foldp (\t acc -> acc + (t/500)) 0 (fps 24))
{% endhighlight %}
([see][ex-omghello])  
I think it's the mix of its asynchronous FRP implementation and the haskell + ML + sugar magic of its syntax that seem to be right up my alley. 

I'm gonna leave it at that, since I've got other things to do and I just wanted to make a not entirely useless first post for this new Jekyll site, but I promise that in the coming months this place is gonna be, like, Elm article town.

Things to check out: 

* The [official website][elm-lang]
* The [discussion group][elm-discuss]
* A more formal/academic -- yet surprisingly easy to read -- [introduction to the language][elm-paper]
* This [Dave Matthews Band song][dmb-song]. Seriously. The drum sound. So sharp and clear-cut

[elm-paper]:   http://people.seas.harvard.edu/~chong/pubs/pldi13-elm.pdf
[elm-lang]:    http://elm-lang.org/
[elm-edit]:    http://elm-lang.org/try
[elm-discuss]: https://groups.google.com/forum/#!forum/elm-discuss
[dmb-song]:    http://www.youtube.com/watch?v=jRZsDxrRUng
[ex-omghello]: /examples/omghello.html
