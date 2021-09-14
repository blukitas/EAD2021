# Inferencia estadística

Tratar de estimar o inferir mediante una muestra (aleatoria) el valor (desconocido) de un parámetro poblacional.

(Definición viejita pero válida)

## Definiciones 

* **Muestra aleatoria**: 'porción' de una población. Se escribe como **X** grande
	* Debería ser un proceso relativamente estocástico, aleatorio. (La aleatoriedad es complicada/imposible)
	* Podemos tener muchos sesgos seleccionando la muestra (Ejemplo _trivial_, si tengo bolas negras y rojas. Las rojas, pintadas, son ligeramente más pesadas que las negras. Por lo tanto, tienen más chances de ir al fondo. Sesgo que es dificil de preveer, pero que afecta a que sea una muestra aleatoria)
* **Estimador**: Proceso de cálculo, función de variables aleatorias
* **Estimación**: Aplicar ese proceso, a valores de mi muestra (x chiquito)
* **Parámetro**: Algo que queremos entender de la población. Forma genérica de mencionarlo (Una o más variables, más simple o más compleja)

Ejemplo de un tarro con bolitas rojas y negras.

* El tarro entero es la **población**
* Saco 10 bolitas y esa es mi **muestra**
* La proporción que cuente con esa muestra es la **estimación**, a mayor cantidad de observaciones más se parece la estimación al **parámetro**
* El estimador es contar cuantas hay de cada color


## Estimadores

* Consistencia -> A mayor tamaño de n, más se parece al parámetro
* Insesgadez -> En promedio el estimador se parece al parámetro
* Error cuadrático medio -> Propiedad para estimar el error


## Ejemplo

DGP -> Data generation process

La idea de que los datos provienen de una distribución se hizo un poco naive. Hay una idea de que la distribución puede variar en el tiempo. DGP sería el proceos que genera los datos. (Algo puramente de nombre? o algo que abstrae otra complejidad?)

