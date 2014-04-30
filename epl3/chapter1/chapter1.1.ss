#lang racket
(define occur-free?
  (lambda (val exp)
    (cond
      [(symbol? exp) (eqv? val exp)]
      [(eqv? 'lambda (car exp))
       (and 
        (not (eqv? val (car (cadr exp))))
        (occur-free? val (caddr exp)))]
      [else
       (or 
        (occur-free? val (car exp))
        (occur-free? val (cadr exp)))])))
(occur-free? 'x 'x)