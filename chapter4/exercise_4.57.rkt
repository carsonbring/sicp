;2024-08-18
#lang sicp

;; Exercise 4.57.  Define a rule that says that person 1 can replace person 2 if either person 1 does the same job as
;; person 2 or someone who does person 1's job can also do person 2's job, and if person 1 and person 2 are not the
;; same person. Using your rule, give queries that find the following:

;; a.  all people who can replace Cy D. Fect;

;; b.  all people who can replace someone who is being paid more than they are, together with the two salaries. 

(rule (can-replace? ?person-1 ?person-2 )
      (and (not (same ?person-1 ?person-2))
       (or (same (job ?person-1 ?x) (job ?person-2 ?y))
           (can-do-job ?x ?y))))

;a.
(can-replace? ?x (Cy D. Fect))

;b.
(and (salary ?x ?lower)
     (salary ?y ?higher)
     (can-replace? ?x ?y)
     (lisp-value > ?higher ?lower))
