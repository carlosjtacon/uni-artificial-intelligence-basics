
;;; SESIÓN 03 - EJERCICIOS 06
;;; =========================
;;; Construir una funcion que dada una lista numérica 
;;; compruebe que sus términos formen una progresión aritmética.
;;; La progresión aritmética es una lista de números en la cual cada número es el anterior más la unidad.

#lang racket

(define (progresion l)
    (if (= 1 (length l))
        true ; si solo tiene un elemento consideramos que si forma una progresión
        (and ; si no, comprobamos que el segundo = 1+primero
            (= (+ 1 (car l)) (cadr l))
            (progresion (cdr l)) ; y además que siga la progresión con la cola
        )
    )
)

;;; Llamadas de prueba a las funciones
(and (display "(progresion (list 1 2 3)) = ") (displayln (progresion (list 1 2 3))))
(and (display "(progresion (list 1 2 4)) = ") (displayln (progresion (list 1 2 4))))