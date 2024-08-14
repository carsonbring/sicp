;2024-08-11
#lang sicp

;Previous solution
(define (an-integer-between low high)
  (require (>= low high))
  (amb low (an-integer-between (+ low 1) high)))

(define (a-pythagorean-triple-between low high)
  (let ((i (an-integer-between low high)))
    (let ((j (an-integer-between i high)))
      (let ((k (an-integer-between j high)))
        (require (= (+ (* i i) (* j j)) (* k k)))
        (list i j k)))))


;Exercise 3.69 discussed how to generate the stream of all Pythagorean triples, with no upper bound on the size of the integers to be searched. Explain why simply replacing an-integer-between by an-integer-starting-from in the procedure in exercise 4.35 is not an adequate way to generate arbitrary Pythagorean triples. Write a procedure that actually will accomplish this. (That is, write a procedure for which repeatedly typing try-again would in principle eventually generate all Pythagorean triples.)


;Replacing an-integer-between by an-integer-starting would not generate arbitrary Pythagorean triples because of the way the equality is set up. the integer on the right side of the equation needs to clearly be higher than the other two integers. This means that we would be generating a bunch of equalities that would make 0 sense since the numbers on the left side would be higher than the one integer on the left side

(define (a-pythagorean-triple low)
  (let ((k (an-integer-starting low)))
    (let ((i (an-integer-between low k)))
      (let ((j (an-integer-between i k)))
        (require (= (+ (* i i) (* j j)) (* k k)))
        (list i j k)))))
