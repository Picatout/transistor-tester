Il s'agit d'un v�rificateur de transistor bi-jonction r�alis� avec un PIC10F202-I/P

La polirit� et l'�tat du transistor est indiqu� par 2 LEDs

Lorsque la LED verte clignote il 'sagit d'un NPN
Lorsque la LED rouge clignote il s'agit d'un PNP
Si les 2 clignotent en alternance il y a un court-circuit entre �metteur et collecteur
Si aucune LED n'allume le transistor est d�fectueux ou ce n'est pas un transistor bi-jonction.
Si on inverse collecteur et �metteur la LED clignote quand m�me mais plus faiblement.
Ceci n'indique pas une d�fectuosit� du transistor mais plut�t une certaine sym�trie entre les 2 
jonctions, base-collectteur et base-�metteur.  Cette sym�trie est particuli�rement visible sur
les transistors de commutation ZTX649 (NPN) et ZTX749 (PNP) alors que la LED clignote
avec presqu'autant d'intensit� lorsqu'on inverse les �metteurs et collecteurs.

