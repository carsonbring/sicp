;2024-07-19
#lang sicp


(define (make-table)
  (let ((local-table (list '*table*)))
    (define (assoc key records)
      (cond ((null? records) false)
            ((equal? key (caar records)) (car records))
            (else (assoc key (cdr records)))))
    (define (lookup . keys)
      (define (lookup-iter keys table)
         (cond
           ((null? keys) (cdr table))
           ((null? table) #f)
           (else (lookup-iter (cdr keys) (assoc (car keys) (cdr table)))))
        ) (lookup-iter keys local-table))
    (define (insert! value . keys)
      (define (insert-iter value keys table)
        (let ((subtable (assoc (car keys) (cdr table))))
          (cond
            ((null? (cdr keys)) (set-cdr! table (cons (cons (car keys) value) (cdr table))))
            ((null? subtable) (begin (set-cdr! table (cons (list (car keys)) (cdr table))) (insert-iter value (cdr keys) (cadr table))))
            (else (insert-iter value (cdr keys) subtable))
            
            ))
        
       )
      (insert-iter value keys local-table)
      
      )    
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            (else (error "Unknown operation -- TABLE" m))))
    dispatch))
