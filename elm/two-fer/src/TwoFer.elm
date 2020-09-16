module TwoFer exposing (twoFer)

import Maybe exposing (withDefault)

twoFer : Maybe String -> String
twoFer input = "One for " ++ withDefault "you" input ++ ", one for me."

    