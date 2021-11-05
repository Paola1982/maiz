# Granjavilla

## Intro
Héctor es un granjero que se gana la vida cultivando plantas de distintas especies.
Para ello tiene que sembrar, regar y cosechar sus cultivos. Después de la cosecha, Héctor vende lo que cultivó, obteniendo ganancias en forma de monedas.
Héctor es muy ahorrativo y todas las monedas que obtiene por sus cosechas las guarda.

Actualmente ya contamos con un juego en el que podemos hacer que Héctor se mueva y realice su trabajo de cultivar maíz a partir del teclado. 
Nuestro objetivo es terminar el juego para que Héctor pueda cultivar otras plantas.

### Estructura del proyecto

El proyecto cuenta con la siguiente estructura:
```
- src/            -> Carpeta con el código fuente
  - cultivos.wlk  -> Código de los cultivos
  - hector.wlk    -> Código de Héctor
  - extras.wlk    -> Código de otros objetos
  - juego.wpgm    -> Programa para iniciar el juego
  
- assets/         -> Carpeta con las imágenes y sonidos
```

> Para esta actividad es necesario [tener instalado el IDE de Wollok](https://www.wollok.org/instalacion/).
> Pueden contrar documentación sobre el lenguaje y las herramienas en el sitio web: https://www.wollok.org/documentacion/conceptos/

> Para **importar un proyecto desde Github al IDE** hay que copiar la URI de este repositorio y en Wollok ir al menú: `Archivo -> Importar.. -> Proyecto desde git -> Clonar URI` Wollok detecta automáticamente la URI copiada y luego hay que continuar hasta finalizar las pantallas.

--------

## Paso 1 - Probar el juego

Lo primero que vamos a hacer es probar el estado actual del juego, para eso hay que ejecutar el archivo `juego.wpgm`:

`Click derecho sobre el archivo -> Ejecutar como -> Programa Wollok`

Se debería abrir una pantalla del sistema operativo con el juego. ¡A jugar!

### Controles

| Tecla | Efecto  |
|---|---|
| **Fechas**   | mueven a Héctor |
| **M**   | siembra una semilla de **maíz** en su posición actual |
| **T**   | siembra una semilla de **trigo** en su posición actual. **(No funciona)** |
| **O**   | siembra una semilla de **tomaco** en su posición actual. **(No funciona)** |
| **R**   | **Riega** los cultivos que se encuentren sobre Héctor |
| **C**   | **Cosecha** los cultivos que se encuentren sobre Héctor |
| **V**   | Héctor **vende** todos los cultivos cosechados |


## Paso 2 - Terminar lo que falta

Al probar el juego nos daremos cuenta que hay cultivos que faltan implementar. Debemos **programar el Trigo y el Tomaco** que se encuntran en el archivo `cultivos.wlk` con el siguiente comportamiento:

### Trigo

El trigo conoce su etapa de crecimiento, que comienza en 0. Y su imagen será `trigo_x.png`, donde la x corresponde a la etapa de crecimiento actual.
Al ser regada crece, pasando a la etapa de crecimiento siguiente: de 0 a 1, de 1 a 2, de 2 a 3, de 3 vuelve a 0.
Se puede cosechar si está en nivel de crecimiento 2 o más. Y su valor es de 100 monedas si está en etapa 2, 200 si está en etapa 3. ¿Se podria hacer una cuenta cheta para calcularlo?

En conclusión, el Trigo debería recordar su `etapa  de crecimiento` y entender los siguientes mensajes:

| Mensaje | Comportamiento esperado |
|---|---|
| **image()**   | Armar y retornar un string de la forma `trigo_x.png`, donde la x corresponde a la etapa de crecimiento |
| **regar()**   | Cambiar su `etapa de crecimiento` a la siguiente |
| **sePuedeCosechar()**   | Retornar si su `etapa de crecimiento` es 2 o más |
| **valor()**   | Retornar un número que se calcula como `(etapa de crecimiento - 1) * 100` |

> Si tenés dudas sobre cómo implementar algún método podés mirar cómo está hecho el Maiz 😉

#### Es importante que los cultivos entiendan el mismo mensaje para que Héctor los pueda tratar de la misma manera. Esto se conoce como POLIMORFISMO.


### Tomaco

El Tomaco es una planta hecha y derecha. Su imagen siempre es `tomaco.png`.
Tiene un comportamiento extraño al ser regada: se mueve a la posición de arriba. Si ya está en el borde de arriba, pasa abajo de todo.
Se puede cosechar en cualquier momento y su valor es de 80 monedas por planta.

O sea que el comportamiento del Tomaco quedaría:

| Mensaje | Comportamiento esperado |
|---|---|
| **image()**   | Retornar siempre `tomaco.png` |
| **regar()**   | Cambiar su `position` |
| **sePuedeCosechar()**   | Retornar siempre `true` |
| **valor()**   | Retornar siempre `80` |

> Si tenés dudas sobre cómo cambiar de posición te recomendamos leer la documentación de **Wollok Game**, pestaña `Game` en la documentación del sitio (Moviendo objetos): https://www.wollok.org/documentacion/conceptos/


## Paso 3 - Volver a jugar

Una vez implementado los cultivos que faltan, asegurarse que todo quedó funcionando como se espera y que el programa no tiene errores.

Si algún cultivo no aparece revisá los métodos para sembrar de Héctor en el archivo `hector.wlk`. Recordá que para crear un objeto a partir de una clase se usa `new`. Esta operación se conoce como **INSTANCIAR**.

## Paso 4 - Conclusiones

En esta actividad estuvimos programando nuevos cultivos, pero en vez de escribir los métodos y atributos (que definen el comportamiento de un objeto) en los mismos objetos lo hicimos en una _CLASE_. 

**Las clases nos permiten crear muchos objetos distintos, pero con el mismo comportamiento**, a esto lo conocemos como "_instanciar_ un objeto de una clase". También decimos que los objetos creados a partir de una clase son _instancias_ de esa clase. Gracias a esto logramos que Héctor pueda cultivar muchos maíces, trigos y tomacos a lo largo de la granja. 

## Paso 5 - Personalizar tu juego

¡Muy bien, logramos el objetivo de la actividad! Ahora podés personalizar tu juego como quieras, te dejamos algunas ideas:

- Agregar nuevos cultivos e inventarles su comportamiento. Te dejamos algunas imágenes de `arbusto`s por si querés usar. Hay que pensar: _¿Qué pensajes debe entender los objetos que representan cultivos?_

- Extender el juego con otros objetos. Te dejamos imágenes de algunos animales de granja por si querés usar. Hay que pensar: _¿Vamos a querer un solo objeto o muchos del mismo estilo?_ Esto determina si vamos a programar un objeto autodefinido o una clase.

- Cambiar el comportamiento de algún objeto. Sí, podés cambiar el código que ya está escrito para que haga otra cosa. ¿Viste el mercado que está en el juego? Ahora no hace mucho, pero se podría hacer que Héctor venda los cultivos cuando pase por allí.

- ¿Alguna otra idea? Compartila con el grupo 😃
