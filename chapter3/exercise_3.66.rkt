;2024-07-23
#lang sicp

;Examine the stream (pairs integers integers). Can you make any general comments about the order in which the pairs are placed into the stream? For example, about how many pairs precede the pair (1,100)? the pair (99,100)? the pair (100,100)? (If you can make precise mathematical statements here, all the better. But feel free to give more qualitative answers if you find yourself getting bogged down.)

(define (pairs s t)
  (cons-stream
   (list (stream-car s) (stream-car t))
   (interleave
    (stream-map (lambda (x) (list (stream-car s) x))
                (stream-cdr t))
    (pairs (stream-cdr s) (stream-cdr t)))))

; The number of pairs that should precede the pair (1,100) would be around double 100 = 200 due to the fact that the stream-map parameter of the interleave function should include the (1, n) in half of the pairs entered into the initial stream. The pair (99,100) and (100,100) would take significantly longer to be added to the list due to the fact that for every increase in the s position - (s t) - it will take double the time to add that a new addition in comparison to the previous s. 
