# Comandos de Linux

En linux es normal interactuar a menudo con la terminal. Sin embargo para poder interactuar de forma optima, lo mejor es tener al menos una nocion de los comandos básicos. En esta guía trararé de cubrir todos los aspectos, pero si quieres profundizar un poco más o leer algunas guias de inicio en Linux, esta [página](https://www.linux.org/forums/linux-beginner-tutorials.123/) tiene una buena guía para empezar.

Para listar los comandos vamos a dividirlos en 3 grupos:
1. Desplazamiento por el arbol de directorios y creacion de directorios y archivos.
2. Busqueda de archivos y/o directorios.
3. Expresiones regulares

## Lista de Comandos General

1. ls (Listar):

    Descripción: Muestra el contenido de un directorio.

    Parámetros:

        -l: Muestra la lista en formato largo, que incluye información detallada sobre archivos y directorios.
        -a: Muestra todos los archivos, incluyendo los ocultos.
        -h: Muestra tamaños legibles por humanos (por ejemplo, "1K" en lugar de bytes).

1. cd (Cambiar Directorio):

    Descripción: Permite cambiar el directorio actual.

    Parámetros: No suele tener parámetros, pero puedes especificar la ruta del directorio al que deseas acceder.

1. pwd (Directorio Actual):

    Descripción: Muestra la ruta completa del directorio actual.

    Parámetros: No tiene parámetros adicionales.

1. cp (Copiar):

    Descripción: Copia archivos o directorios.

    Parámetros:

        -r o -R: Copia directorios de forma recursiva.
        -i: Solicita confirmación antes de sobrescribir archivos.

1. mv (Mover):

    Descripción: Mueve o renombra archivos y directorios.

    Parámetros:

        -i: Pide confirmación antes de sobrescribir archivos existentes.
        -u: Solo sobrescribe si el archivo de destino es más antiguo o no existe.

1. rm (Eliminar):

    Descripción: Elimina archivos o directorios.

    Parámetros:

        -r o -R: Elimina directorios de forma recursiva.
        -f: Fuerza la eliminación sin solicitar confirmación.

1. mkdir (Crear Directorio):

    Descripción: Crea nuevos directorios.

    Parámetros:

        -p: Crea directorios padres si no existen.

1. touch (Crear Archivo Vacío):

    Descripción: Crea archivos vacíos.

    Parámetros: No suele tener parámetros adicionales.

1. grep (Buscar Patrón en Archivos):

    Descripción: Busca un patrón en archivos de texto.

    Parámetros:

        -i: Realiza una búsqueda insensible a mayúsculas y minúsculas.
        -r o -R: Busca de manera recursiva en directorios.
        -n: Muestra el número de línea en el que se encuentra el patrón.

1. man (Manual):

    Descripción: Muestra el manual de un comando específico.

    Parámetros: Especifica el nombre del comando del que deseas obtener ayuda.

1. find (Buscar Archivos o Directorios):

    Descripción: Busca archivos o directorios en un sistema de archivos.

    Parámetros:

        ruta - Especifica el directorio donde se realizará la búsqueda.
        -name: Busca por nombre de archivo.
        -type: Filtra por tipo de archivo (fichero o directorio).
        -exec: Ejecuta un comando en los resultados encontrados.

2. tar (Archivar y Comprimir):

    Descripción: Crea archivos comprimidos (archivos tar) y extrae su contenido.

    Parámetros:

        -cvf: Crea un archivo tar.
        -xvf: Extrae archivos de un archivo tar.
        -z: Comprime con gzip.
        -j: Comprime con bzip2.

3. ssh (Secure Shell):

    Descripción: Permite la conexión segura a través de SSH a otro sistema.

    Parámetros:

        usuario@host: Especifica el usuario y el host al que te quieres conectar.
        -p: Cambia el puerto de conexión.
        -i: Especifica una clave privada para la autenticación.

4. chmod (Cambiar Permisos):

    Descripción: Cambia los permisos de archivos y directorios.

    Parámetros:

        u/g/o/a: Representa al propietario, grupo, otros o todos.
        +/-: Agrega o quita permisos.
        r/w/x: Lectura, escritura o ejecución.

1. top (Monitor de Procesos en Tiempo Real):

    Descripción: Muestra información en tiempo real sobre los procesos en ejecución.

    Parámetros: No tiene parámetros específicos, pero puedes interactuar con las opciones dentro del programa.

1. df (Espacio en Disco):

    Descripción: Muestra el espacio disponible en los sistemas de archivos.

    Parámetros:

        -h: Muestra tamaños legibles por humanos.
        -T: Muestra el tipo de sistema de archivos.

1. du (Uso del Espacio en Disco):

    Descripción: Muestra el uso del espacio en disco de archivos y directorios.

    Parámetros:
        -h: Muestra tamaños legibles por humanos.
        -s: Resumen de uso para directorios.

1. ps (Listar Procesos):

    Descripción: Muestra información sobre los procesos en ejecución.
    
    Parámetros:

        aux: Muestra una lista detallada de procesos.
        -e: Lista todos los procesos.

1. history (Historial de Comandos):

    Descripción: Muestra el historial de comandos utilizados en la terminal.

    Parámetros:

        -c: Borra el historial.
        -d número: Borra una entrada específica del historial.

1. sed (Editor Stream):

    Descripción: Procesa y transforma texto.

    Parámetros:
    
        s/buscar/reemplazar/: Sustituye una cadena con otra en el texto.
        -i: Modifica el archivo directamente.


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

### Comando rm

|comando|funcion|
|-|-|
|```rm <fichero>``` | Elimina el fichero indicado |

#### Ejemplos

El comando `rm` tiene varios parametros que le dan una gran funcionalidad, incluso, la de borrar directorios no vacios.

```bash
rm -r <directorio>
```

Borra recursivamente todo lo que hay dentro del directorio, solo si el usuario tiene los permisos necesarios para hacerlo. De igual manera existen algunos ficheros que estan protegidos para el borrado, agregando el parametro `f` (force), fuerza el borrado de estos.

```bash
rm -rf <directorio>
```

A veces queremos borrar casi, pero no todos, los archivos de un directorio. Podemos hacerlo con expresiones regulares, sin embargo, 

```bash 
rm -rfi
```
nos permite ir "eligiendo" que archivos quiero borrar.

Si quisieramos borrar un directorio vacio, estos dos comandos son equivalentes:
```bash
rm -d
rmdir
```

### Comando mv

|comando|funcion|
|-|-|
|```mv <archivo origen> <destino>``` | Mueve el fichero/directorio indicado a la ruta indicada |

#### Ejemplos

Se puede utilizar para cambiar el nombre de un archivo:

```bash
mv archivo1 arhivo2
```

Dando como resultado el cambio de nombre del archivo1 a archivo2