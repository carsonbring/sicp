;2024-09-15
#lang sicp

;; Exercise 5.32.  Using the preserving mechanism, the compiler will avoid saving and restoring env around the
;; evaluation of the operator of a combination in the case where the operator is a symbol. We could also build such optimizations into the evaluator. Indeed, the explicit-control evaluator of section 5.4 already performs a similar optimization, by treating combinations with no operands as a special case.

;; a. Extend the explicit-control evaluator to recognize as a separate class of expressions combinations whose operator
;; is a symbol, and to take advantage of this fact in evaluating such expressions.
This would simply modify the explicit control evaluator to have a is-symbol test and if the operand was a symbol, it would go to a register that wouldn't restore or save the env variables.
;; b. Alyssa P. Hacker suggests that by extending the evaluator to recognize more and more special cases we could
;; incorporate all the compiler's optimizations, and that this would eliminate the advantage of compilation altogether.
;; What do you think of this idea?
The interpreter has to figure out the strcture of the code each time it runs, and adding more special cases will complicate the process of evaluation for the non-special cases by adding more checks, which would only increase interpreter speed. 
