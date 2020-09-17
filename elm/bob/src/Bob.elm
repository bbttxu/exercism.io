module Bob exposing (hey)
import String exposing (endsWith, toUpper)

hey : String -> String
hey remark =

    let
        isQuestion = endsWith "?" remark
        isYelled = toUpper remark == remark
        isNothing = remark == ""
    in
        if isNothing then "Fine. Be that way!"
        else if isQuestion then
            if isYelled then "Calm down, I know what I'm doing!"
            else "Sure."

        else if isYelled then "Whoa, chill out!"
        else "Whatever"
