;2024-07-30
#lang sicp

(define (ltr-list-of-values exps env)
  (if (no-operands? exps)
      '()
      (cons (eval (car exps) env)
            (ltr-list-of-values (cdr exps) env))))


(define (rtl-list-of-values exps env)
  (if (no-operands? exps)
      '()
      (append (rtl-list-of-values (cdr exps) env)
            (cons (eval (cdr exps) env) '()))))

