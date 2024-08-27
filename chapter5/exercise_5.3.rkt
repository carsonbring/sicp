;2024-08-23
#lang sicp
; Design a machine to compute square roots using Newton's method, as described in section 1.1.7:

(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))

(controller
 gcd-loop
 (assign x (op read))
 (assign g (const 1.0))
 sqrt-iter
 (test (op good-enough?) (reg g))
 (branch (label sqrt-done))
 (assign t (op /) (reg x) (reg g))
 (assign t2 (op +) (reg g) (reg t))
 (assign g (op /) (reg t2) (const 2))
 (goto (label sqrt-iter))
 
 sqrt-done
 (perform (op print) (reg g))
 (goto (label gcd-loop))
 )
