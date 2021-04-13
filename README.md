# MarvelHeroes
Proyecto de prueba para mostrar conceptos de arquitectura de software.

## Instalación:

Clonar el repositorio y, en el directorio del proyecto, ejecutar pod install.

## Explicación de la arquitectura:

El proyecto está overengineered intencionalmente para mostrar la estructura de la arquitectura propuesta.

El objetivo de la arquitectura propuesta es separar por completo todas las responsabilidades del proyecto, de forma que pueda repartirse fácilmente el trabajo entre los desarrolladores.

Las pantallas se encuentran bajo el directorio Sections. El objetivo es que toda la funcionalidad de cada pantalla pueda ser desarrollada dentro del mismo directorio. Así, en el directorio de cada vista tendremos los siguientes elementos:

* Vista: ViewController y su storyboard (si se usan storyboards)
* Presenter: Maneja la lógica de presentación, recibe datos de los repositorios y los muestra al usuario. Recibe las interacciónes del usuario y las envía al router
* Repositories: Repositorios de datos para presentar al usuario
* Routers: Lógica de navegación, decide a dónde navegar a partir de una interacción del usuario
* Openers: Deciden cómo se abre la pantalla, navegada, presentada, con transición, etc. Son protocolos con implementaciones por defecto
* Assemblers: Gestionan las dependencias de las pantallas. Juntan los presenters, repositories y routers de cada pantalla, para generar el viewController a mostrar.

Esta estructura permite la reutilización completa de la lógica de presentación: Para una pantalla, se puede definir un nuevo assembler que use otro repositorio y otro router para cambiar la funcionalidad de la pantalla, sin cambiar su vista ni su presenter.

Tanto los repositorios, como los routers pueden hacer uso de los casos de uso, que encapsulan la lógica de negocio. 

Rootwireframe es la clase encargada de conocer el estado concreto de la aplicación en todo momento. Es el que conoce el viewController que se está mostrando, y sabe a qué pantallas se puede navegar y cómo hacerlo. Para ello implementa todos los protocolos de los openers.

Los componentes de la capa de datos, como pueden ser gestores de comunicaciones, bases de datos, analíticas, etc. Se encuenntran en la carpeta Components

## Próximos pasos:

La aplicación se entrega como un ejemplo básico. A partir de aquí se podrían implementar las siguientes funcionalidades:

* Testing: Los casos de uso son demasiado simples de momento, por lo que no se han implemenntado tests. Idealmente cada caso de uso debería estar testado en un porcentaje cercano al 100%
* Uso de base de datos: Idealmente, la carga de datos debería importarse en base de datos. Esto permitiría un correcto funcionamiento offline, y un acceso a datos (búsquedas, filtros, etc.) más sencillo.
* Integración con rx: Se puede integrar algún framework de suscripciones para eliminar la relación Presentert -> Vista, y para simplificar el código.
* Más funcionalidades: Buscar héroes, filtrar, listado de comics, etc.
