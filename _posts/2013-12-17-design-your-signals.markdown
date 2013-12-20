---
layout: post
title:  "Design your signals before resorting to convoluted logic"
date:   2013-12-19 10:00:06
categories: elm signals
---

Using a tool that is new to us doesn't automatically make
our brains adopt a corresponding way of thinking. Thus, opportunities for misuse 
and overcomplication present themselves in many places.

In this case the new tool is Elm, and the way of thinking is FRP. Specifically 
signals. We're going to see that having a seemingly convenient signal plugged to 
the wrong part of our program can lead us to making up problems, and 
having to come up with convoluted ways of solving them.

## Input signals and the "Update" layer

While built-in goodies such as `Window.dimensions` and `Mouse.isDown` are pretty much 
the cornerstone of our Elm GUIs, we can (and sometimes *should*, as we'll see) control, 
transform, and interpret these primitive signals, to create more semantic ones.

This is not just a matter of aliasing the `True` and `False` values of `Mouse.isDown` to 
more meaningful ones, i.e. `Shooting` and `Idle`. It is also a matter of creating the 
simplest and most correct signal for the job.

What I'm going to do here is stage a common situation I've found myself 
and others (from the Elm questions I've gotten from other newcomers) in.

## Common example: Adding a pause button to a program

Consider the following program.

{% highlight haskell %}
-- Model
m = (0,0)
-- Update
update t (x,y) = ((sin t)*50,y)
-- Render
render m = collage 200 200 [ circle 10 |> filled blue |> move m ]
-- Input
input = (foldp (\t acc -> acc + (t/500)) 0 (fps 24))
-- Main
main = lift render <| foldp update m input
{% endhighlight %}

Typical organization of an Elm program. Explicit, unambiguous separation of 
concerns into input, model, update, and render modules (well, "sections" of a single
file, for these particular examples).

The idea is to be able to pause the program with the keyboard. So let's add 
another signal to the `input`, say, `Keyboard.enter`.

{% highlight haskell %}
import Keyboard
-- Model
m = (0,0)
-- Update
update (t,enterIsDown) (x,y) = ((sin t)*50,y)
-- Render
render m = collage 200 200 [ circle 10 |> filled blue |> move m ]
-- Input
input = lift2 (,) (foldp (\t acc -> acc + (t/500)) 0 (fps 24)) Keyboard.enter
-- Main
main = lift render <| foldp update m input
{% endhighlight %}

The type – which isn't annotated because type inference FTW – of our `input` value is now `Signal (Float,Bool)`. 
That is, a signal of a pair of values: the time delta, and a boolean representing whether the `enter` key is down.
The first argument of the `update` function has also been modified to accept the new shape of our input.

So far so good, but we want to *toggle* the state, which means we can't just change the `update` code to:

{% highlight haskell %}
-- ...
update (t,enterIsDown) (x,y) = if enterIsDown then (x,y) else ((sin t)*50,y)
-- ...
{% endhighlight %}

Right? Because this "pause" functionality would pause the program only while the enter key is down. When we release 
the button, the program will resume, and that's not the behavior we want. 

Therefore we're going to need more than just the `Keyboard.enter` signal.

## Adding a representation of the program's state

Presumably, we want some representation of the running state of the program. 
Once we have that as a value, the plan is then to check `Keyboard.enter` in 
the `update` function, and if it's `True`, toggle the value which 
actually represents the state of the program.

*Before proceeding: Do you see a problem with this plan?.*

Let's add an algebraic data type for representing the state,
and attach an initial value of this type to our model.

{% highlight haskell %}
import Keyboard
-- Model
data ProgramState = Paused | Running
m = ((0,0),Running)
-- Update
update (t,enterIsDown) ((x,y),state) = (((sin t)*50,y),state)
-- Render
render (m,_) = collage 200 200 [ circle 10 |> filled blue |> move m ]
-- Input
input = lift2 (,) (foldp (\t acc -> acc + (t/500)) 0 (fps 24)) Keyboard.enter
-- Main
main = lift render <| foldp update m input
{% endhighlight %}

This doesn't change the behavior of our program. We've just added more data to 
work with.

Now let's modify the `update` function according to plan.

{% highlight haskell %}
import Keyboard
-- Model
data ProgramState = Paused | Running
m = ((0,0),Running)
-- Update 
update (t,enterIsDown) ((x,y),state) = 
  let toggleState s = 
        case s of
          Running -> Paused
          Paused  -> Running
      state' = if enterIsDown then toggleState state else state
  in case state' of
            Running -> (((sin t)*50,y),state')
            Paused  -> ((x,y),state')
-- Render
render (m,_) = collage 200 200 [ circle 10 |> filled blue |> move m ]
-- Input
input = lift2 (,) (foldp (\t acc -> acc + (t/500)) 0 (fps 24)) Keyboard.enter
-- Main
main = lift render <| foldp update m input
{% endhighlight %}

The program now toggles the state depending on what the current value of `Keyboard.enter` is, 
and then the meat of our update logic acts according to the computed state.

However, if we tested this program, we'd see that our pause button is 
broken: Sometimes it pauses the program. Sometimes it doesn't. Sometimes it pauses 
and then immediately resumes.

## Our plan has a problem

The plan seemed complete: If `Keyboard.enter` is `True`, toggle the `ProgramState`. What else 
is there to do?.

The problem is that we forgot about the fact that the `update` function is executed 24 times per second!.

From the moment we press down the enter key, until the moment we release it, `update` will have seen 
`Keyboard.enter` as `True` (and therefore toggled the state) a bunch of times.

If you already know a bit about Elm, you're probably thinking about a signal-filtering 
function such as `dropRepeats`. But that wouldn't solve the problem, 
because even if you plugged `dropRepeats` in front of `Keyboard.enter`, the `update` 
function would still see the current value of the signal (repeated or not) 24 times 
per second. (However, you *are* on the right track!)

## Further action is needed

This is where things will get convoluted. However, since there's 
people who browse the web for tutorials and then copy/paste
code without even reading the actual explanations for it, I will not write the 
actual code for the convoluted solutions to our current problem, just in case!. 

But it's easy to imagine that the 
"next step" in the evolution of our increasingly convoluted program would be 
to add more state and conditions to the update logic to basically, somehow, 
toggle the state if `Keyboard.enter` is down, unless it's just been 
pressed and it hasn't been released. Or something like that. 

Yikes.

To be clear: we *could* (and I have, and seen others do, too) keep adding 
more flags and state and crap to our current program, and eventually get a 
functioning pause button (or similar requirement), but we 
should stop here, and take a couple of steps back.

## Where did we go wrong?

At the beginning, actually.

Remember I mentioned the idea of a convenient signal
connected to the wrong part of our program.

If we go back to our introduction of the `Keyboard.enter` signal, we'll see that the `update` 
function changed to:

{% highlight haskell %}
-- ...
-- Update
update (t,enterIsDown) (x,y) = ((sin t)*50,y)
-- ...
{% endhighlight %}

But I did not ask the question: is `Keyboard.enter` plugged to `update` a sensible signal 
path for our ultimate goal?. And the answer to that question is negative. 

I made the following 
logical leap (which perhaps you caught right away): *"Program P needs to react 
to key K. Therefore, update logic U needs to react to key K."*

The worst thing about this leap is that, after it was made, all further problems and 
"solutions" appeared to be the concern of the Update layer. So, as I saw that the program 
still wouldn't behave as expected, I kept wanting to add more logic to the `update` function. 

## Designing our signals

As I've hinted enough already, what we need to do is a bit of signal transformation. 

The `ProgramState` algebraic type and its `toggleState` operation were actually a good idea, 
so let's keep 'em, but use them better:

{% highlight haskell %}
import Keyboard
-- Model
data ProgramState = Paused | Running
m = (0,0)
-- Update
toggleState s =
  case s of
    Running -> Paused
    Paused  -> Running
update (t,state) (x,y) = 
  case state of
    Running -> ((sin t)*50,y)
    Paused  -> (x,y)
-- Render
render m = collage 200 200 [ circle 10 |> filled blue |> move m ]
-- Input
input = 
  lift2 (,) 
        (foldp (\t acc -> acc + (t/500)) 0 (fps 24))
        (foldp (\enterIsDown s -> if enterIsDown then toggleState s else s) Running Keyboard.enter)
-- Main
main = lift render <| foldp update m input
{% endhighlight %}

And there we have it!. 

Look at the `update` function. It no longer reacts to the current value of 
`Keyboard.enter`. Rather, it reacts to the current value of a `Signal ProgramState`.

Does it matter that the `update` function gets executed multiple times while our finger is 
pressing `enter`? Nope! As can be seen in the definition of `input`, the logic for toggling 
the `ProgramState` signal only runs whenever `Keyboard.enter` updates **discretely**.

Now what the `update` function sees 24 times per second – it will still run that many
times, since it has to react to the `(fps 24)` signal we're also plugging into it – is 
whatever the current value of the `ProgramState` signal is.

Additionally, note that we don't even need to pollute our model `m` with a `ProgramState` value.

## A last bit of refactoring

For extra points, let's remove some repetition, by making a function that returns its first argument if a state is
`Running`, or the second argument otherwise. We can then use that function for both toggling the state in our 
now more tailored `input`, and reacting to it within the `update` function:

{% highlight haskell %}
import Keyboard
-- Model
data ProgramState = Paused | Running
ifRunning a b s =
  case s of
    Running -> a
    Paused  -> b
m = (0,0)
-- Update
update (t,state) (x,y) = ifRunning ((sin t)*50,y) (x,y) state
-- Render
render m = collage 200 200 [ circle 10 |> filled blue |> move m ]
-- Input
input = 
  lift2 (,) 
        (foldp (\t acc -> acc + (t/500)) 0 (fps 24))
        (foldp (\enterIsDown s -> if enterIsDown then ifRunning Paused Running s else s) Running Keyboard.enter)
-- Main
main = lift render <| foldp update m input
{% endhighlight %}

Motherflipper is done.

## Goodness achieved

We went back to the drawing board and designed our signals, and then:

* We put the logic for computing the `ProgramState` in a better part of the program.
* We avoided a set of problems entirely, by recognizing the usefulness of Elm's discrete signals and signal manipulation.
* We made the `update` function react to a more semantic signal of `ProgramState`. Now it knows nothing about `Keyboard.enter`.

Basically, we gained expressiveness and controlled complexity as a direct result of *plugging the right signals into the right places*.

## Finally, a generalization of the lesson 

*(Because no programming blog post is complete without some goddamn "rule of thumb" by the author!)*

Leaving signals, FRP, Elm, and actually pretty much all of the specifics of this 
post aside, there seems to be an additional, and more general lesson here, 
which if I had to formulate, would go something like this: The **less** interpretation 
logic – such as conditionals and other forms of poking – we do on the 
input arguments of a function, the **more** the function can be read as a simple equation,
which is *A Good Thing*.

That's all for now.

## Now reading

* [Functional Programming in Scala][fpis-book] by Paul Chiusano and Rúnar Bjarnason.
* [A History of Western Philosophy][russell-book] by Bertrand Russell.

## Now playing

* An awesome band called [Grand General][grand-general]
* Debussy's [La mer][la-mer]

[grand-general]: http://www.last.fm/music/Grand+General
[la-mer]:        http://www.youtube.com/watch?v=hlR9rDJMEiQ
[fpis-book]:     http://www.manning.com/bjarnason
[russell-book]:  http://www.amazon.com/History-Western-Philosophy-Bertrand-Russell/dp/0671201581
