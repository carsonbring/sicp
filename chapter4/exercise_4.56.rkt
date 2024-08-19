;2024-08-18
#lang sicp

;; Exercise 4.56.  Formulate compound queries that retrieve the following information:

;; a. the names of all people who are supervised by Ben Bitdiddle, together with their addresses;

;; b. all people whose salary is less than Ben Bitdiddle's, together with their salary and Ben Bitdiddle's salary;

;; c. all people who are supervised by someone who is not in the computer division, together with the supernnnvisor's
;; name and job. 

(and (supervisor ?x (Ben Bitdiddle))
     (address ?x ?y))

(and (salary (Ben Bitdiddle) ?x)
     (salary ?name ?y)
     (lisp-value >= ?x ?y))

(and (job ?x (not (computer . ?type)))
     (supervisor ?name ?x))
