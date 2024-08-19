;2024-08-17
#lang sicp

(define (analyze-require exp)
  (let ((pproc (analyze (require-predicate exp))))
    (lambda (env succeed fail)
      (pproc env
             (lambda (pred-value fail2)
               (if (not (true? pproc))
                   (fail2)
                   (succeed 'ok fail2)))
             fail))))
