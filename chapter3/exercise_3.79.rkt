;2024-07-28
#lang sicp
;Same for this one. I'm a little out of my wheelhouse. I want to learn DFQ soon though.

(define(general-solve-2nd f y0 dy0 dt) 
         (define y (integral (delay dy) y0 dt)) 
         (define dy (integral (delay ddy) dy0 dt)) 
         (define ddy (stream-map f dy y)) 
         y) 
