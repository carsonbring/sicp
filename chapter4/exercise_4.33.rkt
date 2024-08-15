;2024-08-09
#lang sicp

(define (text-of-quoted expr env)
  (let ((text (cadr expr)))
    (if (pair? text)
        (evaln (make-list text env) env)
        text)))

(define (make-list text)
  (if (null? text)
      (list 'quote '())
      (list 'cons (list 'quote (car text))
            (make-list (cdr text)))))
