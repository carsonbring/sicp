;2024-09-08
#lang sicp

For comparison with exercise 5.26, explore the behavior of the following procedure for computing
factorials recursively: 

(define (factorial n)
  (if (= n 1)
      1
      (* (factorial (- n 1)) n)))

;; By running this procedure with the monitored stack, determine, as a function of n, the maximum depth of the stack
;; and the total number of pushes used in evaluating n! for n > 1. (Again, these functions will be linear.) Summarize
;; your experiments by filling in the following table with the appropriate expressions in terms of n:

;;              Maximum depth   Number of pushes  
;;  Recursive   more             less                   
;;  factorial       
;;  Iterative    less              More
;;  factorial       

;; You get the idea

