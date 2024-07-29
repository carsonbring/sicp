;2024-07-28
#lang sicp
;Had to cheat for this one, don't know dfq to the level required to complete this problem
(define (solve f y0 dt)
  (define y (integral (delay dy) y0 dt))
  (define dy (stream-map f y))
  y)

  
 (define (solve-2nd a b dt y0 dy0) 
         (define y (integral (delay dy) y0 dt)) 
         (define dy (integral (delay ddy) dy0 dt)) 
         (define ddy (add-streams (scale-stream dy a) (scale-stream y b))) 
         y) 
