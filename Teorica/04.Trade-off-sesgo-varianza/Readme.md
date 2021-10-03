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

![Trade-off con ejemplo](https://github.com/blukitas/EEA-2021-Propio/blob/main/Teorica/04.Trade-off-sesgo-varianza/00.ejemplo.png?raw=true)
