;2024-08-15
#lang sicp

(define (amb-list l)
  (if (null? l)
      (amb)
      (amb (car l) (amb-list (cdr l)))))

(define (parse-word word-list)
  (require (not (null? *unparsed*)))
  (require (memq (car *unparsed*) (cdr word-list)))
  (let ((found-word (car *unparsed*)))
    (set! *unparsed* (cdr *unparsed*))
    (amb-list (cdr word-list))))


(define *unparsed* '())
(define (parse input)
  (set! *unparsed* input)
  (let ((sent (parse-sentence)))
    (require (null? *unparsed*))
    sent))
