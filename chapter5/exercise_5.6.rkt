;2024-08-26
#lang sicp
;  Ben Bitdiddle observes that the Fibonacci machine's controller sequence has an extra save and an
;extra restore, which can be removed to make a faster machine. Where are these instructions?
;The restore and save continue in the after-iter-1 it is restoring hte continue and putting it back in the stack by using save. It is not modifying continue at all so its pointless.
     
