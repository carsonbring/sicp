;2024-07-14
#lang sicp
; Working count-pairs

(define (count-pairs x)
  (let ((counted '()))
    (define (dispatch x )
    (display "COUNTED: ")
    (display counted)
    (newline)
    (cond
      ((null? x) 0)
      ((or (not (pair? x)) (memq x counted)) 0)
      (else
       (begin
         (set! counted (cons x counted))
         (+ (dispatch (car x))
            (dispatch (cdr x))
            1))))) (dispatch x)))
(define tlist1 '(1 2 (2 3)))
(display (count-pairs tlist1))
(newline)
(define x '(a)) 
(define y (cons x x)) 
(define ex2 (list y))
(display (count-pairs ex2))
(newline)


