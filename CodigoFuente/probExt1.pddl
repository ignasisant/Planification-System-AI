
(define (problem libro) 
  (:domain libro)
  (:objects
     l1 l2 l3 l4 l5 l6 l7 l8 l9 l10 l11 l12 l13 l14 - libro
    mes1 mes2 mes3 mes4 mes5 mes6 mes7 mes8 mes9 mes10 mes11 mes12 - mes
  )

  (:init
    (predecesor l2 l4)
    (predecesor l4 l3)
    (predecesor l2 l3)
    (predecesor l7 l6)
    (leer l3)
    (leer l2)
    (leer l7)
    
    (visto l6)
  ) 

  (:goal (and
            (quiero_leer l3)
            (quiero_leer l2)
            (quiero_leer l7)
         )
  )
)