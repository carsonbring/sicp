;2024-08-29
#lang sicp

;;Draw the box-and-pointer representation and the memory-vector representation (as in figure
;; 5.14) of the list structure produced by

(define x (cons 1 2))
(define y (list x x))

;; with the free pointer initially p1. What is the final value of free ? What pointers represent the values of x and y ?

;----------- 0  1  2  3  4  5  6  7  8  9  10 
;the-cars          n1 n2    
;the-cdrs          p3 e0
