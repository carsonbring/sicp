;2024-08-27
#lang sicp

;The simulator can be used to help determine the data paths required for implementing a machine
;; with a given controller. Extend the assembler to store the following information in the machine model: 
;; * a list of all instructions, with duplicates removed, sorted by instruction type (assign, goto, and so on);

;; * a list (without duplicates) of the registers used to hold entry points (these are the registers referenced by goto instructions);

;; * a list (without duplicates) of the registers that are saved or restored;

;; * for each register, a list (without duplicates) of the sources from which it is assigned (for example, the sources
;;  for register val in the factorial machine of figure 5.11 are (const 1) and ((op *) (reg n) (reg val))). 

;; Extend the message-passing interface to the machine to provide access to this new information. To test your
;; analyzer, define the Fibonacci machine from figure 5.12 and examine the lists you constructed. 
;this one is really hard and a lot of work so I'll come back to this later
