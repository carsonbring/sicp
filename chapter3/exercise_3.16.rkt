;2024-07-14
#lang sicp


;; Ben Bitdiddle decides to write a procedure to count the number of pairs in any list structure. ``It's easy,'' he reasons. ``The number of pairs in any structure is the number in the car plus the number in the cdr plus one more to count the current pair.'' So Ben writes the following procedure:

(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))

;; Show that this procedure is not correct. In particular, draw box-and-pointer diagrams representing list structures made up of exactly three pairs for which Ben's procedure would return 3; return 4; return 7; never return at all.


; Three pairs: return 3
(display (count-pairs '( a b c)))
;three pairs : return 4
(newline)
(define x '(a)) 
(define y (cons x x)) 
(define ex2 (list y))
(display (count-pairs ex2))
(newline)

;three pairs : return 7
(define z '(a b))
(define z2 '(a))
(define ex3 (cons y y))
(display (count-pairs ex3))
