;2024-09-08
#lang sicp

;; Implement cond as a new basic special form without reducing it to if. You will have to construct a
;; loop that tests the predicates of successive cond clauses until you find one that is true, and then use ev-sequence to evaluate the actions of the clause.

ev-cond

(test (op zero-clauses?) (reg exp))
(branch (label continue))
(save continue)
(save exp)
(assign unev (op rest-conds) (reg exp))
(save unev)
(assign unev (op first-cond) (reg exp))
(assign exp (op cond-predicate) (reg unev))
(assign unev (op cond-actions) (reg unev))

(assign continue (cond-decide))
(goto (label eval-dispatch))

ev-clause
 (restore continue)
(restore env)
(restore exp)
(test (op true?) (reg val))
  (branch (label ev-if-consequent))
(restore unev)
(assign exp (reg unev))
(goto (label ev-cond))

ev-if-consequent
 (assign exp (reg unev) )
(goto (label ev-sequence ))

