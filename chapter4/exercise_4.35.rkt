;2024-08-10
#lang sicp

(define (an-integer-between low)
  (require (>= low high))
  (amb low (an-integer-between (+ low 1) high)))
  
