module Triangle exposing (Triangle(..), triangleKind)

import List exposing (any, sum, sort, reverse)

import Set exposing (fromList, size)

type Triangle
    = Equilateral
    | Isosceles
    | Scalene

lessThanZero : number -> Bool
lessThanZero number = number <= 0

hasNegatives : List number -> Bool
hasNegatives = any lessThanZero

violatesInequality : List number -> Bool
violatesInequality list =
    let
        sorted = sort list |> reverse
    in
        case sorted of
            x::xs -> x > sum xs
            _ -> False

isDegenerate : List number -> Bool
isDegenerate list =
    let
        sorted = sort list |> reverse
    in
        case sorted of
            x::xs -> x == sum xs
            _ -> False

uniqueSides : List number -> Int
uniqueSides list = size <| fromList list

triangleKind : number -> number -> number -> Result String Triangle
triangleKind x y z =
    let
        list = [x, y, z]
    in
        if hasNegatives list then
            Result.Err "Invalid lengths"
        else if violatesInequality list then
            Result.Err "Violates inequality"
        else if isDegenerate list then
            Result.Err "Degenerate Triangle"
        else
            case uniqueSides list of
                1 -> Result.Ok Equilateral
                2 -> Result.Ok Isosceles
                3 -> Result.Ok Scalene
                _ -> Result.Err "Sorry, I don't know how to handle that."
