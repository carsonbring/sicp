;2024-08-17
#lang sicp

  
 (define (analyze-if-fail exp) 
     (let ((cproc (analyze (if-fail-cond exp))) 
           (aproc (analyze (if-fail-alt exp)))) 
         (lambda (env succeed fail) 
             (cproc env 
                    succeed 
                    (lambda () 
                         (aproc env succeed fail)))))) 
