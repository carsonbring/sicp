;2024-08-26
#lang sicp
;; Design a new syntax for register-machine instructions and modify the simulator to use your new
;; syntax. Can you implement your new syntax without changing any part of the simulator except the syntax
;; procedures in this section?


(define (operation-exp? exp) 
   (tagged-list? exp 'apply)) 
 (define (operation-exp-op exp) 
   (cadr exp)) 
 (define (operation-exp-operands exp) 
   (cddr exp)) 
