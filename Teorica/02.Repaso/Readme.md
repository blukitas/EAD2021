# Repaso estadístico

## Teoría de Probabilidades

* Espacio muestral (S)
* Eventos (A,B,C)
* Funcion de probabilidad (P)
	* Probabilidad condicional: P(A|B) = P(A interseccion B) * P(B)
* Independencia 
	* P(A intersect B) = P(A)*P(B)
	* P(A|B) = P(A)
	* Concepto de independencial condicional (**importante**). Es fundamental para la materia (Así lo dijo). 
		* P(A intersect B | C) = P(A|C) * P(B|C) 
		* Una variable puede cambiar la percepción del problema
		* Hay problema es la falta de variables, la falta de datos. 
			* Siempre falta, hay menos de lo que quisieramos tener. 
			* Eso siempre da un modelo con sesgo.
			* y = f(x) (Fenomeno del mundo) | Y = F(X) (Valor que predigo, de una función que yo creo, de una variable que yo miro)
			* Ese gap grande, está lleno de asumpciones, faltantes, relaciones espureas.
* Bayes 
	* Inversión condicional
		* P(A|B) = P(B|A) * P(A) / P(B)
	* P(A|B) =  P(B|A) * P(A) / ( P(B|A)*P(B) + P(A|B)*P(A) )
			
		