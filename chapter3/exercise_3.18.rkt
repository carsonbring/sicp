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
  
(display (is-cycle? z))
(define x '(a))
(display (is-cycle? (list x 'a 'a 'b 'b x)))

