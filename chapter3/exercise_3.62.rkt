;2024-07-23
#lang sicp

 (define (div-series nums dems) 
   (mul-series nums 
               (invert-series dems))) 
  
 (define tangent-series (div-series sine-series cosine-series)) 
