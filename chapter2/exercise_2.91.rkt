; 2024-07-11
#lang sicp


(define (div-terms L1 L2)
  (if (empty-termlist? L1)
      (list (the-empty-termlist) (the-empty-termlist))
      (let ((t1 (first-term L1))
            (t2 (first-term L2)))
        (if (> (order t2) (order t1))
            (list (the-empty-termlist) L1)
             (let ((new-c (div (coeff t1) (coeff t2))) 
                   (new-o (- (order t1) (order t2))))
               ;;Needed to cheat for this part :(
               (let ((rest-of-result 
                      (div-terms (sub-terms L1 
                                            (mul-term-by-all-terms 
                                             (make-term new-o new-c) 
                                             L2)) 
                                 L2))) 
                 (list (adjoin-term (make-term new-o new-c) 
                                    (first rest-of-result)) 
                       (second rest-of-result)))))))) 


(define (div-poly p1 p2)
  (if (same-variable? (variable p1) (variable p2))
      (let ((div-terms (div-terms (term-list p1) (term-list p2))))
        (let ((div-q (car div-terms))
              (div-r (cadr div-terms)))
          (list (make-poly (variable p1) (div-q)) (make-poly (variable p1) (div-r)))))))
