#lang racket

(require rackunit "simple.rkt")
(require rackunit/text-ui)

(define suma-uno-tests
  (test-suite "suma-uno"
   (test-case
     "suma-uno a"
     (check-equal? (suma-uno 1) 2 "uno es dos")
     (check-not-equal? (suma-uno 2) 4 "dos no es cuatro"))))

; CLI test-ui
(run-tests suma-uno-tests 'verbose)
