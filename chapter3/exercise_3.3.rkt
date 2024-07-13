;2024-07-12
#lang sicp


(define (make-account balance secret-password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch pass m)
    (if (eq? secret-password pass)
        (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknown request -- MAKE-ACCOUNT"
                       m)))
          (begin (display "Incorrect Password") (lambda (x) ""))))
  dispatch)

(define bank (make-account 100 'thuck))

(display ((bank 'thuck 'deposit) 10))
(newline)
(display ((bank 'funny 'withdraw) 10))
(newline)
(display ((bank 'thuck 'withdraw) 10))
