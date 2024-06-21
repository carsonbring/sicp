#lang sicp
(#%require sicp-pict)
(define (make-vect x y)
  (cons x y)
  )
(define (xcor-vect v) (car v))
(define (ycor-vect v) (cdr v))

(define (add-vect v1 v2)
  (make-vect (+ (xcor-vect v1) (xcor-vect v2)) (+ (ycor-vect v1) (ycor-vect v2))))

(define (sub-vect v1 v2)
  (make-vect (- (xcor-vect v1) (xcor-vect v2)) (- (ycor-vect v1) (ycor-vect v2))))

(define (scale-vect s v)
  (make-vect (* s (xcor-vect v)) (* s (ycor-vect v))))

(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (make-frame2 origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin-frame f) (car f))
(define (edge1-frame f) (cadr f))
(define (edge2-frame f) (cadr (cdr f)))
(define (edge1-frame2 f) (cadr f))
(define (edge2-frame2 f) (cdr (cdr f)))
(let ((test-frame (make-frame2 (make-vect 0 1) (make-vect 1 3) (make-vect 3 1))))
  (display  (edge1-frame test-frame))
  (newline)
  (display  (edge2-frame2 test-frame))
)
