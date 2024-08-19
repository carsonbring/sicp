;2024-08-18
#lang sicp
; Define rules to implement the last-pair operation of exercise 2.17, which returns a list
;; containing the last element of a nonempty list. Check your rules on queries such as (last-pair (3) ?x),
;; (last-pair (1 2 3) ?x), and (last-pair (2 ?x) (3)). Do your rules work correctly on queries such as (last-pair ?x (3)) ?
(rule (last-pair (?x) (?x)))
(rule (last-pair (?u . ?v) (?x))
      (last-pair (?v) (?x)))


; This will work with each of the given test cases because the base case rule says that if theres ever a list with the form of one element, then it will return that element in a list. Otherwise it will recursively iterate down the list by basically cdring with the recursive case that detects if there are more than one element in the list. 
