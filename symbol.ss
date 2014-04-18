#lang racket
(define (list->symbol lso)
  (string->symbol (list->string (reverse lso))))
(define (char-in c . ls)
  (let loop ([ls0 ls])
    (if (null? ls0)
        #f
        (or (char=? c (car ls0))
            (loop (cdr ls0))))))
(define (read-words fname)
  (with-input-from-file fname
    (lambda()
      (let loop ([w '()] [wls '()])
        (let ([c (read-char)])
          (cond 
            ([eof-object? c]
             (reverse (if (pair? w)
                          (cons (list->symbol w) wls)
                          wls)))
            ([char-in c #\space #\linefeed #\tab #\, #\. #\ #\( #\) #\= #\? #\! #\; #\:]
             (loop '() (if (pair? w)
                           (cons (list->symbol w) wls)
                           wls)))
            (else 
             loop (cons (char-downcase c) w) wls)
            ))))))
(define (sort-by-frequency al)
  (sort al (lambda (x y)
             (> (cdr x) (cdr y)))))
(define (wc fname)
  (let ([wh (make-hash)])
    (let loop ([ls (read-words fname)])
      (if (null? ls)
          (sort-by-frequency (hash->list wh))
          (begin 
            (hash-update wh (car ls) (+ 1 (hash-map wh (car ls) 0)))
            (loop (cdr ls)))))))
(wc "test.ss")