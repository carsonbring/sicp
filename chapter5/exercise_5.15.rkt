;2024-08-27
#lang sicp

;Add instruction counting to the register machine simulation. That is, have the machine model keep track of the number of instructions executed. Extend the machine model's interface to accept a new message that prints the value of the instruction count and resets the count to zero.

(define (make-new-machine)    
    (let ((pc (make-register 'pc))    
          (flag (make-register 'flag))
          (stack (make-stack))    
          (the-instruction-sequence '())
          (instruction-counter 0))    
      (let ((the-ops    
             (list (list 'initialize-stack    
                         (lambda () (stack 'initialize)))))    
            (register-table    
             (list (list 'pc pc) (list 'flag flag))))    
        (define (allocate-register name)    
          (if (assoc name register-table)    
              (error "Multiply defined register: " name)    
              (set! register-table    
                    (cons (list name (make-register name))    
                          register-table)))    
          'register-allocated)    
        (define (lookup-register name)    
          (let ((val (assoc name register-table)))    
            (if val    
                (cadr val)    
                (error "Unknown register:" name))))    
        (define (execute)    
          (let ((insts (get-contents pc)))    
            (if (null? insts)    
                'done    
                (begin
                  (set! instruction-counter (+ instruction-counter 1))
                  ((instruction-execution-proc (car insts)))    
                  (execute)))))    
        (define (dispatch message)    
          (cond ((eq? message 'start)    
                 (set-contents! pc the-instruction-sequence)    
                 (execute))    
                ((eq? message 'install-instruction-sequence)    
                 (lambda (seq) (set! the-instruction-sequence seq)))
                ((eq? message 'allocate-register) allocate-register)    
                ((eq? message 'get-register) lookup-register)
                ((eq? message 'install-operations)
                 (lambda (ops) (set! the-ops (append the-ops ops))))
                ((eq? message 'stack) stack)    
                ((eq? message 'operations) the-ops)
                ((eq? message 'get-inst-count) instruction-counter)
                ((eq? message 'reset-inst-count) (set! instruction-counter 0))
                (else (error "Unknown request -- MACHINE" message))))    
        dispatch)))    
  
