
;;; SESIÓN 03 - EJERCICIOS 04
;;; =========================
;;; Construir una funcion que dada una lista numérica 
;;; produzca la lista de los cuadrados de la lista inicial.

#lang racket

(define (cuadrados l)
    (if (empty? l)
        '() ; devolvemos una lista vacía cuando l está vacía
        (cons ; creamos una lista concatenando
            (* (car l) (car l)) ; el cuadrado de la cabeza
            (cuadrados (cdr l)) ; con la funcion recursiva en la cola
        )
    )
)

;;; Llamadas de prueba a las funciones
(and (display "(cuadrados (list 1 2 3 4)) = ") (displayln (cuadrados (list 1 2 3 4))))
