;2024-08-27
#lang sicp
;; Modify the simulator so that it uses the controller sequence to determine what registers the
;; machine has rather than requiring a list of registers as an argument to make-machine. Instead of pre-allocating the registers in make-machine, you can allocate them one at a time when they are first seen during as sembly of the instructions.
;I am aware that this is still allocating them all before the assembly but I think it makes more sense to do it this way.

(define (make-machine ops controller-text)
  (let* ((machine (make-new-machine))
         (existing-register-names '())
         (register-ops (filter (lambda (x) (or (eq? (car x) 'assign) (eq? (car x) 'reg))) controller-text))
         (register-names (map (lambda (x) (if (assoc x existing-register-names) 'existed (begin (set! existing-register-names (cons (cadr x) existing-register-names)) (cadr x))) register-ops))))
    (for-each (lambda (register-name)
                ((machine 'allocate-register) register-name))
              register-names)
    ((machine 'install-operations) ops)    
    ((machine 'install-instruction-sequence)
     (assemble controller-text machine))
    machine))
