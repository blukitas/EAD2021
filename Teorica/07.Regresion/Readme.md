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

## Y | X = x_h

E(Y | X = x_h) = beta_0 + beta_1 *  x_h (Sin sombrerito, porque estamos hablando del mundo ideal)

La vamos a estimar con los estimadores que tenemos. El modelo está pensado para hallar la esperanza condicionada.

Dos cosas que vemos muy claras en el modelo lineal (Minuto 7:40 del video - https://www.youtube.com/watch?v=CLxPrvFGodw&list=PLN2e9R_DoC0Qsp46a53RynWXjdl5240f8&index=25):
    * La varianza se achica a velocidad raiz_cuadrada de n. Mayor n, menor varianza. (Para este modelo)
    * Voy a poder estimar mejor los valores más cercanos al promedio
        * Porque? Esto es algo sobre lo que volvimos varias veces
        * Porque tengo más información. Más me alejo de la esperanza, de los valores promedios, que más aparecen. Menos información tengo. Menos información tuve para entrenar al modelo.

Esto es generalizable. A todos los modelos tiende a pasarle esto.

Estimo con un intervalo de confiaza (t de student), porque los estimadores tienen distribución t_student.

## Y

Y_h = beta_0 + beta_1 * X_h + error_h

El predictor es el mismo:

    beta_0 + beta_1 *  x_h

Varianza => Suma 1 uno en el término.

1 + 1/n + ( (x_h - X^2)/ Sum(X_i - X)²)

La varianza son 3 términos: :
* La estimación
    * La linea directa. Estimación de Y | x_h
* El intervalo de confianza asociado al n
    * A mayor n => menor varianza
* El intervalo de confianza asociado al error
    * Tiende a 1, y se ve muy poco afectado
    * El error irreductible
    * El error propio del fenómeno
        * Duda: Eso que no puedo reducir, es la falta de información, falta de elementos para capturar el fenómeno
        * El equilibrio en este predecir/explicar es:
            * Asumo que hay error e intento minimizarlo, buscando lo que explique la clase mayoritaria del fenómeno
            * Asumo que hay mas que no entiendo de lo que si entiendo, e intento usar el método más complejo posible para capturar todos los fenómenos que pueda (Aunque no peuda explicarlo realmente)

El problema con el mismo calculo de intervalo de confianza que para Y | x_h, es que ese intervalo tiene un 1-alpha de confianza para ese punto. Si quisiera calcularlo para n puntos, tendría n intervalors con 1-alpha. Si multiplico esa confianza, a mayor n, tiende a 0.

Entonces que pasa? Necesitamos cambiar de distribución. 

Banda de confianza para toda la recta. Infinitos intervalos posibles, para las infinitas y condicionadas. Intervalo de confianza para la recta. Intervalo de confianza simultaneo. Nivel simultaneo. (Todos nombres para lo mismo) 


# Analisis de varianza

Modelo de posicion -> El modelo más básico posible. Una constante. El modelo de base.

Modelo de regresión lineal simple -> El que venimos viendo. Ordenada al origen + una variable


Descomposición de suma de cuadrados

SSTo (Suma de cuadrados totales) = SSRes (Suma de cuadrado de residuos) + SSReg (Suma de cuadrados de la regresión)

Suma de Y_i - Y promedio = Suma de Y_i - Y sombrero + Suma de Y sombrero - Y promedio 

Y_i = El valor en el punto
Y promedio = Esperanza
Y sombreo = Valor predicho

Si mi modelo es muy bueno la suma de cuadrado de residuos tiene que ser chiquita.

    SSReg / SSTO = Proporción de variabilidad explicada

## Tabla ANOVA

Fuente de variacion | Suma de cuadrados | Grados de libertad | Cuadrado medio | F               | p-valor
--------------------|-------------------|--------------------|----------------|-----------------|-------------------
Regresión           | SSReg             | 1                  | MSReg          | MSReg/ MSRes    | P(F_1,n-2 > F_obs)   
(Continua)          |                   | Porque 1? A cada elemento le resto la suma de todos |||
Residuos            | SSRes             | n - 2              | MSRes          |                 |    
(Continua)          |                   | Porque n-2? n-p. Cada regresor (p), porque hubo p elementos para ajustar y que se parezcan |||
Total               | SSTot             | n - 1              |                |                 | 
(Continua)          |                   | Porque n-1? A cada elemento le resto la suma de todos |||

Como se construye la variabilidad total?

En un modelo lineal es más claro. Pero aplica a todos.
 
Si mi modelo es muy bueno SSRes es muy muy cercano a cero
Si mi modelo es malo SSRes es grande, eso significa que lo que explica mi beta_1 es muy cercano a 0. (?)  
 

F = MSReg / MSRes

Si son anómalamente grande significa que mi beta_1 no aporta. 
F anómalamente chico significa que no aporta información. Ese beta es poco significativo.


## Coeficiente de determinación

100% de la variabilidad -> SSTot
Cuanto de la variabilidad explicada -> SSTot - SSRes
% de la variabilidad explicada -> (SSTot - SSRes) / SSTot * 100

**Coeficiente de determinación** - r^2 => (SSTot - SSres) / SSTot

* Siempre entre 0 y 1
* Es el cuadrado del coeficiente de correlación de Pearson

Esto se ve en la salida del modelo. Anlisis de "Multiple R square", "Adjusted R Square", F, p-value,


# Leverage 

(Palancas en castellano)

El valor predicho de un dato puede escribirse como combinacion lineal de las observaciones (Esto es una afirmación). Busco entender como las distintas observaciones afectan a la observación i-esima

* Ella consigo misma (h_ii)
    * h_{ik} = 1/n + ( (X_i - \overline{X})^2 ) / S_{xx}
    * Cuan lejos está la observación de la media, medida en término de la dispersión de todos los valores 
    * (Se simplifica el cálculo, lo cuál ayuda a entender el sentido)
* Las otras n-1 observaciones (los h_ik)
    * h_{ik} = 1/n + ( (X_i - \overline{X}) * (X_k - \overline{X}) ) / S_{xx}
    * Cuan lejos está la observación de la media, medida en término de la dispersión de todos los valores


Se habla de h_ij. H por _Hat matrix_. Es una constante que depende de la cantidad de datos.


* Se ve afectada por el tamaño de la muestra. Menos tamaño de muestra más pesa n (1/2 > 1/10.000) 
* S_xx = Sumatoria de las distancias de los X_k a la media
* Los valores más cercanos a la media mueven poco la ecuación. Los valores más alejados tienen más leverage. Esto es consistente con lo que veníamos diciendo antes, tenemos siempre más información de los valores promedios que de los valores alejados. 
    * Un valor alejado tiene mayor leverage, y tiene mucho mayor influencia sobre el modelo en ese punto. Porque? Porque tenemos pocas observaciones => tenemos poca información para predecir, las pocas observaciones van a tener mucho más peso.


(Video 2 de leverage, minuto 6:30 - hasta el final)
* En una única dimensión parece más trivial, pero es muy importante. **Tremendamente importante**. Segunda parte del análisis del modelo lineal.
* Es un producto interno.
* Mide la asociación entre los atributos de las observaciones.
* "comparar la información en común entre observaciones"

Si hay observaciones con mucho leverage, es probable que necesitemos un método robusto. Porque esas observaciones podrían haber arrastrado al modelo (Cuando lo arrastra, no predice bien esos valores y sesga los otros).

# Residuos

Residuo del modelo = Diferencia entre valor observado y el valor predicho. 

Es la mejor aproximación que podemos hacer del error (Valor aleatorio que no podemos observar).

La esperanza de los errores es 0. Cuando n tiende a infinito, el error tiende a 0, la estimación de la media muestral tiende a la media de la poblacional.

La _varianza_? La varianza de los residuos no es homogenea (Aunque haya homocedasticidad). Mayor leverage => menor varianza. Si una observación tiene mucha influencia (leverage), tiende a arrastrar con mayor fuerza a esa variable. (Todo esto es una derivación de que siempre tenemos más información alrededor de la media, y el modelo optimiza eso). 

Si el n es muy grande, el efecto del leverage disminuye. 1/n tiende a 0. S_xx tiende a un numero fijo. La afectación de cada observación contra la media tiende a achicarse. (Los leverage tienen una cota [1/n; 1])

La **varianza de los errores** es: varianza_muestral * (1 - h_ii)


## Estructura de los residuos

**homocedasticidad**: En estadística se dice que un modelo predictivo presenta homocedasticidad cuando la varianza del error condicional a las variables explicativas es constante a lo largo de las observaciones.​Un modelo estadístico relaciona el valor de una variable a predecir con el de otras. (Wikipedia)

Deberíamos chequear como son los residuos. Aunque el hecho de que no se cumplan normalidad, independencia, homocedasticidad, no implica que no podamos modelar y confiar en el modelo. En muchos casos el modelo funciona, funciona bien y es consistente. Lo que tenemos que tener más cuidado es con los p-valores, en el valor F (Por lo menos fielmente).

Como hacerlo más robusta?

Varianza de residuos estandarizados. Correción por leverage de las observaciones.

## Heterocedasticidad

En heterocedasticidad los estimadores se vuelven menos eficientes. La varianza del error no se distribuye igual en todas las observaciones. Hay partes del modelo donde logramos peores predicciones.

Mejoras:

* Agregar pesos (Weighted least square - minimos cuadrados pesados)
    * Agregar peso a las observaciones con menor residuo.

## Análisis de outliers

Outliers -> (Continuacion de todo lo que veníamos hablando. El modelo ajusta peor.)

Como detectar? En muchas dimensiones y en datasets grades no es trivial.
- Leave one out cross validation
    - Hago iteraciones para todos los datos, y en cada iteración saco una.
    - Predigo en cada observacion esa que está afuera. 
    - Si esa observacion fuera outlier, la prediccion de ese punto, con un modelo entrenado sin ese punto, va a ser muy muy mala (La distancia va a ser grande).
- Usar metodos robustos (Lo vemos con regularizacion)

## Observaciones influyentes

Hay 4 casos: 

<img src="https://raw.githubusercontent.com/blukitas/EEA-2021-Propio/main/Teorica/07.Regresion/2021-11-14_0_observaciones_influyentes.png" alt="drawing" width="700px" align="middle"/>

1. Recta ajustada, observaciones piolas, sin alto leverage, sin outliers.
2. Puntos sin alto leverage, pero es outlier
3. Punto con alto leverage, pero no es outlier
4. Observacion con alto leverage (palanca) y outlier
    * Este es el caso más grave y el que buscamos evitar. 
    * Modifica el ajuste del modelo y empeor las predicciones generales.
    * **punto influyente**

La forma en la práctica de detectar puntos influyentes es la _distancia de cook_. La puedo calcular con los residuos estandarizados y h_ii.

    D_i = !/2 (rest_i)^2 * ( h_{ii} / (1 - h_{ii}) )

## Estimador de minimos cuadrados

Por Gauss. Es muy viejo.

Ordinary least square => OLS

Es el mejor estimador lineal insesgado que uno puede tener. Minimizar varianza. 

Los supuestos que le pedimos:

* Esperanza de los errores => 0
* Varianza constante, finita, homocedastica
* Distintos errores no esten correlacionados

(Siempre apuntandole a insesgadez)


# Modelado estadístico múltiple

## Utilidad

* Cuantificar incertidumbre de las estimaciones
* Completar la falta de información con "relaciones" matemáticas razonables/justificadas
* Modelar correctamente los fenómenos de interes, discriminando las relaciones "concomitantes" de aquellas que son "esenciales".

**Conceptos útiles**
* Independencia condicionada
    * P (A intersect B | C ) = P( A | C ) * P( B | C )
    * Dos variables que parecen correlacionadas, son independiente cuando las condiciono con una tercera
    * Ejemplo video 3 - modelado múltiple (https://www.youtube.com/watch?v=Q0LN6CC5yK4&list=PLN2e9R_DoC0Qsp46a53RynWXjdl5240f8&index=48)
    * El precio de las propiedades parece ser más alto cuándo vende la inmobiliaria, que si es 'dueño vende'. Cuando la condiciono al precio, me doy cuenta que la relacion no es inmobiliaria_vende con precio, sino metro_cuadrado con precio. _Pero_ que las casas que la inmobiliaria vende tienden a ser mayores en tamaño (Parecen correlacionar pero no es)

La estadística ayuda a modelar correctamente los fenómenos, a que sea más coherente con la realidad. Capturar los fenómenos subyacentes.


# Inferencia modelo lineal múltiple

Es un modelo para la variable aleadotia Y con X_{1} .. X_{p-1} variables regresoras.

$Y_i = \beta_0 + \beta_1 * X_{i1} + \beta_2 * X_{i2} + ... + \beta_{p-1} * X_{i*p-1} + error_i$

Se infieren parámetros (betas). El error es una Normal(0, ð²). 

Los supuestos fuertes:
* Errores distribuyen como normal, son homocedasticos.
* Errores independientes.
* En la práctica no taaaan fuertes, si no se cumples no invalidan el modelo.


Definiciones:
* Regresión polinómica: Regresión donde tengo una variable con muchas transformaciones.
* Weierstrass approximation theorem -> Para cualquier epsilon (error) que propongamos, existe un polinomio p, tal que para todos los x en el intervalo [a,b] tenemos una función que la aproxima con un error < a epsilon. 
    * Los polinomios son densos en las funciones continuas en un compacto 
    * Si yo tengo un x, puedo aproximar un y como una suma de las potencias de x

A que vamos? A que las regresiones son muy poderosas. No es una herramienta simple. Nos da mucha capacidad de entendimiento.

* Y está **condicionada linealmente** a cada X (Por más compleja que sea la función que construye X)
    * La linealidad colabora con la sencillez y la explicabilidad
    * X*beta es la contribución marginal que tiene X sobre la explicación de Y 
* **Aditividad** también -> Se suman los efectos de cada X para explicar Y
    * Es muy importante y muy restrictiva
    * El aporte de X_2 no tiene nada que ver con el valor que aporta X_1
    * Hay interacción entre X_1 y X_2 cuando lo que explica X_1 depende de los niveles de X_2. Es una relación en como explican.
    * Es diferente de la dependencia/independencia entre covariables (Colianelidad - relacion entre covariables), con la interacción entre variables. 


## Notación matricial

Es una forma de describir. Es el modo más natural de describir algunos conceptos. Además el álgebra lineal/matricial es el lenguaje natural de esto.

Vector_Y = Vector_X * Vector_beta + Vector_epsilon
  (n.1)  =   (n.p)  *    (n.1)    +     (n.1)

Puedo pensar el vector:

* E(Y | X) = X * betas
* Var(Y | X) = Matriz_sigma^2 * vector_identidad
    * La matrix varianza, es una matriz que tiene las varianzas en la diagonal y el resto son ceros

## Estimación de parámetros

$X^t X \hat{\beta} = X^t Y$
$\hat{\beta} = (X^t X)^-| X^t Y$

Para hallar los betas, la matriz tiene que se inversibles. Lo cuál implica que no hay variables que compartan información. Eso es colinealidad y tiende a ser más y más frecuente en la medida que sumo variables.

"Proyectar el vector y en la matriz de los p atributos" (Video 8, hay que reverlo)

r = Coeficiente de ?
r^2 = Variabilidad explicada
r^2 ajustado = Para ajustarlo por las dimensiones  

Más dimensiones más nos acercamos. Buscamos minimizar la distancia euclidea. Cuando sumamos dimensiones, le damos más distancia para explorar distancias menores. 

Video 11 -> coeficiente f y r-ajustado


## Multicolanealidad

Video 12

Aumenta varianza => aumenta imprecisión

VIF_j = C_j = 1 / (1-R_j^2)

VIF = Variance inflation factor. La regularización me ayuda a controlar esto. También componentes principales.

R_j es cuanta varianza explica una variable en relación a las otras X. Si correlación con alguna, aumenta la varianza en ese columna.


## Iteracción entre variables

X1 y X2 interactuan. Puedo adicionar variables 

En r:

* ajuste <- lm (Y ~ x_1 + x_2)
    * Aditivo
* ajuste <- lm (Y ~ x_1 * x_2)
    * beta_0 + beta_1 * x_1 + beta_2 * X_2 + beta_1_2 * X_1 * X_2
    * Da errado => Interaccion muy fuerte => Infla la varianza
    * El estadístico F disminuye, pero p_significativo puede dar significativo

(Videos 17-20)

## Selección de modelos

2^k modelos, con k covariables. Puedo generar muchísimos modelos posibles. 

* R^2 => No es un buen selector, pero me habla de la variabilidad explicada.
* R^2_ajustado => Es un mejor predictor
    * A > p => Se controla
* C_'de Mallones
* AIC 
* Criterio bayesiano de Schwartz

Estos últimos 3 penalizan por p (Cantidad de parámetros).


### Metodologías automáticas

1. Probar todos los subconjutos posibles
2. Eliminación backward
3. Selección forward
    * Incorporando variables
4. Stepwise regression
    * Regresión de a pasos

2,3,4 son greedy. Buscan optimizar la búsqueda del modelo.


Enfoques alternativos:

* Multimodel inference -> Dudoso, no tiene tanto respaldo
* Bayesian model averaging -> Dificil de implementar
































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


Matriz de proyeccion -> Toma un vector y lo proyecta sobre el espacio generado de la prediccion


Caer en la trampa dummy
- Si hago one hot encoding, para una variable categórica con k valores diferentes, voy crear k-1 nuevas variables.
- Porq? Porque si creo k variables, voy a tener colinealidad, no va a ser inversible (Entender mejor esto último)
