; 2024-07-14
#lang sicp

(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define z (make-cycle (list 'a 'b 'c)))
;This causes infinite recursion due to the fact that make-cycle makes the last-pair point to the first cell of the list 
(last-pair z)

