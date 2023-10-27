# Comandos de Linux

En linux es normal interactuar a menudo con la terminal. Sin embargo para poder interactuar de forma optima, lo mejor es tener al menos una nocion de los comandos básicos. 

Para listar los comandos vamos a dividirlos en 3 grupos:
1. Desplazamiento por el arbol de directorios y creacion de directorios y archivos.
2. Busqueda de archivos y/o directorios.
3. Expresiones regulares

## Desplazamiento por el sistema Linux

### Comando ls

|comando|funcion|
|-|-|
|```ls <directorio>``` | Lista los directorios y archivos del directorio indicado |

#### Ejemplos

El comando `ls` se puede utilizar de muchas maneras.

|comando|accion|
|-|-|
|```ls ``` | Lista los directorios y archivos del directorio actual |
|```ls -l``` | Lista los directorios y archivos del directorio actual en forma de lista |
|```ls -a``` | Lista los directorios y archivos (incluso los ocultos) del directorio actual |
|```ls -la``` | Combina las acciones de `ls -l` y `ls -a` |

Algo interesante de este comando es que al listar los archivos y directorios con el parametro `-l`, se pueden ver los permisos del archivo o directorio, donde:

```bash
drwxr-xr-x 3 user group 4096 oct 24 18:36 Descargas
```

- `d`       -> indica que es un directorio
- `rwx`     -> indica que el usuario propietario de la capeta tiene permisos de lectura (`r`), escritura (`w`) y ejecucion (`x`).
- `r-x`     -> indica que el grupo de la capeta tiene permisos de lectura (`r`) y ejecucion (`x`).
- `r-x`     -> indica que otros tienen permisos de lectura (`r`) y ejecucion (`x`).
- `user`    -> indica el usuario propietario
- `group`   -> indica el grupo

y al final se indican, cantidad de bloques, fecha de creación/modificación y por ultimo el nombre.

### Comando cd

|comando|funcion|
|-|-|
|```cd <directorio>``` | Cambia del directorio actual al directorio indicado |

#### Ejemplos

El comando `cd` se suele utilizar con expresiones que denotan directorios:

- `.` el "directorio" punto equivale a "directorio actual"
- `..` el "directorio" doble punto equivale a "directorio padre"

Entonces sabiendo esto, si estamos en el directorio "home" podemos desplazarnos al directorio "Descargas":

```bash
cd Descargas
```

Luego podemos volver al directorio "home" 

```bash
cd ..
```

También podemos utilizar la salida del comando `pwd` como entrada estandar de `cd`, pero esto es mas avanzado, simplemente para tener en cuenta:

```bash
cd $(pwd)/Descargas
```

Esto tendrá una acción equivalente a `cd Descargas`, pero en el caso de `cd $(pwd)`, dara como entrada a `cd` la ruta absoluta.