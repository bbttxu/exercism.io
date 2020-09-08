module RNATranscription ( toRNA, transcribe ) where

import Prelude 

import Data.Foldable (any)
import Data.Maybe (Maybe(..), isNothing, fromMaybe)
import Data.String.CodeUnits (fromCharArray, toCharArray)

transcribe :: Char -> Maybe Char
transcribe 'G' = Just 'C'
transcribe 'C' = Just 'G'
transcribe 'T' = Just 'A'
transcribe 'A' = Just 'U'
transcribe _ = Nothing

justChar :: Maybe Char -> Char
justChar = fromMaybe 'a'

isValid :: Array Char -> Maybe String
isValid chars | any isNothing $ map transcribe chars = Nothing
              | otherwise = Just $ fromCharArray $ map justChar $ map transcribe chars
                
toRNA :: String -> Maybe String
toRNA "" = Nothing
toRNA dna = isValid sequence'
    where sequence' = toCharArray dna
