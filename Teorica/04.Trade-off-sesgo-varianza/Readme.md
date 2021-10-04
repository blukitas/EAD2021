# Trade-off sesgo-varianza

## Elementos del proceso

* Conjunto de n datos
	* Vemos un sample de un proceso infinito de generación de datos (Fuente de variabilidad)
* Relacion de dependencia
	* y = f(x) + epsilon
	* Epsilon con mu = 0, y var = sigma cuadrado
	* Relación real entre los datos. Conocimiento al que nunca termino accediendo.
* Modelo predictivo
	* k = Parametro de complejidad del modelo
	* Nos va a interesas medir la diferencia entre lo observado y lo predicho
		* Esperanza del valor esperado de la discrepancia (Un valor promedio de cuanto me alejo del dato real)
		* Minimizarla
		* Va a depender de 3 componentes:
			* Varianza irreductible (No depende del modelo, siempre va a estar)
			* Varianza del predictor con respecto de su esperanza (Varianza del modelo que elegimos)
			* Sesgo al cuadrado (Bias)
			* El **trade-off sesgo-varianza** se relaciona con estos dos últimos componentes. Puedo apuntarle a uno u otro. 
		* MSE -> Minimum square error


Parsimonioso -> Inverso de complejo


**Ref** -> Ppt y video 5.

![Trade-off con ejemplo](https://github.com/blukitas/EEA-2021-Propio/blob/5991432bc11bfa3bd4ebeaf3a945bdb4aa1c7251/Teorica/04.Trade-off-sesgo-varianza/00.ejemplo.png?raw=true)


La relación es teórica, si uno pudiera medir realmente sesgo y varianza (Bias - variance). Uno no conoce la función que genera la información. Pero sirve para explicar.

A medida que aumento la complejidad, el modelo aprende los datos. Medición naive, sobre los mismo datos que entrené. (La línea roja)

En la curva lila, vemos como después de cierto punto reducimos sesgo pero aumentamos la varianza (Overfitting). Tecnológicamente es bastante fácil caer en overfitting, por la cantidad de datos y la cantidad de procesamiento.

(Algo que dice, pero que soportamos más el overfitting como explicación que el underfitting. Preferimos hipotesis complejas que las más simples)


## Precisión vs interpretabilidad


Los modelos más sencillos son más fáciles de explicar. Los modelos con mayor precisión, priorizando performance, tienden a ser complicados (o imposibles) de explicar.


## Solución overfitting

* Usar modelos pocos complejos
* Partir la muestra (Train, val, test)
* Usar validación cruzada
* Boostrapping y bagging
	* Promediar modelos
* Tecnicas de "shrinkage":
	* Ridge regression
	* Lasso regression
	* Penalizacion o regularización


## Meta heurísticas


* Bagging
	* Reducir varianza
	* Promediar resultados de modelos complejos, haciendo boostrap^ de train
	* El promedio, por grandes numeros, hace ir la distribución a la media

* Boosting
	* Reducir bias / sesgo
	* Reentrenar iterativamente modelos simples aumentando la ponderación de las observaciones peor predichas.
	* Está técnica reduce el sesgo típico de modelos simples


^Boostrap -> Tecnica estadísticas. Tomar muestras, subsamples, con reposición.




