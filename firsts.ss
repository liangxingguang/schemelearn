#lang racket
;the function firsts takes one argument,a list, which is either a null list or contains
;only non-empty lists .It builds another list composed of the first S-expression of each
;internal list
(define firsts
  (lambda (x)
    (cond
      ((null? x) (quote ()))
      (else
       (cons (car (car x)) (firsts (cdr x)))))))
;test the firsts function

(define a '((five plums)(four)(eleven green oranges)))
(firsts a)
(set! a '(((five plums) four)
          (eleven green oranges)
          ((no) more)))
(firsts a)
(set! a '((a b) (c d) (e f)))
(firsts a)