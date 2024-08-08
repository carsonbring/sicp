;2024-08-08
#lang sicp

;Exhibit a program that you would expect to run much more slowly without memoization than with memoization. Also, consider the following interaction, where the id procedure is defined as in exercise 4.27 and count starts at 0:

;A simple factorial program would be much slower without memoization
(define (factorial n)
  (if (<= n 1) 1 (* n (factorial (- n 1)))))

(define (square x)
  (* x x))
;;; L-Eval input:
(square (id 10))
;;; L-Eval value:
100
;;; L-Eval input:
count
;;; L-Eval value:
2 (without mem)
1 (with mem)
