;2024-07-14
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

(define (make-joint orig-account orig-password new-password)
  (define (dispatch pass m)
  (if (eq? new-password pass)
      (cond ((eq? m 'deposit) (orig-account orig-password 'deposit))
            ((eq? m 'withdraw) (orig-account orig-password 'withdraw))
            (else (error "Unknown request -- MAKE-JOINT" m)))
      (begin (display "Incorrect Joint Password") (lambda (x) "")))
    )
  dispatch)
(define bank (make-account 100 'thuck))
(define joint-bank (make-joint bank 'thuck 'lisp))
(display ((bank 'thuck 'deposit) 10))
(newline)
(display ((joint-bank 'lisp 'withdraw) 110))


