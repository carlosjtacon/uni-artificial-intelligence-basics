
;;; SESIÓN 03 - EJERCICIOS 01
;;; =========================
;;; Función que emule la primitiva longitiud:
;;; que tome una lista dada y produzca el número de sus componentes
;;; Ejemplo (length (list 'a 'e 'i 'o 'u)) -> 5
;;;
;;; Operaciones disponibles con listas: empty?, quote/', cons, list, append, car/first, rest/cdr, member, reverse

#lang racket

(define (len l) 
    (if (empty? l)
        0 ; cuando la lista ya está vacía devolvemos (sumamos) 0
        (+ 1 (len (cdr l))) ; vamos sumando 1 y recursión con la cola de la lista
    )
)

;;; Llamadas de prueba a las funciones
(and (display "(len (list 'a 'e 'i 'o 'u)) = ") (displayln (len (list 'a 'e 'i 'o 'u))))
(and (display "(len (list 'a 'e 'i 'o)) = ") (displayln (len (list 'a 'e 'i 'o))))