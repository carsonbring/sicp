;2024-08-27
#lang sicp

; Extend the instruction tracing of exercise 5.16 so that before printing an instruction, the simulator prints any labels that immediately precede that instruction in the controller sequence. Be careful to do this in a way that does not interfere with instruction counting (exercise 5.15). You will have to make the simulator retain the necessary label information.

(define (make-new-machine)    
    (let ((pc (make-register 'pc))    
          (flag (make-register 'flag))    
          (stack (make-stack))    
          (the-instruction-sequence '())
          (instruction-counter 0)
          (trace false)
          (labels '()))    
      (let ((the-ops    
             (list (list 'initialize-stack    
                         (lambda () (stack 'initialize)))))    
            (register-table    
             (list (list 'pc pc) (list 'flag flag))))
         (define (inst-label inst) 
           (define (inst-label-iter inst lst) 
             (if (member inst (car lst)) 
                 (caar lst) 
                 (inst-label-iter inst (cdr lst)))) 
           (inst-label-iter inst (reverse labels)))  

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
                  (if (trace) (display (car insts)))
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
                ((eq? message 'trace-on) (set! trace true))
                ((eq? message 'trace-off) (set! trace false))
                 ((eq? message 'install-labels) 
                (lambda (lbls) (set! labels lbls) 'done)) 
                 ((eq? message 'print-labels) 
                (lambda () labels)) 

                (else (error "Unknown request -- MACHINE" message))))    
        dispatch)))    
  
