;2024-07-23
#lang sicp

;In order to take a closer look at delayed evaluation, we will use the following procedure, which simply returns its argument after printing it:

(define (show x)
  (display-line x)
  x)

;What does the interpreter print in response to evaluating each expression in the following sequence?59

(define x (stream-map show (stream-enumerate-interval 0 10)))
(stream-ref x 5)
(stream-ref x 7)

;It should print out 5 and 7.


