;2024-08-04
#lang sicp

;Given a one-argument procedure p and an object a, p is said to ``halt'' on a if evaluating the expression (p a) returns a value (as opposed to terminating with an error message or running forever). Show that it is impossible to write a procedure halts? that correctly determines whether p halts on a for any procedure p and object a. Use the following reasoning: If you had such a procedure halts?, you could implement the following program:

(define (run-forever) (run-forever))

(define (try p)
  (if (halts? p p)
      (run-forever)
      'halted))


;;It if we used (try try) we would validate the intended behavior of halts?  due to the fact that prooving by contradiction shows that if halts evaluates to true, then it would run forever. Same way vice versa. 
