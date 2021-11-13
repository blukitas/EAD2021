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

# Notas de clases

Un poco de lo que fue pasando en clase 

### Mitos?

* Puedo decir cosas fuera del rango de aceptación. Puedo extrapolar.
* Los errores no (necesariamente) son normales

* En el modelo cada punto es una variable aleatoria, se distribuye como normal alrededor de ese punto


# Leverage

El valor predicho de un dato puede escribirse como combinacion lineal de las observaciones. 

h_ij = Hat matrix. Es una constante que depende de la cantidad de datos.

* Tremendamente importante. Segunda parte del análisis del modelo lineal.

### Observaciones

Es muy distintos:

* Explicar la esperanza de Y condicionada en X. E(Y | X)
* Predecir Y
