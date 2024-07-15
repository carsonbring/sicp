;2024-07-14
#lang sicp
;This procedure reverses a list by taking the initial list x and using the inner function  (loop) with the inital arguments x and ()' to set the cdr of x to y, which reverses the list
(define (reverse-list x)
  (define (loop x y)
    (if (null? x)
        y
        (let ((temp (cdr x)))
          (set-cdr! x y)
          (loop temp x))))
  (loop x '()))

(define v (list 'a 'b 'c 'd))

(display (reverse-list v))
