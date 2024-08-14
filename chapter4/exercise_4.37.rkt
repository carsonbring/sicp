;2024-08-11
#lang sicp

;Ben Bitdiddle claims that the following method for generating Pythagorean triples is more efficient than the one in exercise 4.35. Is he correct? (Hint: Consider the number of possibilities that must be explored.)

(define (a-pythagorean-triple-between low high)
  (let ((i (an-integer-between low high))
        (hsq (* high high)))
    (let ((j (an-integer-between i high)))
      (let ((ksq (+ (* i i) (* j j))))
        (require (>= hsq ksq))
        (let ((k (sqrt ksq)))
          (require (integer? k))
          (list i j k))))))

;The amount of possibilities would be decreased because of the fact that it wont have to enumerate k from j to high,  drastically reducing the amount of lists possibilities that will be enumerated through.  
