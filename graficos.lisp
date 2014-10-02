(load "ltk")
(in-package :ltk)

;---------------------------------------------------
	; CARGAMOS EL ARCHIVO INTERFAZ.
(load "interfaz.lisp")



;---------------------------------------------------

(inicializar-juego2)

;---------------------------------------------------


(defvar *Posiciones*)
(defvar *colorFicha*)
(defvar *colorHumano*)
(defvar *colorOrdenador*)
(defvar *jugada*)
(defvar *turno*)

(setq 
  *colorLinea* '"#ccd2c8"
  *colorFicha* '"#394034"
  *colorHumano* '"#ff2f70"
  *colorOrdenador* '"#0083e8" )


;---------------------------------------------------
;EVALUACIONES PARA CADA LINEA
(defun val-linea (posx posy)
    (* (- posx 80) (- posy 56) )
  )
(defun val-linea2 (posx posy)
    (* (- posx 280) (- posy 56) )
  )
(defun val-linea3 (posx posy)
    (* (- posx 56) (- posy 80) )
  )
(defun val-linea4 (posx posy)
    (* (- posx 256) (- posy 80) )
  )
(defun val-linea5 (posx posy)
    (* (- posx 456) (- posy 80) )
  )


(defun val-linea6 (posx posy)
    (* (- posx 80) (- posy 256) )
  )
(defun val-linea7 (posx posy)
    (* (- posx 280) (- posy 256) )
  )
(defun val-linea8 (posx posy)
    (* (- posx 56) (- posy 280) )
  )
(defun val-linea9 (posx posy)
    (* (- posx 256) (- posy 280) )
  )
(defun val-linea10 (posx posy)
    (* (- posx 456) (- posy 280) )
  )


(defun val-linea11 (posx posy)
    (* (- posx 80) (- posy 456) )
  )
(defun val-linea12 (posx posy)
    (* (- posx 280) (- posy 456) )
  )
;---------------------------------------------------


(defun	posicion-linea (evento)

	(let ((indice NIL) )
     
     (if(and (< (val-linea (event-x evento) (event-y evento) ) 1280) (> (val-linea (event-x evento) (event-y evento) ) 0) )
                  (setq indice 0)
                  ;linea 2
                  (if(and (< (val-linea2 (event-x evento) (event-y evento) ) 1280) (> (val-linea (event-x evento) (event-y evento) ) 0) )
                      (setq indice 1)
                     ;linea 3
                     (if(and (< (val-linea3 (event-x evento) (event-y evento) ) 1280) (> (val-linea (event-x evento) (event-y evento) ) 0) )
                         (setq indice 2)
                        ;linea 4
                        (if(and (< (val-linea4 (event-x evento) (event-y evento) ) 1280) (> (val-linea (event-x evento) (event-y evento) ) 0) )
                            (setq indice 3)
                           ;linea 5
                           (if(and (< (val-linea5 (event-x evento) (event-y evento) ) 1280) (> (val-linea (event-x evento) (event-y evento) ) 0) )
                               (setq indice 4)
                              ;linea 6
                              (if(and (< (val-linea6 (event-x evento) (event-y evento) ) 1280) (> (val-linea (event-x evento) (event-y evento) ) 0) )
                                  (setq indice 5)
                                 ;linea 7 
                                 (if(and (< (val-linea7 (event-x evento) (event-y evento) ) 1280) (> (val-linea (event-x evento) (event-y evento) ) 0) )
                                     (setq indice 6)
                                    ;linea 8
                                    (if(and (< (val-linea8 (event-x evento) (event-y evento) ) 1280) (> (val-linea (event-x evento) (event-y evento) ) 0) )
                                        (setq indice 7)
                                       ;linea 9
                                       (if(and (< (val-linea9 (event-x evento) (event-y evento) ) 1280) (> (val-linea (event-x evento) (event-y evento) ) 0) )
                                           (setq indice 8)
                                           ;linea 10
                                           (if(and (< (val-linea10 (event-x evento) (event-y evento) ) 1280) (> (val-linea (event-x evento) (event-y evento) ) 0) )
                                           		(setq indice 9)
                                           		;linea 11
                                           		(if(and (< (val-linea11 (event-x evento) (event-y evento) ) 1280) (> (val-linea (event-x evento) (event-y evento) ) 0) )
		                                           (setq indice 10)
		                                           ;linea 12
		                                           (if(and (< (val-linea12 (event-x evento) (event-y evento) ) 1280) (> (val-linea (event-x evento) (event-y evento) ) 0) )
			                                           (setq indice 11)

			                                           (setq indice nil)
			                                           
		                                           )  
                                           
                                      		    )  
                                           
                                            )  

                                       )  
                                    ) 
                                 ) 
                              ) 
                           ) 
                        ) 
                     ) 
                  )
                )

     indice
     ) 
)

(defun tablero()
	(with-ltk ()
		(let* (
					;(img (make-image))
					(sc (make-instance 'canvas :height 520 :width 800))
					(lienzo (canvas sc))
					; Caminos por el tablero
					
					;(linea2 (create-line lienzo (list 60 360 360 360)))

                    (ovalo1 (create-oval lienzo 50 50 70 70))
					(ovalo2 (create-oval lienzo 250 50 270 70))
					(ovalo3 (create-oval lienzo 450 50 470 70))

					(linea1 (create-line lienzo (list 80 60 240 60) ))
					(linea2 (create-line lienzo (list 280 60 440 60) ))

					(linea3 (create-line lienzo (list 60 80 60 240) ))
					(linea4 (create-line lienzo (list 260 80 260 240) ))
					(linea5 (create-line lienzo (list 460 80 460 240) ))

 					(ovalo4 (create-oval lienzo 50 250 70 270))
					(ovalo5 (create-oval lienzo 250 250 270 270))
					(ovalo6 (create-oval lienzo 450 250 470 270))

					(linea6 (create-line lienzo (list 80 260 240 260) ))
					(linea7 (create-line lienzo (list 280 260 440 260) ))

					(linea8 (create-line lienzo (list 60 280 60 440) ))
					(linea9 (create-line lienzo (list 260 280 260 440) ))
					(linea10 (create-line lienzo (list 460 280 460 440) ))

					(ovalo7 (create-oval lienzo 50 450 70 470))
					(ovalo8 (create-oval lienzo 250 450 270 470))
					(ovalo9 (create-oval lienzo 450 450 470 470))

					(linea11 (create-line lienzo (list 80 460 240 460) ))
					(linea12 (create-line lienzo (list 280 460 440 460) ))
		
			 )

		(pack sc :expand 1 :fill :both)
		;(image-load img "iron-man.png")
		;(create-image sc 480 0 :image img)
		(wm-title *tk* "Cuadraditos 3X3")

		(bind lienzo "<ButtonPress-1>"
			(lambda (evento)

				(setq indiceLinea (posicion-linea evento) )
				(print indiceLinea)
				(format t "~&~s    ~s    ~s" (event-x evento) (event-y evento)  () )
				(cond
				( (= indiceLinea 0) (itemconfigure lienzo linea1 :fill *colorHumano*) )
				( (= indiceLinea 1) (itemconfigure lienzo linea2 :fill *colorHumano*) )
				( (= indiceLinea 2) (itemconfigure lienzo linea3 :fill *colorHumano*) )
				( (= indiceLinea 3) (itemconfigure lienzo linea4 :fill *colorHumano*) )
				( (= indiceLinea 4) (itemconfigure lienzo linea5 :fill *colorHumano*) )
				( (= indiceLinea 5) (itemconfigure lienzo linea6 :fill *colorHumano*) )
				( (= indiceLinea 6) (itemconfigure lienzo linea7 :fill *colorHumano*) )
				( (= indiceLinea 7) (itemconfigure lienzo linea8 :fill *colorHumano*) )
				( (= indiceLinea 8) (itemconfigure lienzo linea9 :fill *colorHumano*) ) 
				( (= indiceLinea 9) (itemconfigure lienzo linea10 :fill *colorHumano*) ) 
				( (= indiceLinea 10) (itemconfigure lienzo linea11 :fill *colorHumano*) ) 
				( (= indiceLinea 11) (itemconfigure lienzo linea12 :fill *colorHumano*) ) 
				   ((= indiceLinea nil)  (print 'lugar-incorrecto) ) 
				)



				

			)

		)
				    

		; Grosor de los caminos
		(itemconfigure lienzo linea1 :width 8)
		(itemconfigure lienzo linea1 :fill *colorLinea*)
	    (itemconfigure lienzo linea2 :width 8)
		(itemconfigure lienzo linea2 :fill *colorLinea*)
         
        (itemconfigure lienzo linea3 :width 8)
		(itemconfigure lienzo linea3 :fill *colorLinea*)
	    (itemconfigure lienzo linea4 :width 8)
		(itemconfigure lienzo linea4 :fill *colorLinea*)
		(itemconfigure lienzo linea5 :width 8)
		(itemconfigure lienzo linea5 :fill *colorLinea*)

         
		(itemconfigure lienzo ovalo1 :fill *colorFicha*)
		(itemconfigure lienzo ovalo1 :width 3)
		(itemconfigure lienzo ovalo2 :fill *colorFicha*)
		(itemconfigure lienzo ovalo2 :width 3)
		(itemconfigure lienzo ovalo3 :fill *colorFicha*)
		(itemconfigure lienzo ovalo3 :width 3)

		(itemconfigure lienzo ovalo4 :fill *colorFicha*)
		(itemconfigure lienzo ovalo4 :width 3)
		(itemconfigure lienzo ovalo5 :fill *colorFicha*)
		(itemconfigure lienzo ovalo5 :width 3)
		(itemconfigure lienzo ovalo6 :fill *colorFicha*)
		(itemconfigure lienzo ovalo6 :width 3)


		(itemconfigure lienzo linea6 :width 8)
		(itemconfigure lienzo linea6 :fill *colorLinea*)
	    (itemconfigure lienzo linea7 :width 8)
		(itemconfigure lienzo linea7 :fill *colorLinea*)
         
        (itemconfigure lienzo linea8 :width 8)
		(itemconfigure lienzo linea8 :fill *colorLinea*)
	    (itemconfigure lienzo linea9 :width 8)
		(itemconfigure lienzo linea9 :fill *colorLinea*)
		(itemconfigure lienzo linea10 :width 8)
		(itemconfigure lienzo linea10 :fill *colorLinea*)





		(itemconfigure lienzo ovalo7 :fill *colorFicha*)
		(itemconfigure lienzo ovalo7 :width 3)
		(itemconfigure lienzo ovalo8 :fill *colorFicha*)
		(itemconfigure lienzo ovalo8 :width 3)
		(itemconfigure lienzo ovalo9 :fill *colorFicha*)
		(itemconfigure lienzo ovalo9 :width 3)

		(itemconfigure lienzo linea11 :width 8)
		(itemconfigure lienzo linea11 :fill *colorLinea*)
	    (itemconfigure lienzo linea12 :width 8)
		(itemconfigure lienzo linea12 :fill *colorLinea*)

         )
      )

)

(tablero)

