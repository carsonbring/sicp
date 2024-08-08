;2024-08-08
#lang sicp

;Eval uses actual-value rather than eval to evaluate the operator before passing it to apply, in order to force the value of the operator. Give an example that demonstrates the need for this forcing.

;An example where this may be necessary is if you had a procedure that displayed a procedure and since the procedure is an operand, the result wouldn't have been evaluated. The force completes this operation and prints out what th euser wants to see. 
