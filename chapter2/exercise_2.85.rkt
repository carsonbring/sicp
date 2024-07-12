; 2024-07-10

 (define (apply-generic op . args) 
  
   (define (handle-coercion types) 
     (if (null? types) 
         (error "No methods were found: APPLY_GENERIC" op args) 
         (try-to-apply op (raise-args (car types)) handle-coercion (cdr types)))) 
  
   (define (raise-args type) 
     (map 
      (lambda (arg) 
        (let ((raised-arg (raise-up-to arg type))) 
          (if raised-arg raised-arg arg))) 
      args)) 
  
   (define (raise-up-to obj type) 
     (if (or (not obj) (equal? (type-tag obj) type)) 
         obj 
         (raise-up-to 
          (try-to-apply 'raise (list obj) identity false) 
          type))) 
  
   (let ((result 
          (try-to-apply op args handle-coercion (map type-tag args)))) 
     (if (pair? result) (drop result) result))) 
  
 (define (try-to-apply op args . callback) 
   (let ((proc (get op (map type-tag args)))) 
     (cond (proc (apply proc (map contents args))) 
           ((null? callback) '()) 
           (else (apply (car callback) (cdr callback)))))) 
  
 (define (drop obj) 
   (let ((projected-obj 
          (try-to-apply 'project (list obj) identity false))) 
     (if (and projected-obj (equ? projected-obj obj)) 
         (drop projected-obj) 
         obj))) 
  
 (define (raise x) 
   (try-to-apply 'raise (list x) error "No methods were found: RAISE" x)) 
  
 (define (project x) 
   (try-to-apply 'project (list x) error "No methods were found: PROJECT" x)) 
  
