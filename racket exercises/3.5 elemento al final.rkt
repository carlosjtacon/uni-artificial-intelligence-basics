
;;; SESIÓN 03 - EJERCICIOS 05
;;; =========================
;;; Construir una funcion que dada una lista y un elemento 
;;; añada el elemento al final de la lista

#lang racket

(define (alfinal e l) ; para poner un elemento al final de la cola basta con concatenar 
    (reverse (cons e (reverse l))) ; el elemento con la lista reversa y volver a revertir
)

;;; Llamadas de prueba a las funciones
(and (display "(alfinal 1 (list 4 3 2)) = ") (displayln (alfinal 1 (list 4 3 2))))