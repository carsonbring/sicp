;2024-07-18
;I DID IT!!! I'm pretty happy with this one (even though the print-dequeue is a little gross looking)
; I learned so much about pointers from this one exercise and it was just the right amount of challenging.
; Exercises like this remind me of how much I love this book.

;Dequeue implementation
#lang sicp

(define (front-ptr queue) (car queue))
(define (rear-ptr queue) (cdr queue))
(define (set-front-ptr! queue item) (set-car! queue item))
(define (set-rear-ptr! queue item) (set-cdr! queue item))

(define (empty-dequeue? queue) (null? (front-ptr queue)))

(define (make-dequeue) (cons '() '()))
(define (print-dequeue dequeue)
  (display (car dequeue))
  (newline))

(define (front-dequeue dequeue)
  (if (empty-dequeue? dequeue)
      (error "FRONT called with an empty queue" dequeue)
      (car  (car (front-ptr dequeue)))))

(define (rear-insert-dequeue! dequeue item)
  (let ((new-pair  (cons (cons item (rear-ptr dequeue)) '())))
    (cond ((empty-dequeue? dequeue)
           (set-front-ptr! dequeue new-pair)
           (set-rear-ptr! dequeue new-pair)
           (print-dequeue dequeue))
          (else
           (set-cdr! (rear-ptr dequeue) new-pair)
           (set-rear-ptr! dequeue new-pair)
           (print-dequeue dequeue)))))

(define (front-insert-dequeue! dequeue item)
  (let ((new-pair (cons (cons item '()) (front-ptr dequeue))))
    (cond ((empty-dequeue? dequeue)
           (set-front-ptr! dequeue new-pair)
           (set-rear-ptr! dequeue new-pair)
           (print-dequeue dequeue))
          (else
           (set-cdr!  (car (front-ptr dequeue)) new-pair)
           (set-front-ptr!  dequeue new-pair)
           (print-dequeue dequeue)))))


(define (front-delete-dequeue! dequeue)
  (cond ((empty-dequeue? dequeue)
         (error "DELETE! called with an empty queue" dequeue))
        (else
         (set-front-ptr! dequeue (cdr (front-ptr dequeue)))
         (set-cdr! (car (front-ptr dequeue)) '())
         (print-dequeue dequeue))))

(define (rear-delete-dequeue! dequeue)
  (cond ((empty-dequeue? dequeue)
         (error "DELETE! called with an empty queue" dequeue))
        (else
         (set-cdr! (cdr (car (rear-ptr dequeue))) '())
         (set-rear-ptr! dequeue (cdr (car (rear-ptr dequeue))))
         (print-dequeue dequeue))))

(define q1 (make-dequeue))
(front-insert-dequeue! q1 'a)

(rear-insert-dequeue! q1 'b)
(front-insert-dequeue! q1 'c)

(rear-delete-dequeue! q1)

(front-delete-dequeue! q1)



