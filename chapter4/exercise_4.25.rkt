;2024-08-08
#lang sicp

(define (unless condition usual-value exceptional-value)
  (if condition exceptional-value usual-value))



(define (factorial n)
  (unless (= n 1)
          (* n (factorial (- n 1)))
          1))

(display (factorial 5))
;This function halts since scheme is an applicative order language and factorial tries to evaluate factorial(- n 1) before it passes into unless due to the fact that n isn't one. Because of this, it isn't able able to enter the original unless because factorial 4 also needs to enter the ensure, which eventually leads to factorial 1. Since factorial 1 is one, it should return one, but because all of the arguments need to be evaluated before applied in the unless funciton, factorial 0 is attempted to be calculated instead of just returning one and then that keeps repeating in the negative numbers. 
