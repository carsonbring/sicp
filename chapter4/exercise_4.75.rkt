;2024-08-22
#lang sicp

 (define (uniquely-asserted pattern frame-stream) 
  (stream-flatmap 
   (lambda (frame) 
    (let ((stream (qeval (negated-query pattern) 
                                         (singleton-stream frame)))) 
         (if (singleton-stream? stream) 
             stream 
             the-empty-stream))) 
   frame-stream)) 
 (put 'unique 'qeval uniquely-asserted) 
  
 (define (singleton-stream? s) 
  (and (not (stream-null? s)) 
       (stream-null? (stream-cdr s)))) 
