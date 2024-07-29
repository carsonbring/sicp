;2024-07-28
#lang sicp


 (define (rand request-stream) 
   (let ((req (stream-car request-stream))) 
     (let ((random-init (if (eq? 'reset (car req)) 
                            (cadr req) 
                            random-init)) 
           (request-stream (if (eq? 'reset (car req)) 
                               (stream-cdr request-stream) 
                               request-stream))) 
       (define random-numbers 
           (cons-stream random-init 
                        (stream-map 
                         (lambda (req rnum) 
                           (cond ((eq? 'generate (car req)) 
                                  (rand-update rnum)) 
                                 ((eq? 'reset (car req)) 
                                  (cadr req)) 
                                 (else (error "Wrong request -- RAND" req)))) 
                                    request-stream random-numbers))) 
       random-numbers))) 
