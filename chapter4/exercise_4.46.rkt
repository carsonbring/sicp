;2024-08-13
#lang sicp

;The evaluators in sections 4.1 and 4.2 do not determine what order operands are evaluated in. We will see that the amb evaluator evaluates them from left to right. Explain why our parsing program wouldn't work if the operands were evaluated in some other order.

; The reason why it matters that the amb evaluator evaluates from left to right because it needs to have a fair chance of picking the first value in the amb evaluator over the recursive option
