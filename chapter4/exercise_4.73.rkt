;2024-08-22
#lang sicp

;  Why does flatten-stream use delay explicitly? What would be wrong with defining it as follows: 

(define (flatten-stream stream)
  (if (stream-null? stream)
      the-empty-stream
      (interleave
       (stream-car stream)
       (flatten-stream (stream-cdr stream)))))
;thi sis the same reason as the previous. We need to allow for inifinite streams to be interleaved with eachother
