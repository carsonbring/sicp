;2024-08-04
#lang sicp

;Draw diagrams of the environment in effect when evaluating the expression <e3> in the procedure in the text, comparing how this will be structured when definitions are interpreted sequentially with how it will be structured if definitions are scanned out as described. Why is there an extra frame in the transformed program? Explain why this difference in environment structure can never make a difference in the behavior of a correct program. Design a way to make the interpreter implement the ``simultaneous'' scope rule for internal definitions without constructing the extra frame.

;Not going to draw anthing but I will explain why the difference occurs
;The reason why this happens is due to the fact that the way let is defined allows for an internal env to be created. 
