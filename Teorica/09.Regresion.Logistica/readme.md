# Modelo lineal generalizado (GLM)

## ¿ Para que sirve GLM ?

* Para **Predecir** la variable respuesta (Y) en contextos de NO Normalidad y Heterocedasticidad.
* Para **Inferir** el efecto de covariables (X) en la respuesta (Y).
* Para _Modelar la DISTRIBUCION de Y_ condicional a X

En el modelo linea Y se asume como normal, y la media de esa normal está condicionada al valor de la ecuación en:
    
$Y_i | X_i \sim N(\beta_0 + \beta_1 * X_i, \sigma^2)$

* El modelo lineal es un caso específico. Donde Mu a la ecuación que encontré del modelo lineal valuado en x_i.

En GLM generalizo eso, y puedo modelar Y como quiero. Tomar un modelo paramétrico probabilístico y modelar los parámetros del mismo en fucniṕon de cierto features observables.

$ Y | X \sim N(\mu_\beta(x_1, x_2, .., x_n), \sigma^2)$ 

* Mu => modelo de posición de N, no estimo mu, estimo los betas. Estimando los betas => obtengo el mu.


$ Y | X \sim N(\mu_\beta(X), \sigma_\gamma(X))$ 

* Generalizo también la varianza
* Mu y Sigma los puedo calcular en función de las características que estoy viendo
    * No tienen que ser las mismas para mu y para sigma
    * Se ajustan libremente
    * No tienen que ser todas las features, las necesarias
    * Elijo con la significatividad de cada feature para mu y varianza

$ Y | X \sim F(\theta_\beta(x))$

* x => Vector de features
* Y => V.A.
* Theta => Parámetros a ser estimados
* F => Modelo probabilistico
    * Puede ser gamma, pareto
    * $F(\mu_beta(X), \sigma_gamma(X), \nu_\eta(X) \tau_\kappa(X))$
        * Mu => Posicion
        * Sigma => Escala o dispersión
        * Nu => Forma 1
        * Tau => Forma 2
        * Estos son los parámetros naturales de la distribución. Los estimo en función de los X - los features -


## Regresión logística

Cambia el esquema usando **expit/logit**. Expit es la inversa del logaritmo. Mapea una lineal en un espacio [0, 1]. Cuando tengo una dicotómica, es una especie de sinuoide.

P(Y=1 | X) = Expit(\beta_0 + \beta_1 * X_1 + ... + \beta_p * X_p)

Se transforma en 

Logit(P(Y=1 | X)) \beta_0 + \beta_1 * X_1 + ... + \beta_p * X_p

_Que es logit?_

* Logit(t) = log (t / (1-t) ) => Mapea reales en espacio [0, 1]
* Parecida a la función de activacion de las neuronas de la red neuronal (Uno de los posibles)

### Para varias clases

Puedo clasificar entre K clases, hago K-1 regresiones logísticas. Usa softmax, minuto 3:40 => está la ecuación. 


## Deviance como residuos de un modelo

Dev(Mod) = -2 * Log (L(Mod) / L(Sat) ) >= 0

* Mod => Modelo ajustado
* Sat => Modelo saturado
* Dev => residuos
* Null dev => Modelo nulo, de una sola constante. Tiene que tener el mayor deviance.
     * Solo con intercept
* Grados de libertad => n - p (Registros - parámetros)


Deviance explicada => (Dev(Mod_null) - Dev(Mod)) / Dev(Mode_null)


## Regresión Gamma


Gamma modela fenómenos positivos, depende de K y theta.  

* https://www.youtube.com/watch?v=CWsPiimtOPo&list=PLN2e9R_DoC0QqJC5lpeeiMaPlSUvuIzJS
* Videos 11 - 15


$X \sim Gamma(K, \theta)$ -> Se suele decir, otra forma es con \mu y \phi (Sigma/dispersión = raiz(phi))

* k > 0
* theta > 0
* f(x;k;theta)
* \eta_1 = g_1(\mu) = log(\mu) = X * \beta_1
* \eta_2 = g_2(\sigma) = log(\sigma) = X * \beta_2
    * g => link de locación
    * \eta => predictores lineales

Modelos **muy flexibles**. Estimo la distribución de cada punto de Y_i | x_i. Es infinitamente potente (?). Tengo que acercarme al modelo que modela mi fenómeno.

Cuatro parámetros:

* \eta_1 => Mu
* \eta_2 => Sigma
* \eta_3 => Tau
* \eta_4 => Nu

Se usa mucho en seguros.