#lang sicp

(define (equal? a b)
  (cond ((and (not (pair? a)) (not (pair? b))) (eq? a b))
	((and (pair? a) (pair? b)) (and (equal? (car a) (car b)) (equal? (cdr a) (cdr b))))
	(else #f)))

(equal? '(a (b c) c) '(a (b c d) c))
(newline)
;; #f
(equal? '(a (b (c d)) c) '(a (b (c d)) c))
;; #t
