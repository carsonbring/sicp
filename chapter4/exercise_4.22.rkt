;2024-08-07
#lang sicp



(define (eval exp env)
  ((analyze exp) env))



(define (analyze exp)
  (cond ((self-evaluating? exp) 
         (analyze-self-evaluating exp))
        ((quoted? exp) (analyze-quoted exp))
        ((variable? exp) (analyze-variable exp))
        ((assignment? exp) (analyze-assignment exp))
        ((definition? exp) (analyze-definition exp))
        ((let? exp) (analyze-let exp))
        ((if? exp) (analyze-if exp))
        ((lambda? exp) (analyze-lambda exp))
        ((begin? exp) (analyze-sequence (begin-actions exp)))
        ((cond? exp) (analyze (cond->if exp)))
        ((application? exp) (analyze-application exp))
        (else
         (error "Unknown expression type -- ANALYZE" exp))))

(define (let-get-vars exp) (map car (cadr exp)))
(define (let-get-exp exp) (map cadr (cadr exp)))
(define (let-get-body exp) (caddr exp))
(define (let->combination exp)  (eval ((make-lambda (let-get-vars exp) (let-get-body exp)) (let-get-exp exp)) env))

(define (analyze-let exp)
  (let ((var (let-get-var exp))
        (exp (let-get-exp exp))
        (body (analyze-sequence (let-get-body exp))))
    (lambda (env) (make-application (make-procedure vars body env) (analyze-sequence exp)))))
