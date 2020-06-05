module Leap (isLeapYear ) where

import Data.Eq ( eq )
import Data.EuclideanRing ( mod )
import Data.HeytingAlgebra ( (&&) )

isDivisibleBy :: Int -> Int -> Boolean
isDivisibleBy denominator year = ( eq 0 ( mod year denominator ) )

isLeapYear :: Int -> Boolean
isLeapYear year = yearDivisibleBy4 && ( eq yearDivisibleBy100 yearDivisibleBy400)
    where
        yearDivisibleBy4 = isDivisibleBy 4 year
        yearDivisibleBy100 = isDivisibleBy 100 year
        yearDivisibleBy400 = isDivisibleBy 400 year

