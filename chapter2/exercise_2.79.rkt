; 2024-07-09
#lang sicp
(define (type-tag datum) 
   (cond ((number? datum) 'scheme-number) 
         ((pair? datum) (car datum)) 
         (else (error "Wrong datum -- TYPE-TAG" datum)))) 

(define (equ? num1 num2)
  ((get 'equ? 'generic) num1 num2))

(define (install-generic-package)
  (define (equ? num1 num2) (=zero? (sub num1 num2)))
  (put 'equ? 'generic equ?) 'done)

