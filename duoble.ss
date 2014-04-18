#lang racket
(define double-any
  (lambda (f x)
    (f x x)))
(double-any +  3)
(define list (lambda x x))
(list 1 2 3 4 5 6)
(list (vector 1 2 3 4 5 6 7))
;(define var0
; (lambda (var1 ... varn)
;  e1 e2 ..)) === (define (var0 var1 ... varn) e1 e2 ...)

;(define var0 
; (lambda varr e1 e2 ...)) === (define (var0 . varr) e1 e2 ...)

;(define var0 (lambda (var1 ... varn . varr) e1 e2)) ==(define (var0 var1 ... varn . varr))
(define doubler
  (lambda (f)
    (lambda (x) (f x x))))
(define double (doubler +))
(double 13/2)
(define double-cons (doubler cons))
(double-cons 'a)
(define double-any1
  (lambda (f x)
    ((doubler f) x)))
;(double-any double-any double-any)

(define cadr
  (lambda (x)
    (car (cdr x))))
(define cddr 
  (lambda (x)
    (cdr (cdr x))))
(define compose
  (lambda (p1 p2)
    (lambda (x)
      (p1 (p2 x)))))
(define mycadr 
  (lambda(x)
    ((compose car cdr) x)))
(define mycddr
  (lambda (x)
    ((compose cdr cdr) x)))
(mycadr '(1 2 3 4))
(mycddr '(1 2 3 4))
(define mycaaar
  (lambda (x)
    (car ((compose car car) x))))
(mycaaar '(((6 5 4 3 2 1) 7) 8 9))
(define mycaadr
  (lambda (x)
    (car ((compose car cdr) x))))
(mycaadr '(9 (1 2 3 4) 8))