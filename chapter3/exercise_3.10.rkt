;2024-07-14
#lang sicp
;I'm not going to draw graphs again but I will explain how the env structures differ for the two versions of make-withdraw (both of which behave the same)

; The old env structure for this function is specified in the book
; For this structure, for every old-make-withdraw assignment to a variable, a new environment is created
; This environment holds the balance variable in the environment and is subject to change when making a function call on the resulting defined variable
(define (old-make-withdraw balance)
  (lambda (amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds")))

; Since (let ((var expr)) <body>) is the same as ((lambda (var) <body>) expr) and the initial amount is passed in as an argument to the make-withdraw function...
; The function is returning two nested lambda functions as the return from the make function, meaning that the iner lambda function (the one that takes in the amount to be withdrawn) modifies the argument that is passed in as the balance.
; This results in two different frames (environments) being generated on one function call to the defined withdrawl value since the outer lambda has the value initial-amount and the inner has the balance variable in its frame.
; This just results in a redundant frame, similar to the redundancy of the outer lambda expression. 
(define (new-make-withdraw initial-amount)
  (let ((balance initial-amount))
    (lambda (amount)
      (if (>= balance amount)
          (begin (set! balance (- balance amount))
                 balance)
          "Insufficient funds"))))
