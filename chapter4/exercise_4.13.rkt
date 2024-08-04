;2024-08-04

;For the sake of encapsulation, from an env, make-unbound! should only get rid of the binding in the first frame, because it has no way of knowing how unbinding a variable will affect the other frames.

(define (make-unbound! var)            
   (list 'unbound! var))                
 (define (unbound? exp) (tagged-list? exp 'unbound!)) 
 (define (unbound!-var exp)              
   (cadr exp))                           
 (define (unbound! var env)                                
   (define (remove-binding var bindings) 
     (cond ((null? bindings) '()) 
           ((eq? var (caar bindings)) (cdr bindings)) 
           (else (cons (car bindings)  
                       (remove-binding var (cdr bindings)))))) 
   (let ((frame (first-frame env))) 
     (set-cdr! frame (remove-binding var (frame-bindings frame))))) 
