;2024-08-26
#lang sicp

;; The treatment of machine operations above permits them to operate on labels as well as on
;; constants and the contents of registers. Modify the expression-processing procedures to enforce the condition
;; that operations can be used only with registers and constants.

(define (make-operation-exp exp machine labels operations)
  (let ((op (lookup-prim (operation-exp-op exp) operations))
        (aprocs
         (filter (lambda (e) (not (label-exp? e)))
         (map (lambda (e)
                
                (make-primitive-exp e machine labels))
              (operation-exp-operands exp)))))
    (lambda ()
      (apply op (map (lambda (p) (p)) aprocs)))))
