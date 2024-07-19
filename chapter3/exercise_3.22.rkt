;2024-07-18
#lang sicp

(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '()))
    
   
    (define (set-front-ptr! item) (set! front-ptr item))
    (define (set-rear-ptr! item) (set! rear-ptr item))

    (define (empty-queue?) (null? front-ptr))
    (define (print-queue)
      front-ptr)

    (define (front-queue)
      (if (empty-queue?)
          (error "FRONT called with an empty queue" front-ptr)
          (car front-ptr)))

    (define (insert-queue! item)
      (let ((new-pair (cons item '())))
        (cond ((empty-queue?)
               (set-front-ptr! new-pair)
               (set-rear-ptr! new-pair)
               (print-queue))
              (else
               (set-cdr! rear-ptr new-pair)
               (set-rear-ptr! new-pair)
               (print-queue)))))

    (define (delete-queue!)
      (cond ((empty-queue?)
             (error "DELETE! called with an empty queue" front-ptr))
            (else
             (set-front-ptr! (cdr front-ptr))
             (print-queue))))


    (define (dispatch m)
      (cond ((eq? m 'insert-queue!) insert-queue!)
            ((eq? m 'empty-queue?) (empty-queue?))
            ((eq? m 'delete-queue!) (delete-queue!))
            (else (error "not a recognized operation in queue"))))
    dispatch))


(define q1 (make-queue))
(display ((q1 'insert-queue!) 'a))
;((a) a)
(display ((q1 'insert-queue!) 'b))
;((a b) b)
(display (q1 'delete-queue!))  
;((b) b)
(display (q1 'delete-queue!))  
;(() b)

; The reason why the (cdr queue) contains the tail is because that is supposed to contain the pointer to the last element in the list.

;Now, since print-queue just returns the (car queue) it is displayed correctly. 
