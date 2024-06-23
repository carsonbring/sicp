;; I keep forgetting to include the date lmao
;; 2024-06-22 22:21
;; this is sort of working but it isn't simplifying the answer at all. 
;; Oh and if it isn't obvious, I switched to using racket with sicp language. Using emacs now so thats a lot of fun. 
#lang sicp

(define (variable? x) (symbol? x))
(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (make-sum a1 a2) (list '+ a1 a2))


(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))
(define (addend s) (cadr s))
(define (augend s) (caddr s))

(define (make-product m1 m2) (list '* m1 m2))
(define (product? x)
  (and (pair? x) (eq? (car x) '*)))
(define (multiplier p) (cadr p))
(define (multiplicand p) (caddr p))
(define (power b e)
  (if (= e 0) 1 (* b (power b (- e 1)))))

  
(define (make-exponentiation b e)
  (cond ((= e 0) 1)
	((= e 1) b) 
	((= b 0) 0)
	((and (number? b) (number? e)) (power b e))
	(else (list '** b e))))

(define (base e) (cadr e))
(define (exponent e) (caddr e))
(define (exponentiation? e) (and (pair? e) (eq? (car e) '**)))

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
           (make-product (multiplier exp)
                         (deriv (multiplicand exp) var))
           (make-product (deriv (multiplier exp) var)
                         (multiplicand exp))))
	((exponentiation? exp) (make-product (make-product (make-exponentiation (base exp) (- (exponent exp) 1)) (exponent exp)) (deriv (base exp) var)))
        (else
         (error "unknown expression type -- DERIV" exp))))

(display (deriv '(* 2 (** x 2)) 'x))
