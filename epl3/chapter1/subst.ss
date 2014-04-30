#lang racket
(define subst
  (lambda (new old slist)
    (define subst-in-s-exp
      (lambda (new old sexp)
        (if (symbol? sexp)
            (if (eqv? sexp old)
                new
                sexp)
            (subst new old sexp))))
    (if (null? slist) 
        '()
        (cons 
         (subst-in-s-exp new old (car slist))
         (subst new old (cdr slist))))))

(subst 'ae 'b '(a b d b g b e d b))
(symbol? -1)