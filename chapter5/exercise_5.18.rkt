;2024-08-27
#lang sicp

;Modify the make-register procedure of section 5.2.1 so that registers can be traced. Registers should accept messages that turn tracing on and off. When a register is traced, assigning a value to the register should print the name of the register, the old contents of the register, and the new contents being assigned. Extend the interface to the machine model to permit you to turn tracing on and off for designated machine registers.

(define (make-register name)
  (let ((contents '*unassigned*)
        (tracing false))
    
    (define (dispatch message)
      (cond ((eq? message 'get) contents)
            ((eq? message 'set)
             (lambda (value) (set! contents value)))
            ((eq? message 'set-tracing)
             (lambda (val) (set! tracing valf)))
            ((eq? message 'traced?)
             tracing)
            (else
             (error "Unknown request -- REGISTER" message))))
    dispatch))


(define (get-contents register)
  (register 'get))

(define (set-contents! register value)
  ((register 'set) value))


(define (make-new-machine)    
    (let ((pc (make-register 'pc))    
          (flag (make-register 'flag))    
          (stack (make-stack))    
          (the-instruction-sequence '())
          (instruction-counter 0)
          (trace false))    
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
                (else (error "Unknown request -- MACHINE" message))))    
        dispatch)))    
  
