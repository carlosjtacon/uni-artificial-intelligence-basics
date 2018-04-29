
;;; SESIÓN 05 - EJERCICIOS 06
;;; =========================
;;; Método para comprobar si una palabra es o no palíndromo.

#lang racket

(define (palindromo p)
    (if (>= 1 (string-length p)) ; si la longitud de palabra es menor o igual a 1
        true ; entonces sí es palíndromo
        (if (equal? (substring p 0 1) (substring p (- (string-length p) 1))) ; si no si la primera y última letra son iguales, comprobamos que quitándolas también es palíndromo
            (palindromo (substring p 1 (- (string-length p) 1)))
            false ; si no son iguales no es palíndromo
        )
    )
)

;; Llamadas de prueba a las funciones
(and (display "(palindromo asasa) = ") (displayln (palindromo "asasa")))
(and (display "(palindromo palabra) = ") (displayln (palindromo "palabra")))
(and (display "(palindromo reconocer) = ") (displayln (palindromo "reconocer")))
(and (display "(palindromo no palindromo) = ") (displayln (palindromo "no palindromo")))