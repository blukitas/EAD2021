# Repaso estadístico

## Teoría de Probabilidades

* Espacio muestral (S) -> Conjunto de todos los posibles resultados del experimento.

* Eventos (A,B,C)

* Funcion de probabilidad (P)
	* Medida entre 0-1
	* Formas de pensarla:
		* Repetir infinitas veces un experimento y calcular
		* Medidas del mecanismo de estimación, cociente de favorables/totales
		* En bayesiana como medida de incertidumbre

	* Propiedades
		* Probabilidad del espacio muestral = 1
		* Si A y B son disjuntos, la probabilidad de A union B = P(A) + P(B)
		* Sino P(A union B) = P(A) + P(B) - P(A interseccion B) 
		* P(A_complemento) = 1 - P(A)

	* Probabilidad condicional: P(A|B) = P(A interseccion B) * P(B)

* Independencia 
	* P(A intersect B) = P(A) * P(B)
	* P(A|B) = P(A)
	* Concepto de independencial condicional (**importante**). Es fundamental para la materia (Así lo dijo). 
		* P( A intersect B | C ) = P( A|C ) * P( B|C ) 
			* Una variable puede cambiar toda la percepción del problema. Agregar o sacar una variable puede hacer que mi visión del problema y de la relación entre las variables cambie rotundamente.
		* Una variable puede cambiar la percepción del problema
		* Hay problema es la falta de variables, la falta de datos. 
			* Siempre falta, hay menos de lo que quisieramos tener. 
			* Eso siempre da un modelo con sesgo.
			* y = f(x) (Fenomeno del mundo) | Y = F(X) (Valor que predigo, de una función que yo creo, de una variable que yo miro)
			* Ese gap grande, está lleno de asumpciones, faltantes, relaciones espureas.

* Teorema de Bayes 
	* Inversión condicional
		* P(A|B) = ( P(B|A) * P(A) ) / P(B)
	* Probabilidad total
		* P( B|A ) * P(B) + P( B|A' ) * P(A')
	* P(A|B) =  P(B|A) * P(A) / ( P( B|A ) * P(B) + P( B|A' ) * P(A') )

* Variable aleatoria
	* Una variable aleatoria X es una función definida sobre el espacio muestral que toma valores en los reales.
	* **Función de distribución**: Con la función uno puede reconstruir la 'historia' de una variable. 
		* Se puede estimar
		* Puedo saber que rango de valores son los más probables

* Normal univariada
	* Normal estandar
	* Z
	* Simétrica al origen

* Teorema central del límite
	* Tomo variables aleatorias (X) independientes e identicamente distribuidas (iid).
	* El promedio de esas V.A. iid , le resto la esperanza y divido sobre el desvío => El dominio del promedio estandarizado, se parece a una normal
		* A mayor N, más se parece a una normal
		* Ese promedio tiende a la normal, independientemente de la distribución de cada variable?
	* No habla de la normalidad de las variables, sino de la normalidad del promedio de las variables
		* No habla de cada variable. 
		* Las variables no se distribuyen, ni necesitan distribuirse como normales. 
		* Pero el promedio, independiente de la distribución de las variables, va a comportarse en el límite como una normal.
	* Pide que las variables sean aleatorias, y iid, pero no dice de como son los datos en el mundo real. 
		* Hay versiones del teorema que no pide variables iid 

* Tchevichev - Ley de los grandes números
	* variables V.A. iid
	* Tchevichev -> Previa
		* La probabilidad de una variable de alejarse en _epsilon_ de su media, depende de _epsilon_ y de la varianza de la distribución
	* Ley de los grandes números 
		* A mayor n (sucesión más grande), más se parece el promedio a la esperanza
		* El promedio se acerca a la media tanto cuanto yo quiera, a medida que n crece
		* Ley asintótica
		* No habla de la distribución, caracteriza el valor esperado
