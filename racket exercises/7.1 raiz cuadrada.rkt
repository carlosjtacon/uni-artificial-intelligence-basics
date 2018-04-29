
;;; SESIÓN 07 - EJERCICIOS 01
;;; =========================
;;;
;;; Algoritmo babilonio de cálculo de raíces
;;; ----------------------------------------
;;; √2 = +-2 , √25 = +-5 , √8 ∉ ℕ , √2 ∉ ℕ.
;;; 
;;; Cualquier raíz que sea un numero natural exacto también es racional.
;;; √2 no existe en m/n. todo m/n es finito o periódico al expresarlo en cifras decimales.
;;; 
;;; (*) aproximar el área de un rectángulo a un cuadrado
;;;  3 área 
;;;  R1 -> 1 x 3
;;;  R2 -> 3/2 x (1+3)/2=2
;;;  R3 -> 3/((3/2+2)/2) x (3/2+2)/2
;;; 
;;; @ https://es.wikipedia.org/wiki/Cálculo_de_la_raíz_cuadrada#Algoritmo_babilónico
;;; @ https://johncarlosbaez.wordpress.com/2011/12/02/babylon-and-the-square-root-of-2/
;;; 
;;; 1) programa scheme que implemente el algoritmo babilonio de cálculo de raíces cuadradas
;;; 2) algo parecido con raíces cúbicas?
;;; 3) algo parecido con raíces n-sigmas?
;;; x) programa o función que tenga como entradas n ∈ ℕ y m ∈ ℝ+ y produzca como salida un número s tal que |s - √n| < m
;;;    (parametrizar el número y el error)

#lang racket

; 1) Algoritmo babilonio de cálculo de raíces cuadradas [n=numero, b=base, h=altura]
(define (babilonio2 n b h error)
    (if (< (- b h) error) ; hay que aproximarse a un cuadrado, la diferencia de b y h se aproximará a 0
        b ; cuando sea ~ cuadrado devolvemos b o h
        (babilonio2 
            n 
            (/ (+ h b) 2) ; pasamos como base (b+h) / 2
            (/ (* b h) (/ (+ h b) 2)) ; y como altura (b*h) / nueva base, mantenemos el área
            error
        ) ;
    )
)

; 2) Algo parecido con raíces cúbicas?
;    ---------------------------------
;    Si para las raices cuadradas empezamos con un rectángulo y modificamos su base y altura para 
;    aproximarnos a un cuadrado, tiene sentido que para raíces cúbicas tomemos la misma premisa aplicada a un cubo
(define (babilonio3 n x y z error)
    (if (< (abs (- x z)) error) ; hay que aproximarse a un cubo, la diferencia de xz se aproximará a 0
        x ; cuando sea ~ cubo devolvemos x/y/z
        (babilonio3 
            n 
            (/ (+ x y z) 3) ; tanto x como y las igualamos
            (/ (+ x y z) 3) ; a la media de las longitudes
            (/ (* x y z) (expt (/ (+ x y z) 3) 2)) ; despejamos el volumen para hayar z
            error
        )
    )
)

; 2) Algo parecido con raíces n-sigmas?
;    ---------------------------------
;    Aunque sería físicamente imposible de replicar, podemos aumentar una dimensión y crear un teseracto (4-cubo)
(define (babilonio4 n x y z a error)
    (if (< (abs (- x a)) error) ; hay que aproximarse a un teseracto, la diferencia de xa se aproximará a 0
        x ; cuando sea ~ cubo devolvemos x/y/z/a
        (babilonio4 
            n 
            (/ (+ x y z a) 4) ; tanto x como y como z
            (/ (+ x y z a) 4) ; las igualamos a la media
            (/ (+ x y z a) 4) ; de las longitudes
            (/ (* x y z a) (expt (/ (+ x y z a) 4) 3)) ; despejamos el "volumen" para hayar a
            error
        )
    )
)

; Pra raíces n-sigmas podemos usar la estructura de hipercubo, n-cubo a través de una lista de aristas
(define (babilonioN n k l error)
    (if (= k 1)
        (babilonioN-AUX (cons n l) error) ; este algoritmo genera una lista de tamaño k, con el primer elemento con valor n
        (babilonioN n (- k 1) (cons 1.0 l) error) ; y el resto de elementos con valor 1, al finalizar la recursividad llama al método auxiliar
    )
)

(define (babilonioN-AUX l error)
    (if (< (abs (- (first l) (last l))) error) ; nos aproximamos a un hipercubo con todas las aristas similares, comparamos primera con última
        (first l) ; devolvemos cualquier arista, en este caso la primera
        (babilonioN-AUX ; llamamos recursivamente transformando la lista con el algoritmo
            (transform-lista 
                l ; lista original, marca el tamaño
                (/ (sum-lista l) (length l)) ; media de las aristas
                (/ (mul-lista l) (expt (/ (sum-lista l) (length l)) (- (length l) 1))) ; despejamos el volumen para hayar la última posición
            )
            error
        )
    )
)

; método para calcular la suma de los elementos de una lista
(define (sum-lista l)
    (if (= 0 (length l))
        0 ; fin de lista, sumamos 0
        (+ (car l) (sum-lista (cdr l))) ; sumamos la cabeza a la suma de la cola
    )
)

; método para calcular la multiplicación de los elementos de una lista
(define (mul-lista l)
    (if (= 0 (length l))
        1 ; fin de lista, multiplicamos por 1
        (* (car l) (mul-lista (cdr l))) ; multiplicamos la cabeza por la multiplicación de la cola
    )
)

; método para transformar una lista al aplicar el algoritmo
(define (transform-lista l media resto)
    (if (= 1 (length l))
        (list resto) ; en la última posición añadimos el resto
        (cons
            media ; en las demás posiciones ponemos la media
            (transform-lista (cdr l)  media resto)
        )
    )
)


;; Llamadas de prueba a las funciones
(displayln "RAÍCES CUADRADAS")
(and (display "(babilonio2 4 4.0 1.0 0.01) = ") (displayln (babilonio2 4 4.0 1.0 0.01)))
(and (display "(babilonio2 9 9.0 1.0 0.01) = ") (displayln (babilonio2 9 9.0 1.0 0.01)))

(displayln "RAÍCES CUBICAS")
(and (display "(babilonio3 8 8.0 1.0 1.0 0.01) = ") (displayln (babilonio3 8 8.0 1.0 1.0 0.01)))
(and (display "(babilonio3 27 27.0 1.0 1.0 0.01) = ") (displayln (babilonio3 27 27.0 1.0 1.0 0.01)))

(displayln "RAÍCES 4-SIGMAS")
(and (display "(babilonio4 16 16.0 1.0 1.0 1.0 0.01) = ") (displayln (babilonio4 16 16.0 1.0 1.0 1.0 0.01)))
(and (display "(babilonio4 81 81.0 1.0 1.0 1.0 0.01) = ") (displayln (babilonio4 81 81.0 1.0 1.0 1.0 0.01)))

(displayln "RAÍCES N-SIGMAS")
(and (display "(babilonioN 4 2 '() 0.5) = ") (displayln (babilonioN 4 2 '() 0.5)))
(and (display "(babilonioN 27 3 '() 0.01) = ") (displayln (babilonioN 27 3 '() 0.01)))
(and (display "(babilonioN 243 5 '() 0.00001) = ") (displayln (babilonioN 243 5 '() 0.00001)))
