;;the interpreter treats ''something as (quote (quote something))
;; so this means when (car) is called on ''something it returns 'quote.
#lang sicp
(car ''something)
