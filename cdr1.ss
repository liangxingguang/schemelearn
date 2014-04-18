#lang racket
(define l '((b) (x y) ((c))))
(car (cdr l))
(set! l '((b) (x y z) ((c))))
(cdr (cdr l))
(set! l '(a (b (c)) d))
;(cdr (car l))