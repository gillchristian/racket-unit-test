#lang racket

; pertenece corrobora que un valor dado pertenezca a cierto arbol
(define pertenece (lambda (nodo arbol)
  (if (null? arbol) #f
    (if (equal? nodo (car arbol)) #t
      (or (pertenece nodo (cadr arbol)) (pertenece nodo (caddr arbol)) )))))

; pre-orden de un arbol dado
(define pre-orden (lambda (arbol)
  (if (null? arbol) '()
    (cons (car arbol) (append (pre-orden (cadr arbol)) (pre-orden (caddr arbol)))))))

(provide pertenece pre-orden)
