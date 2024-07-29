;2024-07-28
#lang sicp
(define (integral integrand initial-value dt)
  (define int
    (cons-stream initial-value
                 (add-streams (scale-stream integrand dt)
                              int)))
  int)
(define (RC r c dt)
  (define (sim-stream initial i)
   (add-stream (scale-stream i r) (integral (scale-stream i (/ 1 c)) intial dt)))
  sim-stream)
