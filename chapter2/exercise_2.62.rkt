;; 2024-07-02
;; theta(n) implementation for union set given ordered lists.
#lang sicp


(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (car set)) true)
        ((< x (car set)) false)
        (else (element-of-set? x (cdr set)))))

(define (union-set set1 set2)
  (cond ((null? set1) set2)
	((null? set2) set1)
	((= (car set1) (car set2)) (union-set (cdr set1) set2))
	((> (car set1) (car set2)) (cons (car set2) (union-set set1 (cdr set2))))
	(else (cons (car set1) (union-set (cdr set1) set2)))))

(display (union-set (list 0 1 10) (list 3 5 6 7 9)))
