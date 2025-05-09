
> [!IMPORTANT]
> No hagas ejercicios si no entendiste e interiorizaste esto antes. Leelo.

# 1. ¿QUÉ ES UN PATRÓN DE DISEÑO?

Según Christopher Alexander, “cada patrón describe un problema que ocurre una y otra vez en nuestro entorno, así como la solución de ese problema, de tal modo que se pueda aplicar esta solución un millón de veces, sin hacer lo mismo dos veces” [AIS+77, página x]. Aunque Alexander se refería a patrones en ciudades y edificios, lo que dice también es válido para patrones de diseño orientados a objetos. Nuestros sistemas de software expresan, en términos de objetos e interfaces, en vez de paredes y puertas, pero la esencia de ambos tipos de patrones se encuentra en solucionar un problema dentro de un contexto.

En general, un patrón tiene cuatro elementos esenciales:

1. **El nombre del patrón** permite describir, en una o dos palabras, un problema de diseño junto con su solución de forma sucinta. Al dar nombre a un patrón inmediatamente estamos incrementando nuestro vocabulario de diseño, lo que nos permite diseñar con mayor abstracción. Tener un vocabulario de patrones nos permite hablar de ellos con otros colegas, mencionarlos en nuestras reuniones o incluirlos en nuestra documentación. De esta manera, resulta más fácil pensar en nuestros diseños y transmitirlos a otros, junto con sus ventajas e inconvenientes. Encontrar buenos nombres ha sido una de las partes más difíciles al desarrollar nuestra colección de patrones.

2. **El problema** describe cuándo aplicar el patrón. Explica el problema y su contexto. Puede describir problemas concretos de diseño (por ejemplo, cómo representar algoritmos como objetos), o cómo las estructuras de clases u objetos que son sintomáticas de una situación inflexible. A veces el problema incluye una lista de condiciones que deben darse para que tenga sentido aplicar el patrón.

3. **La solución** describe los elementos que constituyen el diseño, sus relaciones, responsabilidades y colaboraciones. La solución no describe un diseño o una implementación concretos, sino una plantilla que puede ser aplicada en muchas situaciones distintas. El patrón proporciona una descripción abstracta de un problema de diseño y de cómo una organización general de elementos (en nuestro caso, clases y objetos) lo soluciona.

4. **Las consecuencias** son los resultados del patrón, los beneficios e inconvenientes de aplicar el patrón. Aunque cuando se describen soluciones de diseño muchas veces no se mencionan sus consecuencias, éstas son fundamentales para evaluar las alternativas de diseño y comprender los costos y beneficios de aplicar el patrón. Las consecuencias de un software suelen referirse a compromiso entre espacio y tiempo. También pueden lenguaje e implementación. La reutilización suele ser uno de los factores de diseño más orientados a objetos. Las consecuencias de un patrón incluyen su impacto sobre la flexibilidad, extensibilidad y portabilidad de un sistema. Incluir estas consecuencias de un modo explícito nos ayudará a comprenderlas y evaluarlas.

Qué es y qué no es un patrón de diseño es una cuestión que depende del punto de vista de cada uno. Lo que para una persona es un patrón puede ser un bloque primitivo de construcción para otra.

Un patrón de diseño muestra, nombra e identifica los aspectos clave de una estructura de diseño común, lo que hace útiles para crear diseños orientados a objetos reutilizables. El patrón de diseño identifica clases e instancias participantes, sus roles y colaboraciones, y la distribución de responsabilidades. Cada patrón de diseño proporciona una representación general de una solución de diseño que puede adaptarse a diferentes situaciones dentro de cierto rango de diseño. Cada patrón permite diseñar software orientado a objetos con mayor facilidad, eficacia y comprensión.


---
# 2. DESCRIPCIÓN DE LOS PATRONES DE DISEÑO

**¿Cómo describimos los patrones de diseño?** Las notaciones gráficas, aunque importantes, no son suficientes. Simplemente representan el producto final del proceso de diseño, como las relaciones entre clases y objetos. Para reutilizar el diseño, debemos hacer constar las decisiones, alternativas y ventajas e inconvenientes que dieron lugar a él. También son importantes los ejemplos concretos, porque nos ayudan a ver el diseño en acción.

Describimos los patrones de diseño empleando un formato consistente. Cada patrón se divide en secciones de acuerdo a la siguiente plantilla. Ésta da una estructura uniforme a la información, haciendo que los patrones de diseño sean más fáciles de aprender, comparar y usar.

### Nombre del patrón

Un buen nombre transmite sucintamente su esencia. Un buen nombre es vital, porque pasará a formar parte de nuestro vocabulario de diseño.

### Clasificación

Según su propósito (qué hace) se clasifican en patrones creacionales, estructurales y de comportamiento.
Según su ámbito se clasifican en patrones a objetos y a clases.

### Propósito

