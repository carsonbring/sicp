;2024-07-30
#lang sicp

(define (cond? exp) (tagged-list? exp 'cond))
(define (cond-clauses exp) (cdr exp))
(define (cond-else-clause? clause)
  (eq? (cond-predicate clause) 'else))
(define (if-recipient? clause) (eq? (cadr clause) '=>))
(define (cond-predicate clause) (car clause))
(define (cond-actions clause)  (cdr clause))
(define (cond->if exp)
  (expand-clauses (cond-clauses exp)))

(define (expand-clauses clauses)
  (if (null? clauses)
      'false                          ; no else clause
      (let ((first (car clauses))
            (rest (cdr clauses)))
        (cond ((cond-else-clause? first)
            (if (null? rest)
                (sequence->exp (cond-actions first))
                (error "ELSE clause isn't last -- COND->IF"
                       clauses)))
              ((if-recipient? first)
               (let ((predicate-evaled (eval ()))))
               )
              (else (make-if (cond-predicate first)
                       (sequence->exp (cond-actions first))
                       (expand-clauses rest)))))))
