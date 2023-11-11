# Comandos de Linux

En linux es normal interactuar a menudo con la terminal. Sin embargo para poder interactuar de forma optima, lo mejor es tener al menos una nocion de los comandos básicos. En esta guía trararé de cubrir todos los aspectos, pero si quieres profundizar un poco más o leer algunas guias de inicio en Linux, esta [página](https://www.linux.org/forums/linux-beginner-tutorials.123/) tiene una buena guía para empezar.

Para listar los comandos vamos a dividirlos en 3 grupos:
1. Lista general de comandos.
2. Desplazamiento por el arbol de directorios y uso de comandos.
3. Busqueda de archivos y/o directorios.
4. Expresiones regulares

## Lista de Comandos General

1. ls (Listar):

    Descripción: Muestra el contenido de un directorio.

    Parámetros:

        -l: Muestra la lista en formato largo, que incluye información detallada sobre archivos y directorios.
        -a: Muestra todos los archivos, incluyendo los ocultos.
        -h: Muestra tamaños legibles por humanos (por ejemplo, "1K" en lugar de bytes).

2. cd (Cambiar Directorio):

    Descripción: Permite cambiar el directorio actual.

    Parámetros: No suele tener parámetros, pero puedes especificar la ruta del directorio al que deseas acceder.

3. pwd (Imprimir directorio acutal):

    Descripción: Muestra la ruta completa del directorio actual.

    Parámetros: No tiene parámetros adicionales.

4. cp (Copiar):

    Descripción: Copia archivos o directorios.

    Parámetros:

        -r o -R: Copia directorios de forma recursiva.
        -i: Solicita confirmación antes de sobrescribir archivos.

5. mv (Mover):

    Descripción: Mueve o renombra archivos y directorios.

    Parámetros:

        -i: Pide confirmación antes de sobrescribir archivos existentes.
        -u: Solo sobrescribe si el archivo de destino es más antiguo o no existe.

6. rm (Eliminar):

    Descripción: Elimina archivos o directorios.

    Parámetros:

        -r o -R: Elimina directorios de forma recursiva.
        -f: Fuerza la eliminación sin solicitar confirmación.

7. mkdir (Crear Directorio):

    Descripción: Crea nuevos directorios.

    Parámetros:

        -p: Crea directorios padres si no existen.

8. touch (Crear Archivo Vacío):

    Descripción: Crea archivos vacíos.

    Parámetros: No suele tener parámetros adicionales.

9. grep (Buscar Patrón en Archivos):

    Descripción: Busca un patrón en archivos de texto.

    Parámetros:

        -i: Realiza una búsqueda insensible a mayúsculas y minúsculas.
        -r o -R: Busca de manera recursiva en directorios.
        -n: Muestra el número de línea en el que se encuentra el patrón.

10. man (Manual):

    Descripción: Muestra el manual de un comando específico.

    Parámetros: Especifica el nombre del comando del que deseas obtener ayuda.

11. find (Buscar Archivos o Directorios):

    Descripción: Busca archivos o directorios en un sistema de archivos.

    Parámetros:

        ruta - Especifica el directorio donde se realizará la búsqueda.
        -name: Busca por nombre de archivo.
        -type: Filtra por tipo de archivo (fichero o directorio).
        -exec: Ejecuta un comando en los resultados encontrados.

12. tar (Archivar y Comprimir):

    Descripción: Crea archivos comprimidos (archivos tar) y extrae su contenido.

    Parámetros:

        -cvf: Crea un archivo tar.
        -xvf: Extrae archivos de un archivo tar.
        -z: Comprime con gzip.
        -j: Comprime con bzip2.

13. ssh (Secure Shell):

    Descripción: Permite la conexión segura a través de SSH a otro sistema.

    Parámetros:

        usuario@host: Especifica el usuario y el host al que te quieres conectar.
        -p: Cambia el puerto de conexión.
        -i: Especifica una clave privada para la autenticación.

14. chmod (Cambiar Permisos):

    Descripción: Cambia los permisos de archivos y directorios.

    Parámetros:

        u/g/o/a: Representa al propietario, grupo, otros o todos.
        +/-: Agrega o quita permisos.
        r/w/x: Lectura, escritura o ejecución.

15. top (Monitor de Procesos en Tiempo Real):

    Descripción: Muestra información en tiempo real sobre los procesos en ejecución.

    Parámetros: No tiene parámetros específicos, pero puedes interactuar con las opciones dentro del programa.

16. df (Espacio en Disco):

    Descripción: Muestra el espacio disponible en los sistemas de archivos.

    Parámetros:

        -h: Muestra tamaños legibles por humanos.
        -T: Muestra el tipo de sistema de archivos.

17. du (Uso del Espacio en Disco):

    Descripción: Muestra el uso del espacio en disco de archivos y directorios.

    Parámetros:
        -h: Muestra tamaños legibles por humanos.
        -s: Resumen de uso para directorios.

18. ps (Listar Procesos):

    Descripción: Muestra información sobre los procesos en ejecución.
    
    Parámetros:

        aux: Muestra una lista detallada de procesos.
        -e: Lista todos los procesos.

19. history (Historial de Comandos):

    Descripción: Muestra el historial de comandos utilizados en la terminal.

    Parámetros:

        -c: Borra el historial.
        -d número: Borra una entrada específica del historial.

20. sed (Editor Stream):

    Descripción: Procesa y transforma texto.

    Parámetros:
    
        s/buscar/reemplazar/: Sustituye una cadena con otra en el texto.
        -i: Modifica el archivo directamente.


## Desplazamiento por el sistema Linux & Uso de Comandos

### Comando ls

|comando|funcion|
|-|-|
|```ls <directorio>``` | Lista los directorios y archivos del directorio indicado |

#### Ejemplos

El comando `ls` se puede utilizar de muchas maneras. En general, se usa para el directorio actual, caso en el que el espacio de `<directorio>` no se le especifica nada. 

|comando|accion|
|-|-|
|```ls ``` | Lista los directorios y archivos del directorio actual |
|```ls -l``` | Lista los directorios y archivos del directorio actual en forma de lista |
|```ls -a``` | Lista los directorios y archivos (incluso los ocultos) del directorio actual |
|```ls -la``` | Combina las acciones de `ls -l` y `ls -a` |
|```ls -h``` | Muestra tamaños legibles por humanos |


Algo interesante de este comando es que al listar los archivos y directorios con el parametro `-l`, se pueden ver los permisos de los archivos o directorios, donde:

```bash
### Comando
$ ls -la

### Salida
drwxr-xr-x 3 user group 4096 oct 24 18:36 Descargas
.rw-r--r-- 1017 user group 6 sep 17:15 xd
```
En la "carpeta" Descargas, el significado de cada elemento es:
- `d`       -> indica que es un directorio.
- `rwx`     -> indica que el usuario propietario de la capeta tiene permisos de lectura (`r`), escritura (`w`) y ejecucion (`x`).
- `r-x`     -> indica que el grupo de la capeta tiene permisos de lectura (`r`) y ejecucion (`x`).
- `r-x`     -> indica que otros tienen permisos de lectura (`r`) y ejecucion (`x`).
- `user`    -> indica el usuario propietario.
- `group`   -> indica el grupo.

Por otro lado, el archivo "xd":
- `.`       -> indica que es un archivo.
- `rw-`     -> indica que el usuario propietario de la capeta tiene permisos de lectura (`r`) y escritura (`w`).
- `r--`     -> indica que el grupo de la capeta tiene permisos de lectura (`r`).
- `r--`     -> indica que otros tienen permisos de lectura (`r`).
- `user`    -> indica el usuario propietario.
- `group`   -> indica el grupo.

y al final se indican, cantidad de bloques, fecha de creación/modificación y por ultimo el nombre.

### Comando cd

|comando|funcion|
|-|-|
|```cd <directorio>``` | Cambia del directorio actual al directorio indicado |

#### Ejemplos

El comando `cd` se suele utilizar con expresiones que indican un directorio existente. 
Algunas curiosidades son:

- `.` el "directorio" punto equivale a "directorio actual"
- `..` el "directorio" doble punto equivale a "directorio padre"
- `~` el "directorio" virgulilla equivale al "directorio home" del usuario activo.
- Para separar directorios se emplea la barra `/`, por ejemplo `~/Descargas/Nueva Carpeta` se refiere a la Nueva Carpeta, en el directorio Descargas, ubicada en el directorio home del usuario.

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

### Comando pwd

|comando|funcion|
|-|-|
|```pwd``` | Imprime el directorio de trabajo, es decir, el directorio actual. |

El comando `pwd` (print working directory) se suele usar más que nada como entrada de programas o ficheros que requieren la ruta absoluta de un directorio especifico. Aunque esto parezca bastante abstracto a primera vista (aunque vimos un ejemplo con `cd`), es un comando con una función muy simple, imprimir el directorio actual. Su utilidad real se descubrirá en Bash Scripting.

### Comando cp

|comando|funcion|
|-|-|
|```cp <origen> <destino>``` | Copia lo que hay en el archivo de origen al archivo de destino. |

El comando cp en sistemas Unix y Linux se utiliza para copiar archivos o directorios de un lugar a otro. Su sintaxis básica es:

```bash
cp archivo.txt directorio/
```

Esto copiará el archivo archivo.txt al directorio especificado, manteniendo el nombre.

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