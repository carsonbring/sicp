;2024-08-20
#lang sicp
; Beginning with the data base and the rules you formulated in exercise 4.63, devise a rule for adding ``greats'' to a grandson relationship. This should enable the system to deduce that Irad is the great-grandson of Adam, or that Jabal and Jubal are the great-great-great-great-great-grandsons of Adam. (Hint: Represent the fact about Irad, for example, as ((great grandson) Adam Irad). Write rules that determine if a list ends in the word grandson. Use this to express a rule that allows one to derive the relationship ((great . ?rel) ?x ?y), where ?rel is a list ending in grandson.) Check your rules on queries such as ((great grandson) ?g ?ggs) and (?relationship Adam Irad). 

;; (son Adam Cain)
;; (son Cain Enoch)
;; (son Enoch Irad)
;; (son Irad Mehujael)
;; (son Mehujael Methushael)
;; (son Methushael Lamech)
;; (wife Lamech Ada)
;; (son Ada Jabal)
;; (son Ada Jubal)
(rule (grandson ?n1 ?n2)
      (and (son ?x ?n2)
           (son ?n1 ?x)))

(rule (son ?n1 ?n2)
      (or (son ?n1 ?n2)
          (and (wife ?n1 ?x)
               (son ?x ?n2))))
(rule (end-with-grandson (grandson)))
(rule (end-with-grandson (?x . ?y))
      (end-with-grandson ?y))
(rule ((grandson) ?x ?y)
      (grandson ?x ?y))
;I feel like the order may or may not be correct but this seems like its either the solution or super close
(rule ((great . ?rel) ?x ?y)
      (and
       (end-with-grandson ?rel)
       (son ?x ?z)
       (?rel ?z ?y)
       ))
