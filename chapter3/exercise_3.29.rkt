;2024-07-20
#lang sicp
(define (logical-or a1 a2)
  (if (or (= a1 1) (= a2 1 ) ) #t #f))


(define (make-wire signal action) (cons signal action))
(define (get-signal wire) (car wire) )
(define (set-signal! wire new-signal) (set-car! wire new-signal))
(define (add-action! wire action) (set-cdr! wire action))

(define (inverter input output)
  (define (invert-input)
    (let ((new-value (logical-not (get-signal input))))
      (after-delay inverter-delay
                   (lambda ()
                     (set-signal! output new-value)))))
  (add-action! input invert-input)
  'ok)


(define (logical-not s)
  (cond ((= s 0) 1)
        ((= s 1) 0)
        (else (error "Invalid signal" s))))


(define (and-gate a1 a2 output)
  (define (and-action-procedure)
    (let ((new-value
           (logical-and (get-signal a1) (get-signal a2))))
      (after-delay and-gate-delay
                   (lambda ()
                     (set-signal! output new-value)))))
  (add-action! a1 and-action-procedure)
  (add-action! a2 and-action-procedure)
  'ok)

(define (logical-and a1 a2)
  (if (and (= a1 1) (= a2 1)) #t #f ))
;; Time to complete 3(inverter-delay) + 1 (and-gate-delay) 
(define (or-gate a b output)
  (let ((d (make-wire)) (e (make-wire)) (f (make-wire)) )
    (inverter a d)
    (inverter b e)
    (and-sign d e f)
    (inverter f output)
    
    
    'ok)
  )

(define (logical-or-2 a1 a2)
  (if (not (and (not a1) (not a2))) #t #f))
