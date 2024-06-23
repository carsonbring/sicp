#lang sicp
(display (list 'a 'b 'c))
(newline)
;; (a b c)
(display (list (list 'george)))
(newline)
;; ((george))
(display (cadr '((x1 x2) (y1 y2))))
(newline)
;; (y1 y2)
(display (pair? (car '(a short list))))
(newline)
;; #f
(memq 'red '((red shoes) (blue socks)))
(newline)
;; f
(memq 'red '(red shoes blue socks))
(newline)
;; (red shoes blue socks)
