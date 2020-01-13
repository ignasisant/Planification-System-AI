(define (domain planificador)
    (:requirements :adl :typing)
    (:types libro - item
            mes - item)
    (:functions
        (ordenMes ?m - mes)
        (ultimoMes ?l - libro) 
        (predecesores ?l - libro)   
        (predecesoresAsignados ?l - libro)
	(paginasLibro ?l - libro)
        (paginasMes ?m - mes))
    (:predicates
        (predecesor ?x - libro ?y - libro)
        (leido ?x - libro)                 
        (leer ?x - libro)
        (libroAsignado ?l - libro))

    (:action leer_predecesor :parameters (?x - libro ?y - libro)
        :precondition (and (predecesor ?x ?y) (leer ?y))
        :effect (leer ?x) )

(:action ordenar_libros :parameters (?m - mes ?x - libro)
        :precondition (and (leer ?x) (not (libroAsignado ?x)) (> (ordenMes ?m) (ultimoMes ?x)) 
                        (= (predecesores ?x) (predecesoresAsignados ?x)) 
                        (<= (+ (paginasMes ?m) (paginasLibro ?x)) 800))
        :effect  (and (libroAsignado ?x) (increase (paginasMes ?m) (paginasLibro ?x))
                (forall (?y - libro) (when (predecesor ?x ?y) (and (assign (ultimoMes ?y) (ordenMes ?m)) 
                (increase (predecesoresAsignados ?y) 1) )))))

    (:action leer_libro :parameters (?x - libro)
        :precondition (and (leer ?x) (forall (?y - libro) (or (not (predecesor ?y ?x)) (leido ?y))))
        :effect (and (not (leer ?x)) (leido ?x)))
        
  

)
