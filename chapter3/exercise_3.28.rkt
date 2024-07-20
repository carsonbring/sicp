;2024-07-20
#lang sicp

(define (make-wire signal action) (cons signal action))
(define (get-signal wire) (car wire) )
(define (set-signal! wire new-signal) (set-car! wire new-signal))
(define (add-action! wire action) (set-cdr! wire action))
;;Hasn't shown how to implement after-delay yet!
(define (logical-or a1 a2)
  (if (or (= a1 1) (= a2 1 ) ) #t #f))

(define (or-gate a1 a2 output)
  (define (or-action-procedure)
    (let ((new-value
           (logical-or (get-signal a1) (get-signal a2))))
      (after-delay and-gate-delay
                   (lambda ()
                     (set-signal! output new-value)))))
  (add-action! a1 or-action-procedure)
  (add-action! a2 or-action-procedure)
  'ok)
