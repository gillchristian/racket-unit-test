#lang racket

(require rackunit "arbol.rkt")
(require rackunit/text-ui)

; arboles para reutilizar en los tests de arboles
(define incompleto '(1 ( 2 () ( 3 ()  ())) ( 4 ( 5 () ()) () )))

; arbol binario completo de 4 niveles
;                 1
;       2                    3
;  4        5          6          7
;8  9    10   11    13   14    15   16
(define completo '(1
  (2 (4 (8 () ()) (9 () ())) (5 (10 () ()) (11 () ())))
  (3 (6 (13 () ()) (14 () ())) (7 (15 () ()) (16 () ())))))

; arbol invalido
(define invalido '(5 (8 ())))

(define tests-pertenece
  (test-suite "pertenece"
    (test-case "arbol incompleto"
      (check-true (pertenece 5 incompleto) "valor existente")
      (check-false (pertenece 10 incompleto) "valor inexistente"))
    (test-case "arbol completo"
      (check-true (pertenece 16 completo) "valor existente")
      (check-false (pertenece 25 completo) "valor inexistente"))
    (test-case "arbol invalido"
      (check-exn exn:fail:contract? (lambda () (pertenece 10 invalido)) "error"))))

; valores para tests de pre-orden

(define actual-inc (pre-orden incompleto))
(define esperado-inc '(1 2 3 4 5))

(define actual-comp (pre-orden completo))
(define esperado-comp '(1 2 4 8 9 5 10 11 3 6 13 14 7 15 16))

(define tests-pre-orden
  (test-suite "pre-orden"
    (test-case "arbol incompleto"
      (check-equal? actual-inc esperado-inc))
    (test-case "arbol completo"
      (check-equal? actual-comp esperado-comp))))

(run-tests tests-pertenece 'verbose)
(run-tests tests-pre-orden 'verbose)
