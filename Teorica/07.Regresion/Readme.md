# Regresión

Material: https://www.youtube.com/watch?v=pXgQ2A62uuY&list=PLN2e9R_DoC0Qsp46a53RynWXjdl5240f8

# Correlación

Relacion poblacional. Covarianza (X,Y) / desvio_x * desvio_y. (Esto en lo teórico)

En la práctica usamos el coeficiente de correlación de pearson que se calcula como: 

    Covarianza muestral / estimador_desvio_x * estimador_desvio_y

Nunca da cero, pero puede dar una valor no significativamente diferente de cero.

Test para independencia, p=0 (p = coeficiente de correlación). Sirve para muestras pequeñas, cuando los tamaños de muestra son suficientemente grandes (orden de miles de observaciones), se cumplen.

## Métodos robustos

No hay argumentos sólidos hoy para seguir usando métodos no robustos. Solo algo histórico y algo de costumbrismo (Que se explica que antiguamente eran más costosos de computar)

* Mediana y no media
* Spearman y no pearson
* MAD y desvío 

# Modelo lineal simple

Modelo para el vículo de dos variables aleatorias (X = Variable predictora e Y = Variable dependiente). Propone una variable predictora que se vincula con Y:

<img src="https://render.githubusercontent.com/render/math?math=Y=\beta_0 \pm \beta_1 X \pm \epsilon">


Epsilon es el error, parte aleatoria. No es algo como que está mal, sino que es un componente aleatorio que cuantifica el desconocimiento de otros atributos que no están en el modelo y que influyen en Y. (Otra forma sería decir ruido).

Este error se distribuye normalmente.

<img src="https://render.githubusercontent.com/render/math?math=E(Y|X = x_i)=\beta_0 \pm \beta_1 x_i \pm \epsilon">

La respuesta del modelo, función respuesta, es la esperanza de Y condicionada a la observación de x. Voy a suponer que Y es una variable aleatoria.

## Mitos

* No hay una única E(Y), sino que tendría infinita. Siempre pienso en una E(Y | X).
    * Y no necesariamente es normal. Y|X si es normal. Y_i | X_i es normal.

## Supuestos del modelo lineal

MSE = Minimal square errors = Función de pérdida

Buscamos minimizar MSE, para encontrar los parametros que minimicen el error. Explica esa idea a partir de dos ecuaciones que busco que el MSE cumpla:

* Tienen que sumar 0 los errores. Tengo que errarle parecido por arriba y por abajo. 
    * Los puntos que están por encima de la curva tienen que ser parecidos a los errores que están por debajo. (Los puntos y los errores, tienen que compensarse verticalmente)
* Tiene que se equilibrado como le erra a lo largo del eje X. También tengo que lograr que el error sea sistemática, no que al principio le erre menos, y al final más (O viceversa).


# Inferencia modelos lineales

Supuestos del modelo lineal para que sean válidas las inferencias

1. Los errores tienen media cero => E(e_i) = 0
    * No es algo tan exigente, porque significaría que construí bien el modelo
2. Los errores tiene todos la misma varianza desconocida, y que el otro parámetro del modelo. Var(e_i) = sigma^2 (Este requisito se llama homoscedasticidad)
    * Este supuesto influye en la eficencia de la estimación (específicamente en MSE)
3. Los errores tienen distribución normal
    * No es tan dificil que haya normal
    * Si no lo cumpliera los calculos salen bastante parecidos
4. Los errores son independientes entre sí, y son no correlacionados con las X_i
    * Esté es el más 'exigente'
    * Realmente cada error aporta más información?

Cada supuesto tiene distintos niveles de importancia en general, y tambien en específico (según el caso).

Inferencias del modelo

* Los parametros del modelo van a estar más fuertemente influenciados por los valores que se alejan de la estimación.
* Con n -> infinito. Mi varianza tiende a 0. Me parezco más y más al parámetro poblacional.
* Los estimadores son insesgados y consistentes
    * Con mayor n convergen
    * Insesgados porque se parecen al poblacional

La mejor manera de estimar la varianza, lo mejor es estudiar la varianza del residuo.

* La formula del sigma partiendo desde el ruido
* Tenemos un primer sesgo, el modelo está entrenado con un b_o y b_1
* Llegamos a una t de student con n-2 grados de libertad
* Sigma^2 de la muestra = 1/(n-2) * SSRes = MSRes.
    * MSRes. Cuadrado mínimo de los residuos.
 

(No sé a que va - Videios 6,7,8)

Podemos estimar B_1 como un intervalo de confianza:

<img src="https://render.githubusercontent.com/render/math?math=%7B%5Chat%7B%5Cbeta_1%7D%5Cpm%7Bt%7D_%7Bn-2%3B1-%20%5Cfrac%7B%5Calpha%7D%7Bn%7D%7D%5Ccdot%5Csqrt%7B%5Cfrac%7B%5Chat%7B%5Csigma%7D%7D%7B%5Csum_%7Bi%3D1%7D%5En(X_i-%5Coverline%7BX%7D)%5E2%7D%7D%7D">

También puedo hacer el test de hipotesis sobre los parámetros

    H0: Beta_1 = b
    H1: Beta_1 <> b

**P-valor**: Cuánta evidencia hay de que podría estar errándole. Con un umbral de significancia puedo rechazar o no.

Herramienta muy general para testear hipotesis, para validar. Más útil con tamaños de muestras chicos.

(Creo que entendí a lo que va)
Podemos hacer bastantes análisis estadísticos, bajo esos supuestos que enumeramos, para entender mejor cada término de la regresión. Con esa información, también podemos hacer muchos doble click de como es el condicionamiento y de como interactua con cada eje, con las otras variables, con otros condicionamientos entre variables (Más adelante, b_1 | b_2 por ejemplo).


## Incumplimientos de los supuestos


1. Los errores tienen media cero => E(e_i) = 0
    * No es algo tan exigente, porque significaría que construí bien el modelo
2. Los errores tiene todos la misma varianza desconocida, y que el otro parámetro del modelo. Var(e_i) = sigma^2 (Este requisito se llama homoscedasticidad)
    * Este supuesto influye en la eficencia de la estimación (específicamente en MSE)
3. Los errores tienen distribución normal 
    * No es tan dificil que haya normal
    * Si no lo cumpliera los calculos salen bastante parecidos
4. Los errores son independientes entre sí, y son no correlacionados con las X_i
    * Realmente cada error aporta más información?
    * No confundir sesgos con errores, con ruido. Sesgo influenciar los datos, error en medicion, ruido cosas que no tuve en cuenta. Por lo menos se atacan diferentes

2,3 parecen los más fuertes/exigentes, y no estaría bueno que un ligero cambio en la distribución nos arruine el modelo, o las conclusiones del modelo. Esto no pasa, es bastante robusto.

Con muy pocos supuestos y con mucha robustez puedo llegar a conclusiones poderosas.


# Inferencia sobre Y






# Notas de clases

Un poco de lo que fue pasando en clase 

### Mitos?

* Puedo decir cosas fuera del rango de aceptación. Puedo extrapolar.
* Los errores no (necesariamente) son normales

* En el modelo cada punto es una variable aleatoria, se distribuye como normal alrededor de ese punto



### Observaciones

Es muy distintos:

* Explicar la esperanza de Y condicionada en X. E(Y | X)
* Predecir Y
