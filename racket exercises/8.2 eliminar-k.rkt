
;;; SESIÓN 08 - EJERCICIOS 02
;;; =========================
;;; funcion eliminar las k primeras que tome una lista y un símbolo y 
;;; un número k y elimine las k primeras apariciones del símbolo en la lista, si las hubiese

#lang racket

(define (eliminar list sym k) 
    (if (empty? list)
        null  ; cuando la lista está vacía devolvemos la lista vacía
        (if (and (> k 0) (= (car list) sym)) ; si la cabeza es el símbolo y además k es mayor que 0
            (eliminar (cdr list) sym (- k 1)) ; llamamos a eliminar recursivamente sin la cabeza restando k-1
            (cons (car list) (eliminar (cdr list) sym k)) ; si no es el símbolo construimos con la cabeza y eliminar recursivamente de la cola sin restar 1 a k
        )
    )
)

;;; Llamadas de prueba a las funciones
(and (display "(eliminar '(1 2 1 3 1 4) 1 2) = ") (displayln (eliminar '(1 2 1 3 1 4) 1 2)))
(and (display "(eliminar '(1 2 1 3 1 4) 2 3) = ") (displayln (eliminar '(1 2 1 3 1 4) 2 3)))