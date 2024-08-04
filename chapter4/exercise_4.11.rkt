;2024-08-04
#lang sicp


(define (make-frame vars vals)
  
  (define (iter vars vals frame)
    (cond ((null? vars) frame)
          (else (iter (cdr vars) (cdr vals) (cons (list (car vars) (car vals)) frame)))))
  (if (= (length vars) (length vals)) (iter vars vals '()) (error "Must have same amount of vals and vars")))
(define (frame-variables frame) (map car frame))
(define (frame-values frame) (map cadr frame))
(define (add-binding-to-frame! var val frame)
  (set-cdr! frame (cons (car frame) (cdr frame)))
  (set-car! frame  (list var val))
  
)

(define (extend-environment vars vals base-env)
  (if (= (length vars) (length vals))
      (cons (make-frame vars vals) base-env)
      (if (< (length vars) (length vals))
          (error "Too many arguments supplied" vars vals)
          (error "Too few arguments supplied" vars vals))))

(define frame '((var1 2) (var2 3)))
(add-binding-to-frame! 'var3 6 frame )
(display frame)