Una frase breve que responde a las siguientes cuestiones: ¿Qué hace este patrón de diseño? ¿En qué se basa? ¿Cuál es el problema concreto de diseño que resuelve?

### Motivación

Un escenario que ilustra un problema de diseño y cómo las estructuras de clases y objetos del patrón resuelven el problema. El escenario ayudará a entender la descripción que sigue.

### Aplicabilidad

¿En qué situaciones se puede aplicar el patrón de diseño? ¿Qué ejemplos hay de malos diseños que el patrón puede resolver? ¿Cómo se puede reconocer dichas situaciones?

### Estructura

Una representación gráfica de las clases del patrón usando una notación basada en la Técnica de Modelado de Objetos (OMT). También hacemos uso de diagramas de interacción para mostrar secuencias de peticiones y colaboraciones entre objetos.

### Participantes

Las clases y objetos participantes en el patrón de diseño, junto con sus responsabilidades.

### Colaboraciones

Cómo colaboran los participantes para llevar a cabo sus responsabilidades.

### Consecuencias

¿Cómo consigue el patrón sus objetivos? ¿Cuáles son las ventajas e inconvenientes y los resultados de usar el patrón? ¿Qué aspectos de la estructura del sistema se pueden modificar de forma directa o indirecta?

### Implementación

¿Cuáles son las dificultades, trucos o técnicas que deberíamos tener en cuenta a la hora de aplicar el patrón? ¿Hay consecuencias específicas del lenguaje?

### Código de ejemplo

Fragmentos de código que muestran cómo se puede implementar el patrón en C++ o en Smalltalk.

### Usos conocidos

Ejemplos del patrón en sistemas reales. Incluimos al menos dos ejemplos de diferentes dominios.

### Patrones relacionados

¿Qué patrones de diseño están estrechamente relacionados con éste? ¿Cuáles son las principales diferencias? ¿Con qué otros patrones debería usarse?



---
# 3 EL CATÁLOGO DE PATRONES DE DISEÑO

El catálogo del libro de GoF contiene 23 patrones de diseño.
A continuación, se listarán solo los que se dictaron durante la cursada de OO2 en 2025, aunque se recomienda encarecidemente leer el libro.
Para cada uno de ellos se muestra el nombre y el propósito, para ofrecer una perspectiva general. Cada uno cuenta con un listado donde se indica en qué ejercicios específicos se aplicó (oculto, para que lo pienses vos mismo).

### Adapter
Convierte la interfaz de una clase en otra distinta que es la que esperan los clientes. Permite que cooperen clases que de otra manera no podrían por tener interfaces incompatibles.

### Builder
Separa la construcción de un objeto complejo de su representación, de forma que el mismo proceso de construcción puede crear diferentes representaciones.

### Composite
Combina objetos en estructuras de árbol para representar jerarquíasde parte-todo. Permite que los clientes traten de manera uniforme a los objetos individuales y a los compuestos.

### Decorator
Añade dinámicamente nuevas responsabilidades a un objeto, proporcionando una alternativa flexible a la herencia para extender la funcionalidad.

### Proxy
Proporciona un sustituto o representante de otro objeto para controlar el acceso a éste.

### State
Permite que un objeto modifique su comportamiento cada vez que cambie su estado interno. Parecerá que cambia la clase del objeto.

### Strategy
Defina una familia de algoritmos, encapsula cada uno de ellos y los hace intercambiables. Permite que un algoritmo vaíe independientemente de los clientes que lo usan.

### Template Method
Define en una operación el esqueleto de un algoritmo, delegando en las subclases algunos de sus pasos. Permite que las subclases redefinan ciertos pasos del algortimo sin cambiar su estructura.

### Null object
El patrón Null Object proporciona un objeto que encapsula la ausencia de otro objeto mediante un comportamiento predeterminado neutro (no hace nada), de modo que el cliente puede invocar métodos sin necesidad de realizar comprobaciones de nulos en tiempo de ejecución


---
# 4 Cómo seleccionar un patrón de diseño

Con más de 20 patrones de diseño para elegir en el catálogo, puede ser difícil encontrar aquel que resuelva un problema de diseño concreto, especialmente si el catálogo es nuevo y desconocido para el lector. A continuación se muestran diferentes enfoques para encontrar el patrón de diseño que se adecue a su problema:

- **Considere cómo los patrones de diseño solucionan problemas de diseño.**  
  En la Sección 1.6 del libro de GoF, se muestra cómo los patrones ayudan a encontrar los objetos apropiados, a determinar la granularidad, a especificar interfaces de objetos y otros aspectos clave para resolver problemas de diseño. Consultar estas discusiones puede guiar su búsqueda del patrón adecuado.

- **Hojee las secciones “Propósito”.**  
  La Sección anterior (1.4)  enumera las secciones “Propósito” de todos los patrones del catálogo. Lea el propósito de cada patrón para encontrar uno o varios que parezcan relevantes para su problema.

