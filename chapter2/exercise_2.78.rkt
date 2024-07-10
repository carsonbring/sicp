; 2024-07-09
#lang sicp

(define (attach-tag type-tag contents)
  (if (number? (car contents)) contents (cons type-tag contents)))

(define (type-tag datum) 
   (cond ((number? datum) 'scheme-number) 
         ((pair? datum) (car datum)) 
         (else (error "Wrong datum -- TYPE-TAG" datum)))) 

(define (contents datum)
  (cond ((number? (car datum) datum))
    ((pair? datum) (cdr datum))
    (else (error "Bad tagged datum -- CONTENTS" datum))))
