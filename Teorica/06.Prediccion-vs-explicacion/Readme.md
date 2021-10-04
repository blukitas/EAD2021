# Modelos predictivos vs modelos explicativos

## Modelo predictivo

Intenta desarrollar mecanismos que predigan un futuro valor de T dados ciertos valores de X. 

**objetivo** -> Aproximar a Y.

## Modelo explicativo

Intenta desarrollar modelos que testean, verifican e infieren relaciones causales entre variables. 

**objetivo** -> Encontrar las relaciones entre variables. 

Tener una explicación sensata. Que sea racional, gira alrededor del sesgo. 


## Cual es el problema?

Tengo que elegir. No puedo optimizar la explicación y la prediccion. La razón está en como miro los datos. 

Ejemplos de cual está en cada lado:

| Machine learning | Modelado estadísticos                      |
|------------------|--------------------------------------------|
| KNN              | Modelos Lineales                           | 
| Redes neuronales | Modelos lineales generalizados             |
| Random forest    | Modelos aditivos generalizados             |
| SVM              | Arboles de decisión (CART)                 |
| Gradint boosting | Modelos bayesianos                         |
|                  | Modelos semiparamétricos                   |
|                  | Sistemas de ecuaciones estructurales (SEM) |

El modelado estadístico se ha ido expandiendo, por ejemplo las últimas técnicas bayesianas.

El machine learning van generando herramientas explicativas. Por ejemplo valores SHAP, las técnicas de extracciones de dependencias parciales. 