- **Estudie cómo se interrelacionan los patrones.**  
  Estudiar las relaciones entre los patrones del catálogo puede ayudarle a dirigirse al patrón o grupo de patrones más apropiado.

- **Estudie patrones de propósito similar.**  
  El catálogo está organizado en tres capítulos: patrones de creación, patrones estructurales y patrones de comportamiento. Cada capítulo comienza con comentarios de introducción y termina con una sección que compara y contrasta los patrones. Estos comentarios ayudan a comprender similitudes y diferencias entre patrones de propósito similar.

- **Examine una causa de rediseño.**  
  En el libro, en la sección 1.6 (página 21) presentan causas de rediseño comunes. Estudielas para ver si su problema involucra una o varias de ellas. Una vez hecho esto, consulte los patrones que ayudan a evitar esas causas de rediseño.

- **Piense qué debería ser variable en su diseño.**  
  Este enfoque es el opuesto a centrarse en las causas de rediseño. En vez de tener en cuenta qué podría forzar un cambio en el diseño, piense en qué quiere que pueda ser cambiado sin necesidad de rediseñar. Se trata de centrarse en encasular el concepto que puede variar, un tema común a muchos patrones de diseño.
  La siguiene tabla, enumera los aspectos de diseño que los patrones permiten variar de forma independiente, es decir, sin rediseño.

| Propósito             | Patrón de diseño   | Aspectos que pueden variar                                  |
|-----------------------|--------------------|-------------------------------------------------------------|
| De creación           | **Builder**        | cómo se crea un objeto compuesto                            |
| Estructurales         | **Adapter**        | la interfaz de un objeto                                    |
| Estructurales         | **Composite**      | la estructura y composición de un objeto                    |
| Estructurales         | **Decorator**      | las responsabilidades de un objeto sin usar la herencia     |
| Estructurales         | **Proxy**          | cómo se accede a un objeto; su ubicación                    |
| De comportamiento     | **Template Method**| los pasos de un algoritmo                                    |
| De comportamiento     | **Strategy**       | un algoritmo                                                |
| De comportamiento     | **State**          | el estado de un objeto                                      |
| De comportamiento     | **Null Object**    | el comportamiento ante la ausencia de un objeto real        |




---
# 5 Cómo usar un patrón de diseño

Una vez que haya elegido un patrón de diseño, ¿cómo usarlo? A continuación se presenta un enfoque paso a paso para aplicarlo de manera efectiva:

1. **Lea el patrón de principio a fin para tener perspectiva.**  
   Preste especial atención a las secciones “Aplicabilidad” y “Consecuencias” para asegurarse de que el patrón es el adecuado para su problema.

2. **Estudie las secciones de Estructura, Participantes y Colaboraciones.**  
   Asegúrese de entender las clases y objetos del patrón y cómo se relacionan entre ellos.

3. **Examine la sección “Código de Ejemplo” para ver un ejemplo concreto.**  
   Estudiar el código ayuda a comprender cómo implementar el patrón en su propio sistema.

4. **Elija nombres significativos en el contexto de su aplicación.**  
   Adapte los nombres de los participantes del patrón para que reflejen las entidades de su dominio. Por ejemplo, si aplica un patrón Strategy al formateo de texto, use nombres como `EstrategiaComposiciónSimple` o `EstrategiaComposiciónTeX`.

5. **Defina las clases.**  
   Declare sus interfaces, establezca relaciones de herencia y defina las variables de instancia que almacenan datos y referencias. Identifique las clases existentes en su aplicación que se verán afectadas y modifíquelas en consecuencia.

6. **Defina nombres específicos de la aplicación para los métodos.**  
   Asigne nombres a los métodos basándose en las responsabilidades del dominio. Por ejemplo, use un prefijo como `crear*` para los métodos que generan objetos.

7. **Implemente las operaciones para cumplir responsabilidades y colaboraciones.**  
   Siga las guías de la sección “Implementación” y apoye­se en los fragmentos de código de la sección “Código de Ejemplo” para escribir la lógica definitiva.



Estas son sólo unas directrices generales que le pueden servir para empezar a trabajar con patrones de diseño en poco tiempo, luego usted desarrollará su propio método para trabajar con ellos.

Ninguna discusión sobre cómo usar patrones de diseño estaría completa sin unas pocas palabras sobre cómo NO usarlos. Los patrones de diseño no deben aplicarse indiscriminadamente. Muchas veces consiguen flexibilidad y variabilidad a costa de introducir niveles adicionales de indirección, y eso puede complicar un diseño o disminuir el rendimiento. Un patrón de diseño útil se debería aplicar cuando su flexibilidad proporcione un beneficio real. Las secciones de “Consecuencias” son las más valiosas a la hora de evaluar los beneficios y los costes de un patrón.

