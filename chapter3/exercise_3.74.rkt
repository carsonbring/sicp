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
