;2024-09-15
#lang sicp

;; Exercise 5.36.  What order of evaluation does our compiler produce for operands of a combination? Is it
;; left-to-right, right-to-left, or some other order? Where in the compiler is this order determined? Modify the compiler
;; so that it produces some other order of evaluation. (See the discussion of order of evaluation for the explicit-control
;; evaluator in section 5.4.1.) How does changing the order of operand evaluation affect the efficiency of the code that
;; constructs the argument list? 

; Right to left because we reverse the operands in construct-arglist. To change to left-to right we simply do not reverse the arg order
