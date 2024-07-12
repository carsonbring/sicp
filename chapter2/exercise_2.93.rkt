;2024-07-11
#lang sicp

;This does _NOT_ simplify the rational number, even though it should. In the next exercise i implement the modified (make-rat) function
(define p1 (make-poly 'x '((2 1)(0 1))))
(define p2 (make-poly 'x '((3 1)(0 1))))
(define rf (make-rat p2 p1))

(add rf rf)
