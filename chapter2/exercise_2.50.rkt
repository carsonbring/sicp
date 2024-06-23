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

(define (make-segment v1 v2) (cons v1 v2))
(define (start-segment s) (car s))
(define (end-segment s) (cdr s))
;; this is just a hypothetical function. There is no implementation for this in the book.
(define (draw-line f s) f s)
(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
     (lambda (segment)
       (draw-line
        ((frame-coord-map frame) (start-segment segment))
        ((frame-coord-map frame) (end-segment segment))))
     segment-list)))

(define (frame->border frame)
  (let ((left-seg (make-segment (make-vect 0 0) (make-vect 0 1) ))
	(right-seg (make-segment (make-vect 1 0) (make-vect 1 1)))
	(top-seg (make-segment (make-vect 0 1) (make-vect 1 1)))
	(bot-seg (make-segment (make-vect 0 0) (make-vect 1 0))))
    ((segments->painter (list bot-seg top-seg right-seg left-seg)) frame)
    )
  )
;; I don't feel like drawing anything else right now, especially since the draw-line is hypothetical





