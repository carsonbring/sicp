;2024-07-21
#lang sicp

(define (averager a b c)
  (let ((u (make-connector)) (v (make-connector)))
     (adder a b u) 
     (multiplier v c u) 
     (constant 2 v) 
     'ok))
