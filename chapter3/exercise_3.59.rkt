;2024-07-23
#lang sicp

(define-syntax delay
  (syntax-rules ()
    ((delay expr)
     (lambda ()
       (expr)))))

(define (force delayed-object)
  (delayed-object))

(define-syntax stream-cons
  (syntax-rules ()
    ((stream-cons a b)
     (cons a (delay b)))))
  
  (define (stream-ref s n)
    (if (= n 0)
        (stream-car s)
        (stream-ref (stream-cdr s) (- n 1))))
(define (stream-null? stream)
  (null? stream))
(define (stream-map proc . argstreams)
  (if (stream-null? (car argstreams))
      the-empty-stream
      (stream-cons
       (apply proc (map stream-car argstreams))
       (apply stream-map
              (cons proc (map stream-cdr argstreams))))))
(define (stream-for-each proc s)
  (if (stream-null? s)
      'done
      (begin (proc (stream-car s))
             (stream-for-each proc (stream-cdr s)))))

(define (display-stream s)
  (stream-for-each display-line s))
(define the-empty-stream '())
(define (display-line x)
  (newline)
  (display x))

(define (stream-car stream) (car stream))

(define (stream-cdr stream) (force (cdr stream)))


(define (memo-proc proc)
  (let ((already-run? false) (result false))
    (lambda ()
      (if (not already-run?)
          (begin (set! result (proc))
                 (set! already-run? true)
                 result)
          result))))


(define (stream-add s1 s2)
  (stream-map + s1 s2))
(define ones (stream-cons 1 ones))
(define integers (stream-cons 1 (stream-add integers ones)))

  
  (define (stream-divide s1 s2)
    (stream-map / s1 s2))
(define (integrate-series coeffs)
  (stream-divide coeffs integers))
(define cosine-series 
     (stream-cons 1 (stream-map - (integrate-series sine-series)))) 
 (define sine-series 
     (stream-cons 0 (integrate-series cosine-series))) 
(define series (integrate-series ones))
(display (stream-car series))
(display   (stream-cdr series))
