
;;; SESIÓN 06 - EJERCICIOS 01
;;; =========================
;;;
;;; Colapso aleatorio:
;;; ------------------
;;; Dado n ∈ ℕ elegir un número al azar menor que él, otro más pequeño que el resultado y así hasta llegar a 0.
;;; 
;;; A) Función que produzca la lista de números resultados del proceso.
;;; B) Función que, dados n,m ∈ ℕ calcule la media aritmética a aplicar la función (A) a n, m veces. 
;;;    (La media del tamaño de las listas que resultan.)
;;; C) Función que mida la diferencia entre el resultado de la función de (B) y la n, para 
;;;    estudiar cómo se comporta la función de (B) al crecer el nº n.
;;; D) Función que mida la diferencia entre el valor de la función de (B) y el de la suma 1+1/2+1/3+1/4+...+1/n
;;;    (para estudiar su diferencia al crecer m).

#lang racket

;;; A) Función que produzca la lista de números resultados del proceso.
(define (a_lista_aleatorios n)
    (if (= n 0)
        '(0) ; si n es 0 añadimos 0
        (cons n (a_lista_aleatorios (random 0 n))) ; construimos una lista con n como cabeza y la lista resultante de la recursividad con un numero aleatorio menor que n
    )
)

;;; B) Función que, dados n,m ∈ ℕ calcule la media aritmética del tamaño de las listas que 
;;;    resultan, al aplicar la función (A) a n, m veces. 
(define (b_media n m maux)
    (if (= maux 0)
        0 ; cuando m auxiliar es 0 devolvemos 0, hemos terminado
        (+ ; sumatorio recursivo de la media restando 1 a m (aux)
            (b_media n m (- maux 1)) 
            (/ (length (a_lista_aleatorios n)) m) ; tamaño de la lista / m
        )
    )
)

;;; C) Función que mida la diferencia entre el resultado de la función de (B) y la n, para 
;;;    estudiar cómo se comporta la función de (B) al crecer el nº n.
(define (c_diferencia n m)
    (- n (b_media n m m))
)

;;; D) Función que mida la diferencia entre el valor de la función de (B) y el de la suma 1+1/2+1/3+1/4+...+1/n
;;;    (para estudiar su diferencia al crecer m).
(define (d_diferencia n m)
    (- (b_media n m m) (sumatorio n))
)

(define (sumatorio n)
    (if (= n 1)
        1 ; cuando llegamos a n=1 devolvemos 1
        (+ 
            (/ 1 n) ; si no sumamos 1/n
            (sumatorio (- n 1)) ; con el sumatorio de n-1
        )
    )
)

;;; Llamadas de prueba a las funciones
(and (display "(a_lista_aleatorios 10) = ") (displayln (a_lista_aleatorios 10)))
; si aumentamos m la media se aproximará a 4 para n = 10
(and (display "(b_media 10 100 100) = ") (displayln (b_media 10 100.0 100.0)))
; cuanto más mayor m, más se aproxima más a 6 la mitad mas uno
(and (display "(c_diferencia 10 100) = ") (displayln (c_diferencia 10 100.0)))
; cuanto más mayor m, más se aproxima a 1
(and (display "(d_diferencia 10 100) = ") (displayln (d_diferencia 10 100.0)))