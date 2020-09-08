module TwoFer exposing (twoFer)

twoFer : Maybe String -> String
twoFer input =
    let 
        output = 
            case input of
                Just name -> name
                _ -> "you"

    in "One for " ++ output ++ ", one for me."

    