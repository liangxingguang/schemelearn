#lang racket
(cond ((> 3 2) 'greater)
      ((< 3 2) 'less))
(cond ((> 3 3) 'greater)
      ((< 3 3) 'less)
      (else 'equal))
(cond ((assv 'b '((a 1) (b 2))) => cadr)
      (else #f))