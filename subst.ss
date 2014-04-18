#lang racket
(define subst
  (lambda(new old lat)
    (cond
      ((null? lat)(quote ()))
      (else (cond
              ((eq? (car lat) old)
               (cons new (cdr lat)))
              (else (cons (car lat)
                          (subst new old (cdr lat))))
              ))
     )))
;test the function subst
(define new 'topping)
(define old 'fudge)
(define lat '(ice cream with fudge for dessert))
(subst new old lat)