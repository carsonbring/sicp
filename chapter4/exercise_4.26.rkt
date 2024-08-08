;2024-08-08
#lang sicp

;Ben Bitdiddle and Alyssa P. Hacker disagree over the importance of lazy evaluation for implementing things such as unless. Ben points out that it's possible to implement unless in applicative order as a special form. Alyssa counters that, if one did that, unless would be merely syntax, not a procedure that could be used in conjunction with higher-order procedures. Fill in the details on both sides of the argument. Show how to implement unless as a derived expression (like cond or let), and give an example of a situation where it might be useful to have unless available as a procedure, rather than as a special form.


(define (unless? expr) (eq? 'unless (car expr)))
(define (make-unless condition usual-value exceptional-value) (list 'unless condition usual-value exceptional-value))

(define (unless-cond expr) (cadr expr))
(define (unless-usual expr) (caddr expr))
(define (unless-exceptional expr) (cadddr expr))
(define (unless->if expr)
  (make-if (unless-cond expr) (unless-exceptional expr) (unless-usual expr)))

; add to eval 
((unless? expr) (eval (unless->if expr) env))

