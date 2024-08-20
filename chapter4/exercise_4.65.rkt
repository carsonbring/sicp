;2024-08-19
#lang sicp

;Cy D. Fect, looking forward to the day when he will rise in the organization, gives a query to find all the wheels (using the wheel rule of section 4.4.1):

(wheel ?who)

;To his surprise, the system responds

;;; Query results:
(wheel (Warbucks Oliver))
(wheel (Bitdiddle Ben))
(wheel (Warbucks Oliver))
(wheel (Warbucks Oliver))
(wheel (Warbucks Oliver))

;Why is Oliver Warbucks listed four times?
;wheel implmentation
(rule (wheel ?person)
      (and (supervisor ?middle-manager ?person)
           (supervisor ?x ?middle-manager)))
;The reason why Oliver is listed 4 times is because the line (supervisor ?middle-manager ?person) Gets all of the frames from the db that fufills that line. Since there are 4 middle managers that are supervised by Oliver, there will be 4 frames returned in the output stream (also because each of the middle managers have people answering to them) 
