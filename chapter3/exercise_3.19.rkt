; 2024-07-14
#lang sicp

(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define z (make-cycle (list 'a 'b 'c)))
;This causes infinite recursion due to the fact that make-cycle makes the last-pair point to the first cell of the list
(define (reverse-list x)
  (define (loop x y)
    (if (null? x)
        y
        (let ((temp (cdr x)))
          (set-cdr! x y)
          (loop temp x))))
  (loop x '()))

(define (is-cycle? x)
  (let ((encountered '()))
    (define (dispatch x)
      (set! encountered (cons x encountered))
      (cond ((not (pair? x)) #f)
            ((null? (cdr x)) #f)
            ((memq (cdr x) encountered) #t)
            (else (dispatch (cdr x)))))
   
  (dispatch x)))
;;I had to cheat for this one but this is so clever and cool.
; Its called Floyd's Tortoise and Hare algorithm since b (the hare) will always be set to null if the list is not cyclical, but if it is it will catch up to the a (the tortoise). Apparently its used a lot in interview questions so it will be nice to know from now on. 
(define (is-cycle-linear? x)
  (define (check-cdr x)
    (if (pair? x)
        (cdr x)
        '()))
  (define (iter a b)
    (cond ((not (pair? a)) #f)
          ((not (pair? b)) #f)
          ((eq? a b) #t)
          ((eq? a (check-cdr b)) #t)
          (else (iter (check-cdr a) (check-cdr (check-cdr b))))))
  (iter (check-cdr x) (check-cdr (check-cdr x))))
(define l '(1 2 3))
(display (is-cycle-linear? (make-cycle l)))
;(display (is-cycle? z))
(define x '(a))
;(display (is-cycle? (list x 'a 'a 'b 'b x)))


