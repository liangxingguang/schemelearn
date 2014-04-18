#lang racket
(define l '(a b c))
(cdr l)
(set! l '((a b c) x y z))
(cdr l)
(set! l '(hamburger))
(cdr l)
(set! l '((x) t r))
(cdr l)
;(cdr 'hamburger);it is wrong because cdr is defined only for non-empty list 
                ;and the 'hamburger is atom 
;(cdr '());wrong because cdr is defined only for non-empty list