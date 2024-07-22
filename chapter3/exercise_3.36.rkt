;2024-07-21
;I'm not going to draw an environment diagram but I will explain what the environment in which
(for-each-except setter inform-about-value constraints)

; is evaluated with the context
(define a (make-connector))
(define b (make-connector))
(set-value! a 10 'user)

; For-each except will not inform any constraitns about the value change since there are no constraints put into effect. 
