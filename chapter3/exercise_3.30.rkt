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
;;Still working onthis one
(define (ripple-carry-adder a-list b-list s-list carry)
  (let ((new-a (car a-list)) (new-b (car a-list)) (new-s (make-wire)) (carry-b (make-wire)) (new-carry (make-wire)) (not-a (make-wire)) (not-b (make-wire)) (d (make-wire)) (e (make-wire)))
    (if (null? a-list)
        
    (if (= (get-signal carry) 1) (inverter new-b carry-b) (set-signal! carry-b (get-signal new-b)))
    (and-gate new-a carry-b new-carry)
    (inverter new-a not-a)
    (inverter carry-b not-b)
    (and-gate new-a not-b d)
    (and-gate carry-b not-a e)
    (or-gate d e new-s)
    
    
    
    
    )
  )
