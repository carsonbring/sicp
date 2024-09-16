;2024-09-08
#lang sicp

;; Extend the evaluator to handle derived expressions such as cond, let, and so on (section 4.1.2). You
;; may ``cheat'' and assume that the syntax transformers such as cond->if are available as machine operations.28 
ev-cond
 (assign exp (op cond->if) (reg exp))
  (goto (label eval-dispatch))

ev-let
 (assign unev (op let-parameters) (reg exp))
(assign exp (op let-body) (reg exp))
  (assign val (op make-procedure)
              (reg unev) (reg exp) (reg env))
  (goto (reg continue))



