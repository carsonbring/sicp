;2024-07-22
#lang sicp

(define (make-mutex)
  (let ((cell (list false)))            
    (define (the-mutex m)
      (cond ((eq? m 'acquire)
             (if (test-and-set! cell)
                 (the-mutex 'acquire))) ; retry
            ((eq? m 'release) (clear! cell))))
    the-mutex))
(define (clear! cell)
  (set-car! cell false))

(define (test-and-set! cell)
  (if (car cell)
      true
      (begin (set-car! cell true)
             false)))


(define (init-list n)
    (if (<= n 0)
        '()
        (cons #f (init-list (- n 1)))))

(define (make-semaphore-t&s n)
  (let ((cells (init-list n)))
    (define (the-semaphore m)
      (cond ((eq? m 'acquire)
             (if (test-and-set! cells)
                 (the-semaphore 'acquire)))
            ((eq? m 'release) (clear! cells))))
    (define (clear! cells)
      (set-a-false cells))
    (define (test-and-set! cells)
      (if (not (memq #f cells))
          true
          (set-a-true cells)))
    (define (set-a-true cells)
      (cond
        ((null? cells) '())                       
        ((eq? (car cells) #f) (set-car! cells #t)) 
        (else (set-a-true (cdr cells)))))
    (define (set-a-false cells)
      (cond
        ((null? cells) '())                       
        ((eq? (car cells) #t) (set-car! cells #f)) 
        (else (set-a-false (cdr cells)))))
    the-semaphore
    )
  
  )

 (define (make-semaphore-m n) 
   (let ((lock (make-mutex)) 
         (taken 0)) 
     (define (semaphore command) 
       (cond ((eq? command 'acquire) 
              (lock 'acquire) 
              (if (< taken n) 
                  (begin (set! taken (+ taken 1)) (lock 'release)) 
                  (begin (lock 'release) (semaphore 'acquire)))) 
             ((eq? command 'release) 
              (lock 'acquire) 
              (set! taken (- taken 1)) 
              (lock 'release)))) 
     semaphore)) 
