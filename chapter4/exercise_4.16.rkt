;2024-08-04
#lang sicp

(define (lookup-variable-value var env)
  (define (env-loop env)
    (define (scan vars vals)
      (cond ((null? vars)
             (env-loop (enclosing-environment env)))
            ((eq? var '*unassigned*) (error "Unassigned variable"))
            ((eq? var (car vars))
             (car vals))
            (else (scan (cdr vars) (cdr vals)))))
    (if (eq? env the-empty-environment)
        (error "Unbound variable" var)
        (let ((frame (first-frame env)))
          (scan (frame-variables frame)
                (frame-values frame)))))
  (env-loop env))


(define (scan-out-defines body)
  (define (body-iter section definitions nondefs)
    (cond ((null? section) (list definitions nondefs))
          ((eq? 'define (caar section) ) (body-iter (cdr section) (cons (car section) definitions) nondefs))
          (else (body-iter (cdr section) definitions (cons (car section) nondefs)))))
  (let ((def-blocks (body-iter body '() '())))
    (make-let (map (lambda (x) (list (caadr x) (make-lambda (caddr x)  (cdddr x)))) (car def-blocks))
              (cadr def-blocks))))
