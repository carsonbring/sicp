;2024-08-18
#lang sicp

;; Exercise 4.63.  The following data base (see Genesis 4) traces the genealogy of the descendants of Ada back to
;; Adam, by way of Cain:

;; (son Adam Cain)
;; (son Cain Enoch)
;; (son Enoch Irad)
;; (son Irad Mehujael)
;; (son Mehujael Methushael)
;; (son Methushael Lamech)
;; (wife Lamech Ada)
;; (son Ada Jabal)
;; (son Ada Jubal)

;; Formulate rules such as ``If S is the son of F, and F is the son of G, then S is the grandson of G'' and ``If W is the
;; wife of M, and S is the son of W, then S is the son of M'' (which was supposedly more true in biblical times than today) that will enable the query system to find the grandson of Cain; the sons of Lamech; the grandsons of Methushael. (See exercise 4.69 for some rules to deduce more complicated relationships.) 

(rule (grandson ?n1 ?n2)
     (and (son ?x ?n2)
      (son ?n1 ?x)))

(rule (son ?n1 ?n2)
      (or (son ?n1 ?n2)
          (and (wife ?n1 ?x)
               (son ?x ?n2))))
