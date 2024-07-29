;2024-07-28
#lang sicp


(define (stream-map proc . argstreams)
  (if (stream-null? (car argstreams))
      the-empty-stream
      (cons-stream
       (apply proc (map stream-car argstreams))
       (apply stream-map
              (cons proc (map stream-cdr argstreams))))))

(define zero-crossings
  (stream-map sign-change-detector sense-data (cons-stream 0 sense-data)))

(define (smooth s)
  (define (smooth-stream s last-value)
    (cons-stream (/ (+ (stream-car s) last-value) 2)
                 (smooth-stream (stream-cdr s) (stream-car s))))
  (smooth-stream (stream-cdr s) (stream-car s)))

(define (make-zero-crossings input-stream)
  (let ((avpt-stream (smooth input-stream)))
    (define (make-stream avpt-stream last-avpt)
      (cons-stream (sign-change-detector (car avpt-stream) last-avpt)
                   (make-stream (cdr avpt-stream)
                                (car avpt-stream))))
    (make-stream (cdr avpt-stream) (car avpt-stream))))
