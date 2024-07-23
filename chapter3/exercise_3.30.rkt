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

 (define (ripple-carry-adder a-list b-list s-list c) 
   (let ((c-list (map (lambda (x) (make-wire)) (cdr a-list))) 
         (c-0 (make-wire))) 
     (map full-adder 
          a-list 
          b-list 
          (append c-list (list c-0)) 
          s-list 
          (cons c c-list)) 
     'ok)) 
  
