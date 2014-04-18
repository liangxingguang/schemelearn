#lang racket
;(require atom)
(null? (quote ()))
(define l '(a b c))
(null? l)
(define a 'spaghetti)
(null? a)
(set! a 'Harry)
(atom? a)