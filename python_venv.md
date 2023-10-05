# Entorno virtual de python

## 1. Introducción

Un entorno virtual de Python es un ambiente aislado que te permite tener una versión de Python y sus bibliotecas asociadas separada y específica para un proyecto particular. 

Las aplicaciones en Python usualmente hacen uso de paquetes y módulos que no forman parte de la librería estándar. Las aplicaciones a veces necesitan una versión específica de una librería para funcionar. 

Creando un entorno virtual podremos instalar las librerías requeridas por una aplicación aislado de los paquetes del sistema operativo, es decir, al activar el entorno virtual podremos correr las librerías que la aplicación necesita sin haberlas instalado en nuestro PC, sino en el entorno virtual.

Si quieres **[aquí](https://docs.python.org/es/3/tutorial/venv.html)** puedes leer la documentación oficial de Python sobre entornos virtuales.

## 2. Crear un entorno virtual

Para crear un entorno virtual, decide en que carpeta quieres crearlo y ejecuta el módulo venv como script con la ruta a la carpeta:

```bash
python3 -m venv tutorial-env
```

Esto creará el directorio **tutorial-env** si no existe, y también creará directorios dentro de él que contienen una copia del intérprete de Python y varios archivos de soporte.

Una ruta común para el directorio de un entorno virtual es ```.venv```. Ese nombre mantiene el directorio típicamente escondido en la consola y fuera de vista mientras le da un nombre que explica cuál es el motivo de su existencia.

## 3. Activar el entorno virtual

1. Una vez creado el entorno virtual, podrás activarlo.

    - Unix o MacOS:

        ```bash
        source tutorial-env/bin/activate
        ```

    - Windows:

        ```cmd
        tutorial-env\Scripts\activate.bat
        ```

2. Para desactivar el entorno virtual

    ```bash
    deactivate
    ```


## 4. Manejo de paquetes con pip

Puedes instalar, actualizar y eliminar paquetes utilizando un programa llamado pip. Por defecto, pip instalará paquetes desde el Índice de Paquetes de Python. Puedes explorar el Índice de Paquetes de Python **[aquí](https://pypi.org/)**.

Algo basante cómodo es crear un archivo, que en este caso llamaremos requirements.txt, donde colocaremos todos los paquetes que deban ser instalados (con sus respectivas versiones) para correr una aplicación.

```bash
# Contenido del archivo requirements.txt

coverage==7.3.2
pyrae
```

Y luego para instalar todas las librerías (cada una con su respectiva versión)

```bash
pip3 install -r requirements.txt
```
