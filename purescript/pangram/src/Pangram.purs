module Pangram
  ( isPangram
  ) where

import Data.Set (Set, fromFoldable, subset, empty)
import Data.String.CodeUnits (toCharArray)
import Data.String (toLower)

toSet :: String -> Set Char
toSet "" = empty
toSet string = fromFoldable ( toCharArray  string )

alphaset :: Set Char
alphaset = toSet "abcdefghijklmnopqrstuvwxyz"

isPangram :: String -> Boolean
isPangram "" = false
isPangram candidate = subset alphaset candidate'
  where
    candidate' = toSet (toLower candidate)