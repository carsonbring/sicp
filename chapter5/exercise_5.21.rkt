;2024-08-29
#lang sicp
n
;Implement register machines for the following procedures. Assume that the list-structure memory
; operations are available as machine primitives.

;a. Recursive count-leaves:

(define (count-leaves tree)
  (cond ((null? tree) 0)
        ((not (pair? tree)) 1)
        (else (+ (count-leaves (car tree))
                 (count-leaves (cdr tree))))))

(controller
 (assign sum (const 0))
 (assign continue (label count-done))
count-start
 (test (op null?) (reg tree))
 (branch (reg continue))
 (test (op notpair?) (reg tree))
 (branch (label count-notpair))
 (save continue)
 (assign continue (label after-car-iter))
 (save tree)
 (assign tree (op car) (reg tree))
count-notpair
 (restore tree)
 (restore continue)
 (assign sum (op +) (reg sum ) (const 1))
 (goto (reg continue))
after-car-iter
 (restore tree)
 (restore continue)
 (assign sum (op cdr) (reg tree))
 (goto (label count-start))
count-done
 (perform (op print) (reg sum))
 )
; b. Recursive count-leaves with explicit counter:

(define (count-leaves tree)
  (define (count-iter tree n)
    (cond ((null? tree) n)
          ((not (pair? tree)) (+ n 1))
          (else (count-iter (cdr tree)
                            (count-iter (car tree) n)))))
  (count-iter tree 0))

(controller
 (assign continue (label done))
 (assign n (const 0))
counter-iter
 (test (op null?) (reg tree))
 (branch (goto (reg continue)))
 (test (op notpair?) (reg tree))
 (branch (goto (label immediate-answer)))
 (save continue)
 (assign continue (label after-counter-iter))
 (save tree)
 (assign tree (op car) (reg tree))
 (goto (label counter-iter))
after-counter-iter
 (restore tree)
 (restore counter)
 (assign tree (op cdr) (reg tree))
 (goto counter-iter)
immediate-answer
 (assign n (op +) (reg n) (const 1))
 (goto (reg continue))
 )

