;2024-08-19
#lang sicp

;Define rules to implement the reverse operation of exercise 2.18, which returns a list containing
;; the same elements as a given list in reverse order. (Hint: Use append-to-form.) Can your rules answer both
;; (reverse (1 2 3) ?x) and (reverse ?x (1 2 3)) ?


(rule (append-to-form () ?y ?y))
(rule (append-to-form (?u . ?v) ?y (?u . ?z))
      (append-to-form ?v ?y ?z))

(rule (reverse () ()))
(rule (reverse (?u . ?v) ?z)
      (and (append-to-form ?x (?u) ?z)
           (reverse ?v ?x)))

; reverse the append to form and reverse statements to get the answer to the other reverse proposed in the problem
