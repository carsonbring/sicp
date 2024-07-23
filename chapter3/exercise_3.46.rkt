;2024-07-22

;Suppose that we implement test-and-set! using an ordinary procedure as shown in the text, without attempting to make the operation atomic. Draw a timing diagram like the one in figure 3.29 to demonstrate how the mutex implementation can fail by allowing two processes to acquire the mutex at the same time.

;I'm not going to draw a timing diagram but I will give an example of how it would fail.

;2 people call acquire..
;Both calls (car cell) is false...
; both calls set car to true and return false.
;This is a catastrophic failure because both p functions will be executing at the same time. 
