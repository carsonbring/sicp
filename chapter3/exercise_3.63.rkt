;2024-07-23
#lang sicp

;Louis Reasoner asks why the sqrt-stream procedure was not written in the following more straightforward way, without the local variable guesses:

(define (sqrt-stream x)
  (cons-stream 1.0
               (stream-map (lambda (guess)
                             (sqrt-improve guess x))
                           (sqrt-stream x))))

;Alyssa P. Hacker replies that this version of the procedure is considerably less efficient because it performs redundant computation. Explain Alyssa's answer. Would the two versions still differ in efficiency if our implementation of delay used only (lambda () <exp>) without using the optimization provided by memo-proc (section 3.5.1)? 

;This is the original implementation
(define (sqrt-stream x)
  (define guesses
    (cons-stream 1.0
                 (stream-map (lambda (guess)
                               (sqrt-improve guess x))
                             guesses)))
  guesses)


;The reason why this new version provided by Louis Reasoner is considerably less efficient is due to the fact (sqrt-stream x) will have to be passed into stream-map instead of guesses, which means that all of the previous computational history that is preserved in guesses will not be present in that statement, meaning that it will have to calculate all the way back to where guesses would already be.

;Without the usage of memoization, the difference in redundancy would not occur, due to the fact that the (cdr) of guesses would carry the same computational overhead as (sqrt-stream x)

;The moral of the story is that if you are planning on using memoization and are creating a stream function, you should implement it in a way that creates a local variable and the function can reference that local variable to cut down significantly on the execution time due to caching. 
