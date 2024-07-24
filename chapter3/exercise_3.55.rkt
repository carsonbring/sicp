;2024-07-23
#lang sicp
(define (add-streams s1 s2)
  (stream-map + s1 s2))
(define ones (cons-stream 1 ones))
(define integers (cons-stream 1 (add-streams integers ones)))
(define (partial-sums s)
  (cons-stream (car s) (add-streams (partial-sums s)  (stream-cdr s) )))
