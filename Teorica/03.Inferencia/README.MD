
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


## Estimación del modelo paramétrico

* Familia No/Semi paramétricas
* Datos
* Verdadero DGP
* Universo de posibilidades de DGP
* Familia de modelos elegidas

(Modelito de conceptos - Ppt página 8)
 

## Enfoque bayesiano

* Familia
* Verosimilitud
* Parámetros

Pero suma una hipótesis, asume una distribución a priori para ese theta (Parametro). Va tuneando para acercarse a la distribución original del parámetro. Esto me da una distribución más cercana, un 'lindo' estimador. La moda de está distirbución a posteriori. Me va a dar una medida del grado de incertidumbre (Lo saco de la distribución).

Pero si le erramos en la elección del modelo (De la distribución de la función) puede dar mal.


## Aproximadores universales

(Redes neuronales)

Tienen la chance de acercarse a cualquier DGP. Mucha más capacidad que otros modelos más tradicionales. Si no tengo buen método de entrenamiento puedo sobreentrenar y quedar lejos del proceso.

La lógica que tiene es ir probando diferentes soluciones.



## Verosimilitud


Función de verosimilid, la puedo evaluar en cualquier punto del espacio y me va a devolver un escalar. Está fija en la muestra (Depende del parámetro - theta - con las x fijas). Probabilidad conjunta de ver las N observaciones de la muestra.

Probabilidad conjunta = Proudcto de las leyes marginales, como son independientes y con identica distribución. => Es el producto 1..n del modelo evaluado en ese x_i específico y un modelo theta específico. Lo pienso como función de theta.

Dado los datos, ciertos valores de theta van a ser más probables, verosimilitudes más grandes.


### Estimador de máxima verosimilitud (MLE)

Buscar el theta que maximiza el MLE. Encontrar los parámetros/thetas que hacen más probable que el modelo represente el set de datos que observé.


(TODO: Repasar video 9 y 10 de https://www.youtube.com/watch?v=lLP7Hmz5Cu0&list=PLN2e9R_DoC0SL1YxjnuHMmxutfyLOAhxq)


## Test de hipótesis

### Potencia, específicidad y errores

Modelo -> X = mu + error
Estimador -> Estimador media muestral

La idea poder comparar dos modelos. Hipotesis + hipotesis alternativa.

* Error tipo I -> Lo controlamos con el punto de corte. Es el alfa.
* Error tipo II -> No lo controlo, lo infiero según como es la realidad.


Rechazo si supero el umbral del test.

**Especificidad** -> La probablidad de no rechazar cuando no debía rechazar. El complemento del error tipo I.
**Poder** -> Probabilidad de rechazar cuando debía rechazar. El complemento del error tipo II.

Si bajo el error tipo I, aumenta el error tipo II.

**p-valor**  cuantifica objetivamente la evidencia acerca de la validez de una hipótesis. Específicamente, mide en base a las observaciones el grado de “compatibilidad” de una hipótesis en términos del comportamiento distribucional de un estimador /estadístico.

Conforme el p-valor se acerca a 0, evidencia en contra de H0.



### Problema de grandes numeros

Con n extremadamente grande cualquier hipotesis pasa a ser invalida. Porque los valores se concentran más y más.
(Re pasar video 15 - https://www.youtube.com/watch?v=ZD2AHcJo21Y&list=PLN2e9R_DoC0SL1YxjnuHMmxutfyLOAhxq&index=15 y en clase también lo menciona)













