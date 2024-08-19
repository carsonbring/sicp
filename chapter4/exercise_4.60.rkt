;2024-08-18
#lang sicp

;; Exercise 4.60.  By giving the query 

;; (lives-near ?person (Hacker Alyssa P))

;; Alyssa P. Hacker is able to find people who live near her, with whom she can ride to work. On the other hand, when she tries to find all pairs of people who live near each other by querying

;; (lives-near ?person-1 ?person-2)

;; she notices that each pair of people who live near each other is listed twice; for example,

;; (lives-near (Hacker Alyssa P) (Fect Cy D))
;; (lives-near (Fect Cy D) (Hacker Alyssa P))

;; Why does this happen? Is there a way to find a list of people who live near each other, in which each pair appears only once? Explain. 

;This happens because of the two address lines in the and statement. It will return all of the variables for those that are true
;I don't think there is a way to make it so it only prints out one with what I know so far in the chapter. It may prove to be possible later on, but we will see. 

(rule (lives-near ?person-1 ?person-2)
      (and (address ?person-1 (?town . ?rest-1))
           (address ?person-2 (?town . ?rest-2))
           (not (same ?person-1 ?person-2))))