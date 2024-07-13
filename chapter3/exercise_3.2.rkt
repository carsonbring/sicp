; 2024-07-12
#lang sicp

(define (make-monitored f)
  (let ((num-calls 0))
    (define (increment-calls)
      (set! num-calls (+ num-calls 1)))
    (define (reset-counter)
      (set! num-calls 0))
    (define (how-many-calls?)
      num-calls)
    (define (dispatch m)
      (cond ((eq? m 'how-many-calls?) (how-many-calls?))
            ((eq? m 'reset-count) (begin (reset-counter) num-calls))
            (else (begin (increment-calls) (f m))))) dispatch))

(define s (make-monitored sqrt))

(display (s 100))
(newline)

(display (s 144))
(newline)
(display (s 'how-many-calls?))
