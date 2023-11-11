# Comandos de Linux

En linux es normal interactuar a menudo con la terminal. Sin embargo para poder interactuar de forma optima, lo mejor es tener al menos una nocion de los comandos básicos. En esta guía trararé de cubrir todos los aspectos, pero si quieres profundizar un poco más o leer algunas guias de inicio en Linux, esta [página](https://www.linux.org/forums/linux-beginner-tutorials.123/) tiene una buena guía para empezar.

Para listar los comandos vamos a dividirlos en 3 grupos:
1. Lista general de comandos.
2. Desplazamiento por el arbol de directorios y uso de comandos.
3. Busqueda de archivos y/o directorios.
4. Expresiones regulares

## Lista de Comandos General

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
|`ls <directorio>` | Muestra el contenido de un directorio. |

#### Parámetros & Ejemplos

El comando `ls` se puede utilizar de muchas maneras. En general, se usa para el directorio actual, caso en el que el espacio de `<directorio>` no se le especifica nada. 

|comando|accion|
|-|-|
|`ls ` | Lista los directorios y archivos del directorio actual |
|`ls -l` | Lista los directorios y archivos del directorio actual en forma de lista |
|`ls -a` | Lista los directorios y archivos (incluso los ocultos) del directorio actual |
|`ls -la` | Combina las acciones de `ls -l` y `ls -a` |
|`ls -h` | Muestra tamaños legibles por humanos |


Algo interesante de este comando es que al listar los archivos y directorios con el parametro `-l`, se pueden ver los permisos de los archivos o directorios, donde:

```bash
### Comando
$ ls -la

### Salida
drwxr-xr-x 3 user group 4096 oct 24 18:36 Descargas
.rw-r--r-- 1 user group 1017 sep 6 17:15 xd
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
|`cd <directorio>` | Cambia del directorio actual al directorio indicado |

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
|`pwd` | Imprime el directorio de trabajo, es decir, el directorio actual. |

#### Usos

El comando `pwd` (print working directory) se suele usar más que nada como entrada de programas o ficheros que requieren la ruta absoluta de un directorio especifico. Aunque esto parezca bastante abstracto a primera vista (aunque vimos un ejemplo con `cd`), es un comando con una función muy simple, imprimir el directorio actual. Su utilidad real se descubrirá en Bash Scripting.

### Comando cp

|comando|funcion|
|-|-|
|`cp <origen> <destino>` | Copia lo que hay en el archivo de origen al archivo de destino. |

#### Parámetros y Ejemplos

- `cp -r` -> copiar recursivamente.

El comando cp en sistemas Unix y Linux se utiliza para copiar archivos o directorios de un lugar a otro. Su sintaxis básica es:

```bash
cp archivo.txt directorio/
```

Esto copiará el archivo archivo.txt al directorio especificado, manteniendo el nombre.

También se pueden copiar directorios completos de forma recursiva:

```bash
cp -r directorio_1/ directorio_2/
```

Dando como resultado una copia de `directorio_1` dentro de `directorio_2`.

### Comando mv

|comando|funcion|
|-|-|
|`mv <origen> <destino>` | Mueve o renombra archivos y directorios. |

#### Parámetros y Ejemplos

- `mv -i` -> Pide confirmación antes de sobrescribir archivos existentes.
- `mv -u` -> Solo sobrescribe si el archivo de destino es más antiguo o no existe.

El comando mv se utiliza para mover archivos o directorios de la siguiente manera:

Se puede utilizar para cambiar el nombre de un archivo:

```bash
mv archivo1.txt arhivo2.txt
```

Dando como resultado el cambio de nombre del archivo1 a archivo2.

Ahora suponga el siguiente arbol de directorios:

```bash
.
├── prueba
│  ├── 'file 0.txt'
│  ├── 'file 1.txt'
│  ├── 'file 2.txt'
│  ├── 'file 3.txt'
│  ├── 'file 4.txt'
│  └── 'file 5.txt'
└── prueba2
   └── test_1
      ├── 'Audio 0.mp3'
      ├── 'Audio 1.mp3'
      ├── 'Audio 2.mp3'
      ├── 'Audio 3.mp3'
      ├── 'Audio 4.mp3'
      └── 'Audio 5.mp3'
```
Y quiere cambiar el nombre de la carpeta `prueba` a `test_2`, y luego moverla dentro de `prueba_2`

1. Cambiar el nombre de la carpeta:

```bash
mv prueba/ test_2/
```

2. Mover `test_2` a `prueba_2`:

```bash
mv test_2/ prueba_2/
```
Dando como resultado:

```bash
.
└── prueba2
   ├── test_1
   │  ├── 'Audio 0.mp3'
   │  ├── 'Audio 1.mp3'
   │  ├── 'Audio 2.mp3'
   │  ├── 'Audio 3.mp3'
   │  ├── 'Audio 4.mp3'
   │  └── 'Audio 5.mp3'
   └── test_2
      ├── 'file 0.txt'
      ├── 'file 1.txt'
      ├── 'file 2.txt'
      ├── 'file 3.txt'
      ├── 'file 4.txt'
      └── 'file 5.txt'
```

### Comando rm

|comando|funcion|
|-|-|
|`rm <fichero>` | Elimina el fichero indicado |

#### Parámetros & Ejemplos

El comando `rm` tiene varios parámetros que le dan una gran funcionalidad, incluso, la de borrar directorios no vacios.

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
# Equivalentes
rm -d
rmdir
```

### Comando mkdir

|comando|funcion|
|-|-|
|`mkdir <nombre1> <nombre2> ...` | Crea un directorio o todos los directorios indicados como parametro. |

#### Parámetros y Ejemplos

- `mkdir -p <ruta/del/dir>` -> Crea directorios padres si no existen.

Es decir, el parametro `-p` hace lo siguiente:

```bash
# Esta ruta existe:
$ /home/user/Descargas

# Nosotros queremos crear estas carpetas en Descargas

$ /home/user/Descargas/git/proyecto/

# Entonces, en nuestro directorio home, podemos hacer:

mkdir -p Descargas/git/proyecto
```

Esto dará como resultado, una carpeta git, y adentro una carpeta proyecto.

### Comando touch

|comando|funcion|
|-|-|
|`touch <nombre1> <nombre2> ...` | Crea un archivo o todos los archivos indicados como parametro. |

#### Ejemplos

El comando `touch` no suele tener parámetros, pero su funcionalidad es similar a la de `mkdir`, pero en vez de trabajar con directorios, trabajamos con archivos.

```bash
### Crear un archivo txt

touch file.txt

### Crear un archivo de python

touch main.py
```

### Comando grep

|comando|funcion|
|-|-|
|`grep <patrón> <archivo/s>` | Busca un patrón en archivos de texto (human readable). |

#### Parámetros y Ejemplos

Voy a extender un poco la función de este comando para que quede más claro. El comando grep lo que hace es "buscar" un patron de texto, en archivos humanamente legibles. 

¿Qué significa esto de humanamente legible?

Bueno, cuando vayamos adentrándonos en la informática, iremos aprendiendo cada detalle, pero básicamente, suponte que creas un archivo.txt en el block de notas, y comienzas a escribir, y luego abres un editor de texto enriquecido (como word) y comienzas a escribir lo mismo. Entonces te pregunto:

¿Que diferencias hay entre los dos archivos, más allá de que uno es .txt y el otro .docx?

Bueno, la diferencia principal es que uno esta codificado, mientras que el otro no. Acá vemos cada uno:

- .txt (Texto sin formato): Este es un formato simple que almacena datos de texto sin ningún formato adicional, como negrita, cursiva o imágenes. Los archivos .txt contienen solo caracteres de texto y son fácilmente legibles porque el contenido se presenta de manera simple y directa.

- .docx (Microsoft Word): Este formato se utiliza para documentos creados en Microsoft Word u otros procesadores de texto avanzados. Los archivos .docx pueden contener no solo texto, sino también formatos complejos, imágenes, tablas y otros elementos de diseño. Estos archivos están codificados de manera que la información no es directamente legible como texto simple sin el software adecuado para interpretar y mostrar los elementos de formato.

En resumen: un fichero .txt puedes abrirlo y leerlo con cualquier computadora, sin necesidad de programas especificos, pudiendose incluso desde la terminal. Mientras tanto un fichero .docx requiere de un software especializado para interpretar la "codificación". 

Volviendo a `grep`, solo podremos utilizarlo en archivos que tengan caracteristicas "similares" a un fichero.txt (esto incluye cualquier archivo que almacene información en forma de texto plano) como puede ser un archivo.py, un archivo.c, un archivo.json, entre otros.

¿Entonces, cómo buscamos patrones con `grep`?

Suponte que tienes un proyecto muy grande en python sobre el juego scrabble, y sabes que hay una linea que contiene un `print('Algo que me importa buscar...')`

```bash
# Identificamos el patrón que conocemos: 'print'
# Luego el archivo donde buscaremos: main.py

grep "print" main.py

# La salida será:

print('Bienvenido al juego Scrabble!')
print(self.scrabble.board)
print(self.scrabble.current_player)
print(self.scrabble.player_points())
print('Esa palabra no es valida! Revisa tu conexion a internet si crees que tu palabra es valida.')
```

De ese modo pudimos encontrar rápidamente todas las lineas que contienen la palabra "print" dentro de main.py

Los usos de grep van un poco más allá de buscar patrones de texto en un proyecto que hemos creado por ejemplo. Sus usos suelen extenderce al entrar en el bash scripting.

Algunos parámetros de grep son:

- `grep -i` -> Realiza una búsqueda insensible a mayúsculas y minúsculas.
- `grep -r` o `grep -R` -> Busca de manera recursiva en directorios.
- `grep -n` -> Muestra el número de línea en el que se encuentra el patrón.

Aplicando estos parámetros al ejemplo de más arriba, podriamos saber en que linea se encuentra el print que estamos buscando.

### Comando man

|comando|funcion|
|-|-|
|`man <comando>` | Muestra el manual de un comando específico. |

#### Ejemplo

Este comando no tiene más parametro que el `<comando>` para mostrar su manual.

```bash
man ls
```

Por ejemplo, en ese caso, se nos mostrará información muy detallada sobre el comando `ls`.

### Comando find

|comando|funcion|
|-|-|
|`find <directorio> -opciones <criterio>` | Busca archivos o directorios en un sistema de archivos. |

#### Parámetros y Ejemplos

El comando find en sistemas basados se utiliza para buscar archivos y directorios en un sistema de archivos. Puede buscar archivos por nombre, tipo, tamaño, fecha de modificación, y otros criterios.

Algunas opciones comúnes son:

- `-name`: Especifica el nombre del archivo o patrón a buscar.
- `-type`: Especifica el tipo de archivo (f para archivo regular, d para directorio, etc.).
- `-size`: Especifica el tamaño del archivo.
- `-mtime`: Especifica la fecha de modificación en días.
- `-exec`: Permite ejecutar comandos en los archivos encontrados.

Ejemplos:

1. Buscar archivos por nombre:

```bash
find /ruta/del/directorio -name "nombre_del_archivo"
```

2. Buscar archivos por extensión:

```bash
find /ruta/del/directorio -name "*.txt"
```

Buscará todo lo que termine en extención txt

3. Buscar archivos por tamaño:

```bash
find /ruta/del/directorio -size +10M
```

Buscará archivos de más de 10MB

4. Buscar archivos por fecha de modificación:

```bash
find /ruta/del/directorio -mtime -7
```

Esto buscará archivos modificados en los últimos 7 días.

5. Ejecutar acciones en los archivos encontrados:

```bash
find /ruta/del/directorio -name "*.jpg" -exec rm {} \;
```

Este comando eliminará todos los archivos con extensión .jpg encontrados.

6. Buscar y excluir directorios específicos:

```bash
find /ruta/del/directorio -type f -not -path "/ruta/del/directorio/excluir/*"
```

Este comando buscará solo archivos (no directorios) y excluirá cualquier cosa dentro de "/ruta/del/directorio/excluir/".

Estos son solo algunos ejemplos básicos. El comando `find` es muy poderoso y ofrece muchas opciones. Puedes consultar la documentación (`man find` en la terminal) para obtener información más detallada sobre sus opciones y cómo utilizarlas.

### Comando tar

|comando|funcion|
|-|-|
|`tar` | Crea archivos comprimidos (archivos tar) y extrae su contenido. |

#### Ejemplos & Parámetros

1. Crear un archivo tar:

```bash
tar -cvf archivo.tar archivo_o_directorio
```

- `-c`: Crea un nuevo archivo
- `-v`: Muestra el progreso en la consola (vervose)
- `-f`: Especifica el nombre del archivo tar

2. Descomprimir un archivo tar:

```bash
tar -xvf archivo.tar
```

- `-x`: Extrae los archivos de un archivo tar
- `-v`: Muestra el progreso en la consola (vervose)
- `-f`: Especifica el nombre del archivo tar

3. Comprimir un archivo o directorio usando gzip:

```bash
tar -czvf archivo.tar.gz archivo_o_directorio
```

- `-c`: Crea un nuevo archivo
- `-z`: Usa gzip para comprimir
- `-v`: Muestra el progreso en la consola (vervose)
- `-f`: Especifica el nombre del archivo tar

4. Descomprimir un archivo tar.gz:

```bash
tar -xzvf archivo.tar.gz archivo_o_directorio
```

- `-x`: Extrae los archivos de un archivo tar
- `-z`: Usa gzip para descomprimir
- `-v`: Muestra el progreso en la consola (vervose)
- `-f`: Especifica el nombre del archivo tar

Otro parametro que puede utilizarse es:

- `-j`: Comprime con bzip2.

### Comando ssh (Secure Shell)

|comando|funcion|
|-|-|
|`ssh` | Permite la conexión segura a través de SSH a otro sistema. |

#### Parametros

- `usuario@host`: Especifica el usuario y el host al que te quieres conectar.
- `-p`: Cambia el puerto de conexión.
- `-i`: Especifica una clave privada para la autenticación.

Este comando lo utilizarán para crear una clave pública y una clave privada para conectarse a github (repositorio remoto). 

En la [guia sobre git](git.md) está detallado como se crean las claves, y como se configuran en github.