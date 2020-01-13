(define (problem test-01) (:domain planificador)
    (:objects l1 l2 l3 l4 l5 - libro)
    (:init
        (predecesor l1 l2)
        (predecesor l2 l3)
        (predecesor l4 l5)

        (ver l3)
        (ver l5)
    )

    (:goal (and (forall (?x - libro) (ver ?x)))))