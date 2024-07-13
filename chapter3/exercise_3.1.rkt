;2024-07-12
#lang sicp

(define (make-accumulator value)
  (lambda (acc-by) (begin (set! value (+ value acc-by)) value)))

(define A (make-accumulator 5))
(display (A 10))

(newline)
(display (A 10))
