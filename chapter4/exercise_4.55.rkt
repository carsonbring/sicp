;2024-08-18
#lang sicp
;Exercise 4.55.  Give simple queries that retrieve the following information from the data base:

;; a. all people supervised by Ben Bitdiddle;

;; b. the names and jobs of all people in the accounting division;

;; c. the names and addresses of all people who live in Slumerville. 

(supervisor ?x (Ben Bitdiddle))

(job ?x (accounting . ?y))

(address ?x (Slumerville . ?y))


