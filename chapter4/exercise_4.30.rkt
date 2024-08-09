;2024-08-09
#lang sicp

;a. In the begin expression, each argument will be evaluated with the eval function and since display is a primitive procedure, it's arguments will be strictly evaluated. Because of this strict evaluation the procedure will work as intended.

;b.
;(p1 1) evals to (1 . 2)
;(p2 1) evals to the ('thunk (cons 1 '(2)) env)

;c. The reason why Cy's solution would not affect display is that forcing a primitive procedure is the exact same as just eval-ing it so everything would function the exact same.

;d. I think Cy's soltuion is correct due to the fact that it accounds for non primitive procedures to be evaluated in a correct way.



