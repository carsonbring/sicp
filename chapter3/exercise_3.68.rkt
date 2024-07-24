;2024-07-23
#lang sicp

;Louis Reasoner thinks that building a stream of pairs from three parts is unnecessarily complicated. Instead of separating the pair (S0,T0) from the rest of the pairs in the first row, he proposes to work with the whole first row, as follows:

(define (pairs s t)
  (interleave
   (stream-map (lambda (x) (list (stream-car s) x))
               t)
   (pairs (stream-cdr s) (stream-cdr t))))

;Does this work? Consider what happens if we evaluate (pairs integers integers) using Louis's definition of pairs.

;This will not work due to the fact that we will enter infinite recursion at (pairs (stream-cdr s) (stream-cdr t)). Interleave is not a special form like cons-stream is, meaning that the arguments would have to be fully evaluated before pairs was able to retreive anything. Putting interleave in the cdr of the cons-stream prevents this issue from happening. In the non-modified version of the pairs function, stream-cdr for both s and t would be completely evaluated and enter the interleave function by just returning another cons-stream with another delayed cdr. 
