;2024-07-18
; In order to implement this i have to have a list of sequential elements, each of the elements has a value and a pointer to the previous element in the list.
; Going to do this tomorrow. 
#lang sicp

(define (front-ptr queue) (car queue))
(define (rear-ptr queue) (cdr queue))
(define (set-front-ptr! queue item) (set-car! queue item))
(define (set-rear-ptr! queue item) (set-cdr! queue item))

(define (empty-dequeue? queue) (null? (front-ptr queue)))

(define (make-dequeue) (cons '() '()))
(define (print-queue queue)
  (car queue))

(define (front-queue queue)
  (if (empty-dequeue? queue)
      (error "FRONT called with an empty queue" queue)
      (car (front-ptr queue))))

(define (rear-insert-queue! queue item)
  (let ((new-pair (cons item '())))
    (cond ((empty-dequeue? queue)
           (set-front-ptr! queue new-pair)
           (set-rear-ptr! queue new-pair)
           (print-queue queue))
          (else
           (set-cdr! (rear-ptr queue) new-pair)
           (set-rear-ptr! queue new-pair)
           (print-queue queue)))))

(define (front-delete-queue! queue)
  (cond ((empty-dequeue? queue)
         (error "DELETE! called with an empty queue" queue))
        (else
         (set-front-ptr! queue (cdr (front-ptr queue)))
         (print-queue queue))))

(define (rear-delete-queue! queue)
  (cond ((empty-dequeue? queue)
         (error "DELETE! called with an empty queue" queue))
        (else
         (set-front-ptr! queue (cdr (front-ptr queue)))
         (print-queue queue))))

(define q1 (make-queue))
(display (insert-queue! q1 'a))
;((a) a)
(display (insert-queue! q1 'b))
;((a b) b)
(display (delete-queue! q1))  
;((b) b)
(display (delete-queue! q1))  
;(() b)

; The reason why the (cdr queue) contains the tail is because that is supposed to contain the pointer to the last element in the list.

;Now, since print-queue just returns the (car queue) it is displayed correctly. 
