;2024-07-18
;Not going to draw diagrams for this one, but I will explain how
(define x (cons 1 2))
(define z (cons x x))
(set-car! (cdr z) 17)
(car x)
;17

;;These diagrams would look in regards to the environments that it would spawn.

(define x (cons 1 2))
;; This would create an environment where (cons 1 2) is converted to a dispatch function
(define z (cons x x))
;; This would create a new environment that would return a dispatch function that has dispatch functions for both x and z
(set-car! (cdr z) 17)
;; Because the variable or environment x would be modified with set-car, x would be a dispatch function with the function (car x) returning 17, and (cdr x) would return 2
; This is why we get 17 returned for
(car x)
; Even though x wasn't directly modified. 
