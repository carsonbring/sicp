;2024-08-13
#lang sicp

;With the grammar given above, the following sentence can be parsed in five different ways: ``The professor lectures to the student in the class with the cat.'' Give the five parses and explain the differences in shades of meaning among them.

;(sentence (simple-noun-phrase (article the) (noun professor))
; (verb-phrase
;  (verb-phrase
;   (verb-phrase
;    (verb lectures)
;    (prep-phrase (prep to)
;      (simple-noun-phrase (article the) (noun student))))
;   (prep-phrase (prep in)
;    (simple-noun-phrase (article the) (noun class))))
;  (prep-phrase (prep with)
;   (simple-noun-phrase (article the) (noun (class))))))


;Here is an example of one. This is pretty tedious so I'm just going to describe some of the different ways it could be parsed.
; Instead of having three different verb-phrases, It could parse the (simple-noun-phrase (article the) (noun student) as a noun phrase instead of a simple noun phrase. This would then allow for prep phrases to be nested in multiple noun phrases. 
