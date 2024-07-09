; 2024-07-08
#lang sicp
;; (define (deriv exp var)
;;   (cond ((number? exp) 0)
;;         ((variable? exp) (if (same-variable? exp var) 1 0))
;;         ((sum? exp)
;;          (make-sum (deriv (addend exp) var)
;;                    (deriv (augend exp) var)))
;;         ((product? exp)
;;          (make-sum
;;            (make-product (multiplier exp)
;;                          (deriv (multiplicand exp) var))
;;            (make-product (deriv (multiplier exp) var)
;;                          (multiplicand exp))))
;;         <more rules can be added here>
;;         (else (error "unknown expression type -- DERIV" exp))))
;; -----------------------------------------------------------------
;; Above is the previous implementation of deriv from exercise 2.56
;; Our new deriv below uses a data-directed dispatch approach to "get" the correct deriv function as per the operator
;; After the new derivative function is retreived, the function is applied by using the operands and var as arguments
;; We cannot assimildate the predicates (number?) and (same-variable?) due to them being special cases where no matter the operation we add for deriv, they apply when taking the derivative of the expression argument.

(define (make-table)
  (let ((local-table (list '*table*)))
    (define (lookup key-1 key-2)
      (let ((subtable (assoc key-1 (cdr local-table))))
        (if subtable
            (let ((record (assoc key-2 (cdr subtable))))
              (if record
                  (cdr record)
                  false))
            false)))
    (define (insert! key-1 key-2 value)
      (let ((subtable (assoc key-1 (cdr local-table))))
        (if subtable
            (let ((record (assoc key-2 (cdr subtable))))
              (if record
                  (set-cdr! record value)
                  (set-cdr! subtable
                            (cons (cons key-2 value)
                                  (cdr subtable)))))
            (set-cdr! local-table
                      (cons (list key-1
                                  (cons key-2 value))
                            (cdr local-table)))))
      'ok)    
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            (else (error "Unknown operation -- TABLE" m))))
    dispatch))

(define operation-table (make-table))
(define get (operation-table 'lookup-proc))
(define put (operation-table 'insert-proc!))


(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

(define (install-deriv-package)
  (define (=number? exp num)
  (and (number? exp) (= exp num)))
  (define (make-sum a1 a2)
    (cond ((=number? a1 0) a2)
          ((=number? a2 0) a1)
          ((and (number? a1) (number? a2)) (+ a1 a2))
          (else (list '+ a1 a2))))
  (define (addend s) (car s))
  (define (augend s) (cadr s))
  
  (define (make-product m1 m2) (list '* m1 m2))
  (define (multiplier p) (car p))
  (define (multiplicand p) (cadr p))
  (define (power b e)
    (if (= e 0) 1 (* b (power b (- e 1)))))

  
  (define (make-exponentiation b e)
    (cond ((= e 0) 1)
          ((= e 1) b) 
          ((= b 0) 0)
          ((and (number? b) (number? e)) (power b e))
          (else (list '** b e))))

  (define (base e) (car e))
  (define (exponent e) (cadr e))
 
  (define (sum-deriv exp var)
    (make-sum (deriv (addend exp) var) (deriv (augend exp) var)))

  (define (mul-deriv exp var)
    (make-sum (make-product (multiplier exp)
                         (deriv (multiplicand exp) var))
           (make-product (deriv (multiplier exp) var)
                         (multiplicand exp))))
  (define (exp-deriv exp var)
    (make-product (make-product (make-exponentiation (base exp) (- (exponent exp) 1)) (exponent exp)) (deriv (base exp) var)))
  (put 'deriv '** exp-deriv )
  (put 'deriv '* mul-deriv)
  (put 'deriv '+ sum-deriv)
  'done)

(install-deriv-package)


(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        (else ((get 'deriv (operator exp)) (operands exp)
                                           var))))

(define (variable? x) (symbol? x))
(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))
(display (deriv '(* 2 (** x 2)) 'x))
