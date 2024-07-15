; 2024-07-14

;Lots of diagram drawing in this section. I'm just goign to describe the difference.

; (car z1) and (cdr z1) both point to the same object in memory since it was created using (cons x x), meaning that modifying (car z1) with set-car! will have an effect on (cdr z1)
; Since z2 was initialized using (cons (list 'a 'b) (list 'a 'b)), the car and the cdr both have different spots in memory. This means that changing (car z2) with set-car! will not have an effect on the second list. 
