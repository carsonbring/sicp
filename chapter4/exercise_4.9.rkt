;2024-08-03
#lang sicp

(define (make-for-loop body n) '('for body n))
(define (body-for-loop loop) (cadr loop))
(define (n-for-loop loop) (caddr loop))
(define (eval-for-loop loop env)
  (define (iter n)
    (if (>= n 0) (begin (iter (- n 1)) (eval (body-for-loop loop) env)) (eval (body-for-loop loop) env)))
  (iter (n-for-loop loop)))



(define (eval exp env)
  (cond ((self-evaluating? exp) exp)
        ((variable? exp) (lookup-variable-value exp env))
        ((quoted? exp) (text-of-quotation exp))
        ((assignment? exp) (eval-assignment exp env))
        ((definition? exp) (eval-definition exp env))
        ((if? exp) (eval-if exp env))
        ((lambda? exp)
         (make-procedure (lambda-parameters exp)
                         (lambda-body exp)
                         env))
        ((begin? exp) 
         (eval-sequence (begin-actions exp) env))
        ((cond? exp) (eval (cond->if exp) env))
        ((application? exp)
         (apply (eval (operator exp) env)
                (list-of-values (operands exp) env)))
        (else
         (error "Unknown expression type -- EVAL" exp))))

