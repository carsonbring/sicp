;2024-08-21
#lang sicp

;;  What is the purpose of the let bindings in the procedures add-assertion! and add-rule! ? What
;; would be wrong with the following implementation of add-assertion! ? Hint: Recall the definition of the infinite stream of ones in section 3.5.2: (define ones (cons-stream 1 ones)).

(define (add-assertion! assertion)
  (store-assertion-in-index assertion)
  (set! THE-ASSERTIONS
        (cons-stream assertion THE-ASSERTIONS))
  'ok)

;Since set! acts like define, if we were to compare the stream of ones from 3.5.2, we would have a stream full of that one assertion since everytime the stream-cdr is forced, we would get (cons-stream assertion THE-ASSERTIONS) and the newly added assertion would be the car of the stream-cdr

