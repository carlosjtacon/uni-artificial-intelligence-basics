
;;; SESIÓN 08 - EJERCICIOS 04
;;; =========================
;;; Función que dados una lista y un predicado, presente otra lista con 
;;; todos los elementos de la primera que verifiquen el predicado

#lang racket

(define (verifica lista predicado)
    (if (empty? lista)
        null ; si la lista está vacía devolvemos la lista vacía
        (if (predicado (car lista))
            (cons (car lista) (verifica (cdr lista) predicado)) ; si se verifica el predicado para la cabeza devlvemos la cabeza con las que se verifiquen de la cola
            (verifica (cdr lista) predicado) ; si no solo devolvemos las que se verifiquen de la cola
        )
    )
)

; Definición de predicados de prueba
(define (pred1 x) (and (even? x) (> x 10)))
(define (pred2 x) (and (odd?  x) (> x 10)))
(define (pred3 x) (or (and (odd?  x) (> x 10)) (and (even? x) (> x 10))))

;;; Llamadas de prueba a las funciones
(and (display "(verifica '(1 5 10 15 20) pred1) = ") (displayln (verifica '(1 5 10 15 20) pred1)))
(and (display "(verifica '(1 5 10 15 20) pred2) = ") (displayln (verifica '(1 5 10 15 20) pred2)))
(and (display "(verifica '(1 5 10 15 20) pred3) = ") (displayln (verifica '(1 5 10 15 20) pred3)))