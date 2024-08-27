;2024-08-23
#lang sicp

;Use the register-machine language to describe the iterative factorial machine of exercise 5.1.


(define (factorial n)
  (define (iter product counter)
    (if (> counter n)
        product
        (iter (* counter product)
              (+ counter 1))))
  (iter 1 1))

(controller
 (assign p (const 1))
 (assign c (const 1))
test-counter
 (test (op >) (reg c) (reg n))
 (branch (label iter-done))
 (assign p (op *) (reg c) (reg p))
 (assign c (op +) (reg c) (const 1))
 (goto (label test-counter))
iter-done
 )
