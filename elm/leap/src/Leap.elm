module Leap exposing (isLeapYear)

isDivisibleBy : Int -> Int -> Bool
isDivisibleBy denominator year = modBy denominator year == 0

isLeapYear : Int -> Bool
isLeapYear year =
    let
        divisibleBy4 = isDivisibleBy 4 year
        divisibleBy100 = isDivisibleBy 100 year
        divisibleBy400 = isDivisibleBy 400 year
    in
        divisibleBy4 && ( divisibleBy100 == divisibleBy400 )
        
