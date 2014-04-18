#lang racket
(define multisubst
  (lambda (new old lat)
    (cond
      ((null? lat) (quote ()))
      (else
       (cond
         ((eq? (car lat) old)
          (cons new (multisubst new old (cdr lat))))
         (else
          (cons (car lat)
                (multisubst new old (cdr lat)))))))))
(define new 'fried)
(define old 'fish)
(define lat '(chips and fish or fish and pried))
(multisubst new old lat)