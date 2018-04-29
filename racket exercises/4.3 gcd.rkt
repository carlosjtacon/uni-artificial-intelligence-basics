
;;; SESIÓN 04 - EJERCICIOS 03
;;; =========================
;;; Función que imite a gcd, es decir, que dados varios números naturales, calcule su máximo común denominador
;;; usando la propiedad: si un numero natural divide a otros dos, dividirá a su diferencia
;;; |---|---|---|---|---|     --> 5
;;; |---|---|---|             --> 3
;;;             |---|---|     --> 2 mcd(5,3)=mcd(3,2)=mcd(2,1)=mcd(1)
;;;
;;; mcd 12 y 9: 12-9=3 mcd(12,9)=mcd(9,3)=mcd(6,3)=mcd(3)=3 [Si no llega el mcd es 1, primos entre sí]

#lang racket

(define (mcd n m)
    (cond ((= n m) n) ; si n y m es el mismo número, ese será el mcd
          ((> m (- n m)) (mcd m (- n m))) ; si m es mayor a n-m el mcd será el mcd de m y n-m
          (else (mcd (- n m) m)) ; si m es menor a n, el mcd será el mcd de n-m y m
    )
)

;;; Llamadas de prueba a las funciones
(and (display "(mcd 5 3) = ") (displayln (mcd 5 3)))
(and (display "(mcd 12 9) = ") (displayln (mcd 12 9)))
(and (display "(mcd 12 6) = ") (displayln (mcd 12 6)))
(and (display "(mcd 15 10) = ") (displayln (mcd 15 10)))