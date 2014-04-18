#lang racket
(require racket/stxparam)
(define-syntax-parameter f (syntax-rules()
                             [(n) (values n)]))
(define-syntax foo
  (syntax-rules ()
    [(_ l a ...)
     (syntax-parameterize ([f (syntax-rules ()
                                [(_ n) (l 'f n)])])
                          (list a ...))]))
(define (x3 t1 t2)(cons t1 t2))
(define (arb)(cons 'a 'b))
(foo x3 (f 1) (f 2) (arb)
     (let ([n 3]) (f n)))
(define-syntax foo1
  (syntax-rules()
    [(_ l (f a) more ...)
     (let-syntax ([f (syntax-rules()
                       [(_ n) (l 'f n)])])
       (list (f a) more ...))]))
(foo x3 (f 1) (f 2) (arb)(f 3))
(define-syntax-parameter it (syntax-rules()))
(define-syntax aif
  (syntax-rules()
    [(aif test then else)
     (let ([t test])
       (syntax-parameterize ([it (syntax-id-rules () [_ t])])
                            (if t then else)))]))

