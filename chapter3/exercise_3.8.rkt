;2024-07-14
#lang sicp

(define f   
  (let ((init 0)) 
    (lambda (x)  
      (set! init (- x init))  
      (- x init)))) 
