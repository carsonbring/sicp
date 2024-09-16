;; 2024-09-15
#lang sicp

;; Exercise 5.34.  Compile the iterative factorial procedure 

(define (factorial n)
  (define (iter product counter)
    (if (> counter n)
        product
        (iter (* counter product) ; this uses tail secursion so it runs in constant stack space
              (+ counter 1)))) 
  (iter 1 1))

(define (factorial-alt n)
  (if (= n 1)
      1
      (* n (factorial-alt (- n 1))))) ;; This increases the stack size because it needs to restore  and save n 


;; Annotate the resulting code, showing the essential difference between the code for iterative and recursive versions
;; of factorial that makes one process build up stack space and the other run in constant stack space. 
