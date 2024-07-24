;2024-07-23
#lang sicp

(define (stream-limit s tolerance)
  (define tolerance (stream-cons (cons (- (stream-car s) (stream-car (stream-cdr tolerance))) (stream-car ))  (stream-filter (lambda (x) (>= tolerance (abs x)))) ))
  (stream-car tolerance))


(define (stream-limit-slow s tolerance)
  (let ((first (stream-car s))
        (scdr (stream-cdr s)))
        (let ((second (stream-car scdr)))
          (cond ((stream-null? scdr) (error "Nothing in stream satisfies tolerance"))
            ((>= tolerance (abs (- first second))) second)
             (else (stream-limit-slow scdr tolerance))))
          ) 
        )
  
