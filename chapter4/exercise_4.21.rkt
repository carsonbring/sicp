;2024-08-04
#lang sicp
; This is a y-combinator (using recursion without any definitions)
(display ((lambda (n)
   ((lambda (fact)
      (fact fact n))
    (lambda (ft k)
      (if (= k 1)
          1
          (* k (ft ft (- k 1)))))))
 10))
