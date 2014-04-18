#lang racket
;(define id expr)
;(define (head args) body ...+)
;         head=id
;              |(head args)

(define x 10)
x
(define (f x)
  (+ x 1))
(f 10)
(define ((b x) [ y 10])
  (+ x y))
(b 10)
;((b 20)[10 10])
((b 20)10)
(define-values (j h z) (values 1 2 3))
j
h
z
(define-values (j1 h1)
  (values 
   (lambda (x n)
     (+ x n)
   )
  (lambda (x n)
    (+ x n))))
j1
h1
(define-values (x1 y1)
  (values 1 (list 1 2 3 4)))
x1
y1
(do ((vec (make-vector 5))
       (i 0 (+ i 1)))
    ((= i 5) vec)
    (vector-set! vec i i))