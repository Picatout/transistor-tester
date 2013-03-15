Il s'agit d'un vérificateur de transistor bi-jonction réalisé avec un PIC10F202-I/P

La polirité et l'état du transistor est indiqué par 2 LEDs

Lorsque la LED verte clignote il 'sagit d'un NPN
Lorsque la LED rouge clignote il s'agit d'un PNP
Si les 2 clignotent en alternance il y a un court-circuit entre émetteur et collecteur
Si aucune LED n'allume le transistor est défectueux ou ce n'est pas un transistor bi-jonction.
Si on inverse collecteur et émetteur la LED clignote quand même mais plus faiblement.
Ceci n'indique pas une défectuosité du transistor mais plutôt une certaine symétrie entre les 2 
jonctions, base-collectteur et base-émetteur.  Cette symétrie est particulièrement visible sur
les transistors de commutation ZTX649 (NPN) et ZTX749 (PNP) alors que la LED clignote
avec presqu'autant d'intensité lorsqu'on inverse les émetteurs et collecteurs.

