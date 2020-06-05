module Bob ( hey ) where

import Prelude
import Data.BooleanAlgebra (class BooleanAlgebra)
import Data.String.Utils (endsWith)

isAQuestion :: String -> Boolean
isAQuestion sentence = endsWith "?" sentence

isSilentMusing :: String -> Boolean
isSilentMusing sentence = sentence == ""

areTheyShoutingAtMe :: String -> Boolean
areTheyShoutingAtMe sentence = sentence == ""

hey :: String -> String
hey message
  | isAQuestion message = "Sure."
  | isSilentMusing message = "Fine. Be that way!"
  | areTheyShoutingAtMe message = "Whoachill out!"
  | otherwise = "Whatever."
