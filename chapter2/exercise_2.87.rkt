;2024-07-11
#lang sicp

;; install these in generic arithmetic package
(define (=zer0?-poly poly ) (if (empty-termlist? (term-list poly) ) #t #f ) )
(put '=zero? 'polynomail =zer0?-poly)


(define (=zero? num)
  ((get '=zero? (type-tag num) ) num))
