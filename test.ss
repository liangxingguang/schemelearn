#lang racket
(begin (define x (vector 10 20))
       (define y x)
       (vector-set! x 1 11)
       (vector-ref y 0)
       (display x)
       (newline)
       (display y))

(define <o1> (vector 10 20))
(begine (define x <o1>))