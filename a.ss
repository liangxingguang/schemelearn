#lang racket
(define (generate-one-element-at-a-time lst)
  (define (control-state return)
    (for-each
     (lambda (element)
       (call/cc
        (lambda (resume-here)
          (set! control-state resume-here)
          (return element))))
     lst)
    (return 'end))
  (define (generator)
    (call/cc control-state))
  generator)
(define generate-digit
  (generate-one-element-at-a-time '(0 1 2)))
(generate-digit)
(generate-digit)
(generate-digit)
(generate-digit)

