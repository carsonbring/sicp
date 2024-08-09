;2024-08-09
#lang sicp

;An example of a scenario where the extra laziness of the delayed car being useful would be if you had a function that consistantly called the cdr of a list, and never accessed the car of the list.

(define (length list count)
  (if (null? list) count (length (cdr list) (+ count 1)))
  )


;In the initial stream implementation where the car is not lazy, for each iteration of length it would have to calculate the new car of the list and store it even though it isn't being used. (in the example of (car) being a function. 
