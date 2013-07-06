textForm s pos = plainText s |> toForm |> move pos
render t = collage 200 200 [ textForm "OMG"    ((sin t)*50,0)   |> rotate (t*2)
                           , textForm "HELLO!" (50,(sin t)*25)  |> rotate (0-t/4) ]
main = lift render (foldp (\t acc -> acc - (t/500)) 0 (fps 24))

