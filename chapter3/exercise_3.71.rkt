;2024-07-28
#lang sicp

(define (weighted-pairs s t weightf)
  (define (weighted-merge s1 s2)
    (cond ((stream-null? s1) s2)
          ((stream-null? s2) s1)
          ((>= (weightf (stream-car s1)) (weightf (stream-car s2)))
           (cons-stream (stream-car s1) (weighted-merge (stream-cdr s1) s2)))
          (else (cons-stream (stream-car s2) (weighted-merge s1 (stream-cdr s2))))))
  (cons-stream
   (list (stream-car s) (stream-car t))
   (weighted-merge
    (stream-map (lambda (x) (list (stream-car s) x))
                (stream-cdr t))
    (pairs (stream-cdr s) (stream-cdr t)))))

(define (cube x) (* x x x))
(define ones (cons-stream 1 ones))
(define integers (cons-stream 1 (stream-add ones integers)))




(define stream-b (weighted-pairs opp-hammings opp-hammings (lambda (x) (+ (* 2 (car x)) (* 3 (cadr x)) (* 5 (car x) (cadr x))))))
(define S (cons-stream 1 (merge (scale-stream S 2) (merge (scale-stream S 3) (scale-stream S 5)))))

(define (find-ramanujan n)
  (define (cube-sum-pair p)
    (+ (cube (car x)) (cube (cadr x))))
  (define stream-a (weighted-pairs integers integers (lambda (x) (+ (cube (car x)) (cube (cadr x))))))

  
  (define (compare-weights s numbers n )
    (let ((weight1 (cube-sum-pair (stream-car s)))
          (weight2 (cube-sum-pair (stream-car (stream-cdr s)))))

      (cond ((>= (length numbers) n) numbers)
            ((= weight1 weight2)  (compare-weights (stream-cdr s) (append numbers (stream-car (stream-cdr s))) n))
            (else (compare-weights (stream-cdr s) numbers n) ))
      )
    )

  )
