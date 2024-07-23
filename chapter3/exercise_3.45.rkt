;2024-07-22
#lang sicp

;Louis Reasoner thinks our bank-account system is unnecessarily complex and error-prone now that deposits and withdrawals aren't automatically serialized. He suggests that make-account-and-serializer should have exported the serializer (for use by such procedures as serialized-exchange) in addition to (rather than instead of) using it to serialize accounts and deposits as make-account did. He proposes to redefine accounts as follows:

(define (make-account-and-serializer balance)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (let ((balance-serializer (make-serializer)))
    (define (dispatch m)
      (cond ((eq? m 'withdraw) (balance-serializer withdraw))
            ((eq? m 'deposit) (balance-serializer deposit))
            ((eq? m 'balance) balance)
            ((eq? m 'serializer) balance-serializer)
            (else (error "Unknown request -- MAKE-ACCOUNT"
                         m))))
    dispatch))

;Then deposits are handled as with the original make-account:

(define (deposit account amount)
 ((account 'deposit) amount))

;Explain what is wrong with Louis's reasoning. In particular, consider what happens when serialized-exchange is called.

;This is an issue due to the fact that the withdrawl and deposit methods in the exahnge function would NOT be able to be ran simply because of the fact that the same serializer is used on the exchange methods. By definition, the serialized function (withdrawl or deposit) cannot run until the exchange method is complete, since the the function is serialized. This would lead to a catastrophic failure where the exchange method would halt and not be able to be complete. 
