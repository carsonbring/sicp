;2024-07-23
#lang sicp

(define ones (cons-stream 1 ones))
(define integers (cons-stream 1 (add-streams integers ones)))
(define (mul-streams s1 s2)
  (stream-map * s1 s2))

(define factorials (cons-stream 1 (mul-streams factorials (stream-cdr integers))))
