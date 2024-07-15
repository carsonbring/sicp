;2024-07-14
; Monte carlo integral
; This one was fun. I am so glad I am not in section 2.5 anymore!
#lang sicp

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))
(define (area corner1 corner2)
 (* (- (car corner2) (car corner1)) (- (cadr corner2) (cadr corner1))))
(define (estimate-integral predicate trials corner1 corner2)
  (let ((rand-experiment  (lambda () (predicate (random-in-range (car corner1) (car corner2)) (random-in-range (cadr corner1)
                                                                                                   (cadr corner2))))))
     (* (area corner1 corner2) (monte-carlo trials rand-experiment))))

(define (monte-carlo trials experiment)
   (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
           (/ trials-passed trials))
          ((experiment)
           (iter (- trials-remaining 1) (+ trials-passed 1)))
          (else
           (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))

(define (power a b)
  (if (= 0 b) 1 (* a (power a (- b 1)))))

(display (estimate-integral (lambda (x y) (<= (+ (power (- x 5) 2) (power (- y 7) 2)) 9)) 1000 '(2.0 4.0) '(8.0 10.0)))

(newline)
;Estimate pi
(display (estimate-integral (lambda (x y) (<= (+ (power x 2) (power y 2)) 1)) 100000 '(-1.0 -1.0) '(1.0 1.0)))
