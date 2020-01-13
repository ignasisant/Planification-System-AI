(define (domain libro)
    (:requirements :strips :typing :adl :equality)
    (:types libro mes)

    (:predicates
        (quiero_leer ?lib - libro)
        (visto ?lib - libro)
        (predecesor ?lib - libro ?libt - libro)
        (leer ?lib - libro)
        (mesocupado ?m - mes)
    )
    (:action leer_libros
        :parameters (?lib - libro ?m - mes) 
        :precondition
            (and
                (not (mesocupado ?m)) 
                (not (visto ?lib))  
                (not (quiero_leer ?lib))
                (forall (?l - libro) (or
                                        (and       
                                            (predecesor ?lib ?l)
                                            (or
                                            (visto ?l)
                                            (quiero_leer ?l)))
                                        (and 
                                            (predecesor ?l ?lib)
                                            (leer ?l)
                                        )
                                        (not (predecesor ?lib ?l)) 
                                      )
                ) 
            )
        :effect
        (and  (mesocupado ?m)
              (quiero_leer ?lib) 
        )
    )
)