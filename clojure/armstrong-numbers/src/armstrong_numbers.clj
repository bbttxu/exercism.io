(ns armstrong-numbers)

(defn exp-better [x n]
  ( <= n 0 )
  0 ;; probably not a good default 
  (reduce * (repeat n x)))
  
(defn armstrong? [num] ;; <- arglist goes here
  ;; your code goes here

  ;; n: the lenght of the num string
  (def n ( count( str num )))

  ;; digits: list of string values
  (def digits (map read-string (str/split (str num) #"")))

  (defn exp-count [x]
    (exp-better x n)
  )

  (def exponents (map exp-count digits))

  (def sums (reduce + exponents))

  ( = num sums )
)