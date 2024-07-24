;2024-07-23
#lang sicp

;Give an interpretation of the stream computed by the following procedure:

(define (expand num den radix)
  (cons-stream
   (quotient (* num radix) den)
   (expand (remainder (* num radix) den) den radix)))

;(Quotient is a primitive that returns the integer quotient of two integers.) What are the successive elements produced by (expand 1 7 10) ? What is produced by (expand 3 8 10) ?

(expand 1 7 10)

; ( 1  4 2 8 5 ...)
; 1/7 = .14285~
; ( 3 7 5 0 )
; 3/8 = .375
; Expand returns the floating point representation of num/den in base radix. 
