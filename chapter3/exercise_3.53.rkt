;2024-07-23
#lang sicp
;Without running the program, describe the elements of the stream defined by

(define s (cons-stream 1 (add-streams s s)))

; This would be a stream where each index would be 2^i
