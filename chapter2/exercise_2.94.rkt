;2024-07-11
#lang sicp

;(make-rat) does _NOT_ simplify the rational number, even though it should. Below, I modify the (make-rat-poly) function to do so. In a real implementation I would add each new function as a generic in their own package. 
(define p1 (make-poly 'x '((2 1)(0 1))))
(define p2 (make-poly 'x '((3 1)(0 1))))
(define rf (make-rat p2 p1))

(define (gcd a b) 
  (if (= b 0)
    a
    (gcd b (modulo a b))
  )
)
;using the div-term implementation from 2.91
(define (remainder-terms t1 t2)
  (cadr (div-terms t1 t2)))
(define (gcd-terms a b)
  (if (empty-termlist? b)
      a
      (gcd-terms b (remainder-terms a b))))

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define (make-rat n d)
  (let ((g (gcd n d))
        (denom-sign (if (> d 0) 1 (- 1))))
    (cons (* (/ n g) denom-sign)
          (* (/ d g) denom-sign))))
(define (gcd-poly p1 p2) 
   (if (same-varaible? (variable p1) (variable p2)) 
     (make-poly (variable p1) 
                (gcd-terms (term-list p1) 
                           (term-list p2)) 
     (error "not the same variable -- GCD-POLY" (list p1 p2))))) 
(define (make-rat-poly n d)
  (define (is-poly-pos? t)
   (> (foldl * 1 t) 0 ))
  (let ((g (gcd-poly n d))
        (denom-sign (if (is-poly-pos? (term-list d)) 1 (- 1))))
    (list 'rational (mul (div n g) denom-sign) (mul (div d g) denom-sign))))
