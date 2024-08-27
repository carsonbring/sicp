;2024-08-26
#lang sicp
; Hand-simulate the factorial and Fibonacci machines, using some nontrivial input (requiring
;; execution of at least one recursive call). Show the contents of the stack at each significant point in the execution.

;I'll describe what happens for the continue and n stacks since that's really the only important factor of these examples

; (fact 3)
; stack continue : fact-done

;stack continue : fact-after fact-done
; stack n : 3

; stack continue : fact-after fact-after fact-done
;stack n : 2 3

; stack continue : fact-after fact-after fact-after fact-done
;stack n : 1 2 3
; val : 1

; stack continue : fact-after fact-after fact-done
;stack n : 2 3
; val : 1

; stack continue : fact-after fact-done
;stack n : 3
; val : 2


; stack continue :  fact-done
;stack n : 
; val : 6
