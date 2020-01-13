(define (domain planificador)
    (:requirements :adl :typing)
    (:types libro - item)
    (:predicates
        (predecesor ?x - libro ?y - libro)  ;;x precede a y
        (ver ?x - libro))

    (:action ver_predecesor :parameters (?x - libro ?y - libro)
        :precondition (and (predecesor ?x ?y) (ver ?y))
        :effect (ver ?x))
)
     