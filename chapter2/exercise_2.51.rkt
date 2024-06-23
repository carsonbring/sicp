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



(define (transform-painter painter origin corner1 corner2)
  (lambda (frame)
    (let ((m (frame-coord-map frame)))
      (let ((new-origin (m origin)))
        (painter
         (make-frame new-origin
                     (sub-vect (m corner1) new-origin)
                     (sub-vect (m corner2) new-origin)))))))


(define (flip-horiz painter)
  (transform-painter painter (make-vect 1 0) (make-vect 0 0) (make-vect 1 1)))

(define (rotate-cc-180 painter)
  (transform-painter painter (make-vect 1 1) (make-vect 0 1) (make-vect 1 0)))

(define (rotate-cc-270 painter)
  (transform-painter painter (make-vect 0 1) (make-vect 0 0) (make-vect 1 1)))


(define (below painter1 painter2)
  (let ((split-point (make-vect 0 0.5)))
    (let ((paint-top (transform-painter painter2 split-point (make-vect 0 0.5) (make-vect 1 0)))
	  (paint-bot (transform-painter painter1 (make-vect 0 0) (make-vect 1 0) split-point)))
      (lambda (frame)
	(paint-top frame)
	(paint-bot frame)))))

(define (beside painter1 painter2)
  (let ((split-point (make-vect 0.5 0.0)))
    (let ((paint-left
           (transform-painter painter1
                              (make-vect 0.0 0.0)
                              split-point
                              (make-vect 0.0 1.0)))
          (paint-right
           (transform-painter painter2
                              split-point
                              (make-vect 1.0 0.0)
                              (make-vect 0.5 1.0))))
      (lambda (frame)
        (paint-left frame)
        (paint-right frame)))))


(define (below2 painter1 painter2)
  (rotate-cc-270 (beside (transform-painter painter1 (make-vect 1 0) (make-vect 0 0) (make-vect 1 1)) (transform-painter painter2 (make-vect 1 0) (make-vect 0 0) (make-vect 1 1))))
  )
  
