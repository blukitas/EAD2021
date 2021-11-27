# Inferencia bayesiana

Como contracara al enfoque frecuentista (Lo que vimos hasta recién). El enfoque Bayesiano involucra alguna definición a priori.

La distribución a posteriori (La que calculo), es la distribución a priori pasada/actualizada por los datos.

p(theta|y ) ~ p(y|theta) * p(theta)

Historicamente era muy complejo/costoso a nivel de costo. No cualquier distribución a priori, pasada por Y daba un modelo paramétrico que yo pudiera medir.

## Distribución a priori

Como elijo una distribución a priori? 


## Vs Regresión clásica

### Clasica
* Parametros fijos y target Y (V.A.IID) para el modelo, se distribuye como una N(\alpha + \beta X, \sigma)
* Esimación de los estimadores. 
    * \alfa(X,Y) ~ N(\alfa, \sigma / sqrt(n))
    * \beta(X,Y) ~ N(\beta, \sigma / (S_x * sqrt(n)) )
    * \hat{\sigma(Y,X)} / \sigma ~ \chi_{n-2}^2
* Obtenemos
    * Estimaciones puntuales
    * Intervalos de confianza
    * Test de hipotesis y p-valor

#### Ventajas clasico:
* Supuestos simples y pocos
    * Errores con media cero
    * Errores con varanza desconocida y se distribuyen como normales (Homocedasticidad)
    * Errores con distribución normal
    * Errores independientes y no correlacionado con X_i 
        * Evitar cesgos 

#### Desventajas clásico:
* La información que se obtiene del parámetro es escasa e indirecta

## Regresión Bayesiana

( Y enfoque bayesiano ) 

* Suponer a los parámetros como variables aleatorias. 
    * Los tres parametros ya no son fijos y conocidos. Sino que son una distribución 
        * α ∼ N(0, τα) con prior (arbitrariamente) normal
        * β ∼ N(0, τβ) con prior (arbitrariamente) normal
        * σ ∼ Exp(λ) con prior (arbitrariamente) exponencial
    * τα es fijo y propuesto por el investigador
    * τβ es fijo y propuesto por el investigador
    * λ es fijo y propuesto por el investigador
* En la estimación ajusto esa distribución que le doy apriori a los parámetros
    * Los dejo moverse dentro de esa distribución
    * Me da flexibilidad, pero también me impacta muy fuerte
    * Paso la distribución a priori por los datos y obtengo una distribución a posteriori
        * Y | distribución_apriori
        * La posterior va a tener parte de la Y, y parte de la prior

### Ventaja bayesiana:
* La información que se obtiene del paramétro es muy rica. Por ejemplo, la posterior del parámetro β brinda una medida directa de la certeza de los posibles valores de β, condicional a las observaciones.

### Desventajas bayesiana:
* La influencia de la distribución a priori es todo. Si le erro ahí se complica.

## Prior

Uno debería conocer el dominio y encontrar la función que mejor se acople a la lógica del fenómeno.

Orientamos la búsqueda en una dirección y le damos un espacio donde buscar, que despues condicionamos con la información de las observaciones y obtenemos nuestro modelo. (Lo condicionamos mucho, pero a su vez los datos condicionan ese modelo)

Arranco con una distribución a priori => Condicion/ajusto con los datos => Obtengo una posteriori

* likelihood => p(y | theta)
    * theta es la distribución a priori
* $p(\theta | y ) = \frac{p(y|\theta) p(\theta)}{p(y)}$
    * p(y) => Distribución marginal de las observaciones
    * $\theta$ está en dimensión 3 (alfa, beta, sigma)
    * Analíticamente es dificil de calcular, pero es computable 

Que necesitamos para calcular? 
- Los estimadores
    - alfa - Ej; ~ N(0, 100)
    - beta - Ej; ~ N(0, 100)
    - sigma - Ej; ~ Exp(lambda=0.1))
- Como se relacionan
    - Ej: y ~ N(alfa + beta * X, sigma)

Hoy se volvió relevante. Pero antiguamente no ponían cualquier función porque era muy dificil de calcular. No todas las función me dan una posteriori paramétrica calculable y con propiedades conocidas.

**Hoy**: Se usa en la práctica el proceso montecarlo markov chain. 'Muy sencillo'. Es un proceso analítico iterativo. 


## Regresion Bayesiana robusta

Los outliers se colan en la parte del likelihood en el modelo de regresión bayesiana normal. Afectan a la salida. En un caso de regresión lineal, con bayesiana llevo al mismo modelo con lm. 

Se va ajustando la posterior en las iteraciones con cada dato. Cuando pasa por un outlier se deforma. Lo mismo que con la otra. 

* Como lo atajamos? Haciendo más robusta el calculo del likelihood.
    * likelihood que tan verosimil ver esa observación en nuestro modelo
    * likelihood conecta el espacio de la prior y el espacio de la posterior
    * Por ejemplo la normal es menos flexible a los outliers, la t_student 2 grados de libertad es más tolerante por ejemplo (La hace más robusta a los outliers)


## Montecarlo Markov Chain

* El algoritmo metropolis
    * Principio sobre el que apoya
    * Algoritmo
        1. genero alfa_0 aleatorio inicial
        2. alfa_viejo = alfa_0
        3. genero alfa_nuevo ~ normal(alfa_viejo)
        4. calculo r = posterior(nuevo) / posterior(Viejo)
        5. genero u ~ U(0,1)
        6. Si u < r => alfa_nuevo = alfa_viejo ; Sino => guardo alfa_nuevo
        7. vuelvo a 3
    * Este es un algoritmo (tipo aceptación/rechazo) de Monte Carlo (basado en la generación de números pseudo aleatorios) Markov Chain de grado 1 (cada nuevo alfa sólo depende del anterior) en el que la distribución de la sucesión de alfas converge a la distribución a posteriori deseada.
    * El algoritmo sólo requiere contar con una función proporcional a la distribución a posteriori que sea numéricamente evaluale.

