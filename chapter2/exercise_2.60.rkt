#lang sicp

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (cons x set))

(define (no-repeat-set set)
  (cond ((null? set) '())
	((element-of-set? (car set) (cdr set)) (no-repeat-set (cdr set)))
	(else (cons (car set) (no-repeat-set (cdr set)))))
  )

(define (intersection-set origset1 origset2)
  (let ((set1 (no-repeat-set origset1)) (set2 (no-repeat-set origset2)))
    (cond ((or (null? set1) (null? set2)) '())
          ((element-of-set? (car set1) set2)        
           (cons (car set1)
		 (intersection-set (cdr set1) set2)))
          (else (intersection-set (cdr set1) set2))))
)
(define (union-set origset1 origset2)
  (let ((set1 (no-repeat-set origset1)) (set2 (no-repeat-set origset2)))
    (cond ((null? set1) set2)
	  ((null? set2) set1)
	  ((element-of-set? (car set1) set2) (union-set (cdr set1)  set2))
	  (else (cons (car set1) (union-set (cdr set1) set2)))))
)

(display (intersection-set (list 2 3 4 1 2 2 3 ) (list 2 3 55 5 2 2 )))
