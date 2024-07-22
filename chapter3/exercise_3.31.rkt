;2024-07-21
#lang sicp
(define (accept-action-procedure! proc)
  (set! action-procedures (cons proc action-procedures)))

;; The reason accept action procedure cannot be defined like this is because the bits in the wire chain will not be updated if the procedure isn't executed. The propogate procedure will not have the updated wire charges based on the new procedure added 
