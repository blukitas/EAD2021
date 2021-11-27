# Regularizacion

Ayuda a mejorar la estimación y evitar el overfitting. Casi todos los métodos lo incorporaron como parámetro a L1 y L2.

* La información posee frecuentemente datos atípicos 
	* Mediciones extremas
	* Mediciones erroneas
* Los datos atípicos pueden afectar fuertemente el resultado de la aplicaciión de los métodos clásicos
	* Lo vimos en lineal
	* El cuadrado reacciona fuerte a los lejanos
	* El modulo reacciona más lento -> M-estimadores de regresión.
		* Más robusto pero menos eficiente
	* Estimador LMS, least median square -> Mediana y minimo
	* Lo **eficiente** es la mezcla =>  Función de huber. 
		* Regulador L1 (Por espacio de dimension 1)
* Puede ser de interes la detección de los datos atípicos (Novelty detection)

**Regularización - shrinkage**

* Técnica para prevenir el **Overfitting**, mediante la penalización de la complejidad del modelo.
* Controla los desbalances entre el número de observaciones y el número de variables.
* Como método automático de **selección de variables** (Lasso).
* **Reduce** la alta variabilidad observada en situaciones de **multicolinealidad** (Ridge).
* Reduce la Varianza pero **Aumenta el Sesgo** de los estimadores !
* No son equivariantes por cambios de escala ! **Hay que estandarizar** las variables 


## Ridge

Agrega un coeficiente de penalización. Encoge los coeficientes hacia el cero. Desde el 1 a p. Castiga, lambda * Sum(betas^2).

Videos: https://www.youtube.com/watch?v=3GBK-igsmKw&list=PLN2e9R_DoC0Rw5koPsfov-dCs7zV6SSIp (Entre 4 - 11 )

Es sezgado. Es el mejor de los sezgados. Error cuadrado minimo es el mejor de los insesgados. 

Tira a 0 los estimado. Si tendemos a overfitting, te hace salirte. 

Lo lleva a matriz menos condicionada


mse_ridge < mse_ols

como lambda optimo? => Cross validation

mayor es menos complejo se vuelve el modelop. Nos mueve a la izquiera en el trade off sesgo-varianza (Para el lado del sesgo). Hay que encontrar un equilibrio, porque en un punto disminuyendo la varianza pero aumentando el sesgo pierdo. 

Ayuda a minimizar el overfitting, y la multicolinealidad. Ambos son problemas de varianza. Todos los métodos más neuvos ya los vienen implementando.

Con Ridge, el modelo se vuelve más estable.

## Lasso

Penaliza por la suma del modulo de los beta (1 a p). Castiga lambda * sum(modulo de beta) 

Videos: https://www.youtube.com/watch?v=3GBK-igsmKw&list=PLN2e9R_DoC0Rw5koPsfov-dCs7zV6SSIp (Entre 11 y 14)

* Que se vuelva más estable. Overfittee menos. 
* Ayuda a elegir variables
	* En Lasso, cuando vamos subiendo lambda más variables tienden a anularse.
	* Es útil para ir matando las variables que menos aportan
	

## Glmnet

Parámetro elasticnet. Es una mezcla de ridge y lasso. 

* En alfa = 1 => Lasso
* En alfa = 0 => Ridge
* En intermedio combinación convexa de ambos métodos





## Ventajas

* Reduce varianza, aumenta sesgo. En un punto me paso del equilibrio
* Reduce colinealidad
	* Aumenta el overvitting la colinealidad. Sobreparametrizado. Intentando dar respuestas con poca información. 
	
	
	
	