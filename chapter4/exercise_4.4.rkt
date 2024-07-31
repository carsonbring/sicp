;2024-07-30
#lang sicp



(define (eval exp env)
  (cond ((self-evaluating? exp) exp)
        ((variable? exp) (lookup-variable-value exp env))
        ((quoted? exp) (text-of-quotation exp))
        ((and? exp) (eval-and exp))
        ((or? exp (eval-or exp)))
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

(define (or? exp)
  (tagged-list? exp 'or))


(define (and? exp)
  (tagged-list? exp 'and))

(define (eval-and exps env)
  (cond
      ((false? (eval (first-exp exps) env)) false)
      ((last-exp? exps) true)
      (else (eval-and (rest-exps exps) env))))


(define (eval-or exps env)
  (cond
      ((true? (eval (first-exp exps) env)) true)
      ((last-exp? exps) false)
      (else (eval-and (rest-exps exps) env))))
