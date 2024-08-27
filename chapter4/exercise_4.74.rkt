;2024-08-22
#lang sicp

;; Alyssa P. Hacker proposes to use a simpler version of stream-flatmap in negate, lisp-value, and
;; find-assertions. She observes that the procedure that is mapped over the frame stream in these cases always
;; produces either the empty stream or a singleton stream, so no interleaving is needed when combining these
;; streams.

;a. Fill in the missing expressions in Alyssa's program. 

(define (simple-stream-flatmap proc s)
  (simple-flatten (stream-map proc s)))

 (define (simple-flatten stream) 
    (stream-map stream-car    
                          (stream-filter (lambda (s) (not (stream-null? s))) stream))) 

;b. Does the query system's behavior change if we change it in this way?

;no it wont
