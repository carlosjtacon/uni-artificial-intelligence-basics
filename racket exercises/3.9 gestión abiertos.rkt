
;;; SESIÓN 03 - EJERCICIOS 09
;;; =========================
;;; Función que dada una lista (ABIERTOS) y una función sucesores [pasando la función por parámetro a esta]
;;; gestione la modificación de la lista. 
;;; A) como en búsqeda en anchura 
;;; B) como en profundidad

#lang racket

; A) gestión en anchura
(define (anchura l f)
    (append (cdr l) (f (car l))) ; en anchura los abiertos se añaden al final de la lista
)

; B) gestión en profundidad
(define (profundidad l f)
    (append (f (car l)) (cdr l)) ; en profundidad los abiertos se añaden al principio de la lista
)

; funcion dada sobre cómo generar los hijos (operaciones)
(define (hijos n)
    (list (- n 1) (+ n 1))
)

;;; Llamadas de prueba a las funciones
(and (display "Los hijos de 1 son 0/2, los añade al final (anchura '(1 2 3) hijos) = ") (displayln (anchura '(1 2 3) hijos)))
(and (display "Los hijos de 2 son 1/3, los añade al principio (profundidad '(1 2 3) hijos) = ") (displayln (profundidad '(2 2 3) hijos)))