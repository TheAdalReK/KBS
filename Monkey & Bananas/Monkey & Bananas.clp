(deffacts initial-state
	(Monkey is Hungry)
	(Monkey isOn Floor)
	(Monkey isFar Chair)
	(Monkey isFar Desk)
	(Banana hanging ceiling)
	(Banana with peel)
	(Chair isOn Floor)
	(Chair isFar Desk)
	(Chair is light)
	(Desk isOn Floor)
	(Desk isNotDown Banana)
	(Desk is heavy)
)
	
(defrule Monkey-go-to-Desk
   	(Monkey isOn Floor)
	(Desk isOn Floor)
	(Banana hanging ceiling)
	(Desk isNotDown Banana)
	?basura1 <- (Monkey isFar Desk)
    ?pasos <- (pasos ?plan)
    =>
    (assert (Monkey isNear Desk))
    (bind ?nueva-paso (create$ Monkey-go-to-Desk))
    (assert (pasos ?nueva-paso))
    (retract ?basura1)
	(retract ?pasos)	
)

(defrule Monkey-drags-the-Desk-under-Banana
   	(Monkey isNear Desk)
	?basura1 <- (Desk isNotDown Banana)
	(Desk is heavy)
    	?pasos <- (pasos ?plan)
    	=>
    	(assert (Desk below Banana))
    	(bind ?nueva-paso (create$ (str-cat ?plan " " Monkey-drags-the-Desk-under-Banana)))
    	(assert (pasos ?nueva-paso))
    	(retract ?basura1)
	(retract ?pasos)	
)

(defrule Monkey-lift-the-Desk-under-Banana
   	(Monkey isNear Desk)
	?basura1 <- (Desk isNotDown Banana)
	(Desk is light)
    	?pasos <- (pasos ?plan)
    	=>
    	(assert (Desk below Banana))
    	(bind ?nueva-paso (create$ (str-cat ?plan " " Monkey-lift-the-Desk-under-Banana)))
    	(assert (pasos ?nueva-paso))
    	(retract ?basura1)
	(retract ?pasos)	
)

(defrule Monkey-gois-to-the-Chair-1
   	(Monkey isOn Floor)
	(Chair isOn Floor)
	(Desk below Banana)
    	?basura1 <- (Monkey isFar Chair)
	?basura2 <- (Monkey isNear Desk)
    	?pasos <- (pasos ?plan)
    	=>
    	(assert (Monkey isNear Chair))
	(assert (Monkey isFar Desk))
    	(bind ?nueva-paso (create$ (str-cat ?plan " " Monkey-gois-to-the-Chair)))
    	(assert (pasos ?nueva-paso))
    	(retract ?basura1)
	(retract ?basura2)
	(retract ?pasos)	
)

(defrule Monkey-gois-to-the-Chair
   	(Monkey isOn Floor)
	(Chair isOn Floor)
	(Desk below Banana)
	(Monkey isFar Desk)
    	?basura1 <- (Monkey isFar Chair)
    	?pasos <- (pasos ?plan)
    	=>
    	(assert (Monkey isNear Chair))
    	(bind ?nueva-paso (create$ (str-cat ?plan " " Monkey-gois-to-the-Chair)))
    	(assert (pasos ?nueva-paso))
    	(retract ?basura1)
	(retract ?pasos)	
)

(defrule Monkey-Lift-The-Chair
	?basura1 <- (Monkey isNear Chair)
	(Chair is light)
	?basura2 <- (Chair isOn Floor)
   	?pasos <- (pasos ?plan)
	=>
	(assert (Monkey with Chair))
	(bind ?nuevo-paso (create$ (str-cat ?plan " " Monkey-Lift-The-Chair)))
    	(assert (pasos ?nuevo-paso))
	(retract ?basura1)
	(retract ?basura2)
    	(retract ?pasos)
)

