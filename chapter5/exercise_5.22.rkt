;; 2024-09-02
#lang sicp

; Exercise 3.12 of section 3.3.1 presented an append procedure that appends two lists to form a new list and an append! procedure that splices two lists together. Design a register machine to implement each of these procedures. Assume that the list-structure memory operations are available as primitive operations. 

(define (append! x y)
  (set-cdr! (last-pair x) y)
  x)
(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))


(controller
last-pair-start
 (assign val (op cdr) (reg x))
 (test (op null?) val)
 (goto (label pair-done))
 (assign x (reg val))
 (goto (label last-pair-start))
pair-done
 (assign val (op set-cdr!) (reg val) (reg y))
 ;;the appended list is in reg x
)
