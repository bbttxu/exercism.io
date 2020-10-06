module SumOfMultiples exposing (sumOfMultiples)

import List exposing (range, filter, any, sum, map)

evenlyDivisible : Int -> Int -> Bool
evenlyDivisible a b = modBy b a == 0

evenlyDivisibles : List Int -> Int -> Bool
evenlyDivisibles ints int = any (evenlyDivisible int) ints


sumOfMultiples : List Int -> Int -> Int
sumOfMultiples divisors limit =

    let
        rangeUpToLimitExclusive = range 1 (limit - 1)
        naturalMultiples = filter (evenlyDivisibles divisors) rangeUpToLimitExclusive

    in
        sum naturalMultiples
