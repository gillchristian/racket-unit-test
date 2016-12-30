#lang racket

; pertenece: retorna un booleano dependiendo si un cierto valor es nodo del arbol
(define pertenece (lambda (nodo arbol)
  (if (null? arbol) #f
    (if (equal? nodo (car arbol)) #t
      (or (pertenece nodo (cadr arbol)) (pertenece nodo (caddr arbol)) )))))

; pre-orden: retorna una lista con los nodos del arbol listados en preorden
(define pre-orden (lambda (arbol)
  (if (null? arbol) '()
    (cons (car arbol) (append (pre-orden (cadr arbol)) (pre-orden (caddr arbol)))))))

(provide pertenece pre-orden)
