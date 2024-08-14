;2024-08-11
#lang sicp
  
 (define stmts 
     '(((kitty 2) (betty 3)) 
       ((ethel 1) (joan 2)) 
       ((joan 3) (ethel 5)) 
       ((kitty 2) (betty 1)) 
       ((mary 4) (betty 1)))) 
(define (no-repeats)
  (let ((memlist '()))
    (define (deploy l)
      (if (null? l)
          #t
          (let ((current (car l)))
            (let ((name-in-mem? (memq (car current) (map car memlist)))
                  (rank-in-mem? (memq (cadr current) (map cadr memlist))))
              (if (or name-in-mem? rank-in-mem?)
                  #f
                  (begin (set! memlist (cons current memlist)) (deploy (cdr l))))))))
    (lambda (l) (deploy l))))


(define (real-ranking l)
  (let ((amb-map (map (lambda (x) (amb (car x) (cadr x))) l)))
    (require (no-repeats amb-map))
    amb-map))

(display (real-ranking stmts))
