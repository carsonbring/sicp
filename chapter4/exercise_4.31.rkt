;2024-08-09
#lang sicp


(define (old-apply procedure arguments)
  (cond ((primitive-procedure? procedure)
         (apply-primitive-procedure procedure arguments))
        ((compound-procedure? procedure)
         (eval-sequence
           (procedure-body procedure)
           (extend-environment
             (procedure-parameters procedure)
             arguments
             (procedure-environment procedure))))
        (else
         (error
          "Unknown procedure type -- APPLY" procedure))))



(define (apply procedure arguments env)
  (cond ((primitive-procedure? procedure)
         (apply-primitive-procedure procedure arguments))
        ((compound-procedure? procedure)
         (eval-compound-procedure procedure arguments env))
        (else
         (error
          "Unknown procedure type -- APPLY" procedure))))

(define (eval-compound-procedure procedure procedure-args procedure-env)
  (define (arg-iter formal-args actual-args)
    (if (null? formal-args)
        '()
        (cons (let ((current (car formal-args)))
                (if (and (pair? (cdr current)) (pair? current) (eq? (cadr current) 'lazy))
                    (delay-it (car actual-args) procedure-env)
                    (actual-args (car actual-args) procedure-env)))
              (arg-iter (cdr formal-args) (cdr actual-args)))))
  (define (procedure-arg-names parameters)
    (map (lambda (x) (if (pair? x) (car x) x)) parameters))
  (eval-sequence
   (procedure-body procedure)
   (extend-environment
    (procedure-arg-names (procedure-parameters procedure))
    (arg-iter (procedure-parameters procedure) procedure-args)
    (procedure-environment procedure))))
