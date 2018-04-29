
;;; SESIÓN 08 - EJERCICIOS 01
;;; =========================
;;; Función eliminar que tome una lista y un símbolo y que produzca la lista 
;;; con todas las apariciones del símbolo eliminadas

#lang racket

(define (eliminar list sym) 
    (if (empty? list)
        null ; cuando la lista está vacía devolvemos la lista vacía
        (if (= (car list) sym) ; si la cabeza es el símbolo
            (eliminar (cdr list) sym) ; llamamos a eliminar recursivamente sin la cabeza
            (cons (car list) (eliminar (cdr list) sym)) ; si no es el símbolo construimos con la cabeza y eliminar recursivamente de la cola
        )
    )
)

;;; Llamadas de prueba a las funciones
(and (display "(eliminar '(1 2 1 3 1 4) 1) = ") (displayln (eliminar '(1 2 1 3 1 4) 1)))
(and (display "(eliminar '(1 2 1 3 1 4) 2) = ") (displayln (eliminar '(1 2 1 3 1 4) 2)))