
;;; SESIÓN 08 - EJERCICIOS 06
;;; =========================
;;; Estudie si son correctas las siguientes definiciones y en caso afirmativo 
;;; calcule el resultado para los primeros valores de n

#lang racket

;;; A) 
;;; n no decrece, siempre va a más
;;; n0=0, n1=1, n2=1+n4m n3=1+n4+n5, n4=1+n4+n5+n6
(define (g n) 
    (if (< n 2) 
        n 
        (+ (g (- n 1)) (g (+ n 2)))
    )
)
;;; Llamadas de prueba a las funciones
(g 0) (g 1) (g 2) (g 3) (g 4)


;;; B)
;;; incorrecto: no else(?)-> error, if (/ n 2) no booleano(?)-> siempre pasa al if
;;; n0=?, n1=1, n2=?
(define (f n) 
    (if (= n 1) 
        1 
        (if (even? n) 
            (if (/ n 2) 
                (f (+ 1 (* 3 n)))
            )
        )
    )
)
;;; Llamadas de prueba a las funciones
(f 0) (f 1) (f 2) (f 3) (f 4)