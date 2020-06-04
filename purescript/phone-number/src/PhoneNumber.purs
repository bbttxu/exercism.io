module PhoneNumber
    ( phoneNumber
    )
    where


import Data.Maybe

import Data.Array (takeEnd, filter)
import Data.String (length)
import Data.String.Utils (startsWith)
import Data.String.CodeUnits (fromCharArray, toCharArray, charAt)
import Data.Char.Unicode (isDigit)

takeLast :: Int -> String -> String
takeLast int string = fromCharArray ( takeEnd int ( toCharArray string  ) )

validateNANP :: String -> Maybe String
validateNANP userPhone = case charAt 0 userPhone of
    Just '0' -> Nothing
    Just '1' -> Nothing
    _ -> case charAt 3 userPhone of
        Just '0' -> Nothing
        Just '1' -> Nothing
        _ -> Just userPhone

phoneNumber :: String -> Maybe String
phoneNumber "" = Nothing
phoneNumber userPhone = case length userPhone' of
    10 -> validateNANP userPhone'

    11 -> case startsWith "1" userPhone' of
        true -> validateNANP userPhone''
        false -> Nothing

    _ -> Nothing

    where
        userPhone' = fromCharArray ( filter isDigit ( toCharArray userPhone ) )
        userPhone'' = takeLast 10 userPhone'