(defrule Monkey-go-to-the-Desk-with-Chair
	(Monkey with Chair)
	?basura1 <- (Monkey isFar Desk)
	?basura2 <- (Chair isFar Desk)
   	?pasos <- (pasos ?plan)
	=>
	(assert (Monkey isNear Desk))
	(assert (Chair isNear Desk))
	(bind ?nuevo-paso (create$ (str-cat ?plan " " Monkey-go-to-the-Desk-with-Chair)))
    	(assert (pasos ?nuevo-paso))
	(retract ?basura1)
	(retract ?basura2)
    	(retract ?pasos)
)

(defrule Monkey-puts-the-Chair-isOn-the-Desk
	?basura1 <- (Monkey with Chair)
	?basura2 <- (Monkey isNear Desk)
	?basura3 <- (Chair isNear Desk)
   	?pasos <- (pasos ?plan)
	=>
	(assert (Chair isOn Desk))
	(bind ?nuevo-paso (create$ (str-cat ?plan " " Monkey-puts-the-Chair-isOn-the-Desk)))
    	(assert (pasos ?nuevo-paso))
	(retract ?basura1)
	(retract ?basura2)
	(retract ?basura3)
    	(retract ?pasos)
)

(defrule Monkey-gets-on-the-Desk
	(Chair isOn Desk)
	?basura1 <- (Monkey isOn Floor)
   	?pasos <- (pasos ?plan)
	=>
	(assert (Monkey isOn Desk))
	(bind ?nuevo-paso (create$ (str-cat ?plan " " Monkey-gets-on-the-Desk)))
    	(assert (pasos ?nuevo-paso))
	(retract ?basura1)
    	(retract ?pasos)
)

(defrule Monkey-gets-on-the-Chair
	?basura1 <- (Monkey isOn Desk)
   	?pasos <- (pasos ?plan)
	=>
	(assert (Monkey isOn Chair))
	(assert (Monkey reach Banana))
	(bind ?nuevo-paso (create$ (str-cat ?plan " " Monkey-gets-on-the-Chair)))
    	(assert (pasos ?nuevo-paso))
	(retract ?basura1)
    	(retract ?pasos)
)


(defrule Monkey-grabs-Banana
	?basura1 <- (Monkey reach Banana)
	?basura2 <- (Banana colgada-en techo)
   	?pasos <- (pasos ?plan)
	=>
	(assert (Monkey with Banana))
	(bind ?nuevo-paso (create$ (str-cat ?plan " " Monkey-gets-on-the-Chair)))
    	(assert (pasos ?nuevo-paso))
	(retract ?basura1)
	(retract ?basura2)
    	(retract ?pasos)
)

(defrule Monkey-peel-Banana
	(Monkey with Banana)
	?basura1 <- (Banana with peel)
   	?pasos <- (pasos ?plan)
	=>
	(assert (Banana is peeled))
	(bind ?nuevo-paso (create$ (str-cat ?plan " " Monkey-peel-Banana)))
    	(assert (pasos ?nuevo-paso))
	(retract ?basura1)
    	(retract ?pasos)
)

(defrule Monkey-eats-Banana
	?basura1 <- (Banana is peeled)
	?basura2 <- (Monkey with Banana)
   	?pasos <- (pasos ?plan)
	=>
	(assert (Monkey eats Banana))
	(bind ?nuevo-paso (create$ (str-cat ?plan " " Monkey-eats-Banana)))
    	(assert (pasos ?nuevo-paso))
	(retract ?basura1)
	(retract ?basura2)
    	(retract ?pasos)
)

(defrule Monkey-is-happy
	?basura1 <- (Monkey eats Banana)
	?basura2 <- (Monkey is Hungry)
   	?pasos <- (pasos ?plan)
	=>
	(assert (Monkey is happy))
	(bind ?nuevo-paso (create$ (str-cat ?plan " " Monkey-is-happy)))
    	(assert (pasos ?nuevo-paso))
	(retract ?basura1)
	(retract ?basura2)
    	(retract ?pasos)
)

(defrule impresion-del-plan
    	(pasos ?plan)
    	=>
    	(printout t ?plan crlf)
	(facts)
)