#lang sicp


(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (car set)) true)
        ((< x (car set)) false)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
	((< x (car set)) (cons x set))
	(else (cons (car set) (adjoin-set x (cdr set))))))

(display (adjoin-set 0 (list 1 2 4 5)))
