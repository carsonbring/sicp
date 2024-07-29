;2024-07-28
#lang sicp

(define (pairs s t)
  (cons-stream
   (list (stream-car s) (stream-car t))
   (interleave
    (stream-map (lambda (x) (list (stream-car s) x))
                (stream-cdr t))
    (pairs (stream-cdr s) (stream-cdr t)))))


(define (triples s t u)
  (cons-stream
   (list (stream-car s) (stream-car t) (stream-car u))
   (interleave
    (interleave
     (stream-map (lambda (x) (append (stream-car s) x ))
                 (pairs (stream-cdr t) (stream-cdr u)))
     (stream-map (lambda (x) (list (stream-car s) (stream-car t) x))
                 (stream-cdr u)))
    (pairs (stream-cdr s) (stream-cdr t) (stream-cdr u)))))

(define (square x) (* x x))
(define ones (cons-stream 1 ones))

(define integers  (cons-stream 1 (add-streams ones integers)))
(define triple (triples integers integers integers))
(define pythagorean-triples (stream-filter (lambda (trip) (if (= (+ (square (car trip)) (square (cadr trip)))
                                                                 (square (caddr trip))))) triple))
