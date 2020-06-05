module Isogram
  ( isIsogram
  ) where

import Data.Array (filter)
import Data.Char.Unicode (isLetter)
import Data.Set (fromFoldable, size)
import Data.String (Pattern(..), Replacement(..), length, replaceAll, toLower)
import Data.String.CodeUnits (toCharArray, fromCharArray)
import Prelude ((==), ($))

removeWhitespace :: String -> String
removeWhitespace = replaceAll (Pattern " " ) (Replacement "" )

filterLetters :: String -> String
filterLetters s = fromCharArray $ filter isLetter $ toCharArray s

sanitize :: String -> String
sanitize s = filterLetters $ toLower $ removeWhitespace s

isIsogram :: String -> Boolean
isIsogram input = inputSetSize == inputLength
  where
    input' = sanitize input
    inputSetSize = size $ fromFoldable $ toCharArray input'
    inputLength = length input'