
;;; SESIÓN 05 - EJERCICIOS 07
;;; =========================
;;; Método para comprobar si una palabra está dentro de otra dada: alfa > alfalfa.

#lang racket

(define (subpalabra p1 p2 n) ; n es la posicion desde la cual comprobamos
    (if (>= (string-length p2) (+ n (string-length p1))) ; si la suma de n con la longitud de p1 es mayor a p2 no contiene
        (if (equal? p1 (substring p2 n (+ n (string-length p1)))) ; si p1 es igual a la substring de p2 desde n 
            true ; entonces contiene 
            (subpalabra p1 p2 (+ 1 n)) ; si no comprobamos si contiene incrementando la posicion n
        )
        false
    )
)

;; Llamadas de prueba a las funciones
(and (display "(subpalabra alfa alfa) = ") (displayln (subpalabra "alfa" "alfa" 0)))
(and (display "(subpalabra alfa alfalfa) = ") (displayln (subpalabra "alfa" "alfalfa" 0)))
(and (display "(subpalabra palabra apalabro) = ") (displayln (subpalabra "palabra" "apalabro" 0)))
(and (display "(subpalabra palabra diccionario) = ") (displayln (subpalabra "palabra" "diccionario" 0)))