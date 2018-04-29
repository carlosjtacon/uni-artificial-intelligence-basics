
;;; SESIÓN 02 - EJERCICIOS 02
;;; =========================
;;; Diseñar dos funciones tales que al recibir dos números naturales 
;;; produzcan el cociente y su resto de la división de ambos.
;;; 
;;; Ejemplo: 7 / 5 = 2
;;; | - - - - - - - | 7
;;; | - - - - -|- - | 5 + 2

#lang racket

;;; Función que calcula mediante recursión cuantas veces cabe 
;;; el divisor (b) en el dividendo (a)
(define (cociente a b)
    (if (< a b) 
        0 ; cuando a es menor a b ya no cabe más veces devolvemos 0
        (+ 1 (cociente (- a b) b)) ; sumamos que cabe 1 vez y le sumamos cuantas 
        ; veces cabe en la misma función mediante recursión con a=a-b, y b=b
    )
)

;;; Función que calcula mediante recursión cuanto sobra de la división
(define (resto a b)
    (if (< a b) 
        a ; si a es menor a b no cabe, a simboliza por cuánto no cabe
        (resto (- a b) b) ; mientras quepa seguimos recursion con a=a-b y b=b, en algun momento devolveremos a
    )
)

;;; Llamadas de prueba a las funciones
(and (display "(cociente 7 5) = ") (displayln (cociente 7 5)))
(and (display "(resto 7 5) = ") (displayln (resto 7 5)))
(and (display "(cociente 11 5) = ") (displayln (cociente 11 5)))
(and (display "(resto 11 5) = ") (displayln (resto 11 5)))
(and (display "(cociente 10 2) = ") (displayln (cociente 10 2)))
(and (display "(resto 10 2) = ") (displayln (resto 10 2)))
