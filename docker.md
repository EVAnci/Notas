# ¿Qué es Docker y por qué debería usarlo?

Docker es una plataforma de contenedorización que se utiliza para empaquetar, distribuir y ejecutar aplicaciones y sus dependencias de manera eficiente y consistente en cualquier entorno. Aquí te explico por qué deberías considerar utilizar Docker en tu proyecto:
1. **Aislamiento y portabilidad**: Docker utiliza contenedores para encapsular aplicaciones y sus dependencias, lo que proporciona un alto grado de aislamiento. Esto significa que puedes crear un contenedor con todas las bibliotecas y configuraciones necesarias para tu aplicación y ejecutarlo de manera consistente en cualquier sistema compatible con Docker, ya sea en tu máquina de desarrollo, en servidores de producción o incluso en la nube. Esto elimina problemas de "funciona en mi máquina" y facilita la portabilidad.
2. **Gestión de dependencias**: Docker permite empacar todas las dependencias de tu proyecto, incluyendo bibliotecas y herramientas específicas, dentro del contenedor. Esto evita conflictos entre versiones de bibliotecas y simplifica la gestión de dependencias, ya que puedes definir claramente las versiones requeridas.
3. **Escalabilidad y orquestación**: Docker facilita la escalabilidad de tus aplicaciones. Puedes ejecutar múltiples instancias de contenedores de la misma aplicación para manejar cargas de trabajo más grandes. Además, Docker se integra bien con herramientas de orquestación como Kubernetes, lo que facilita la gestión de aplicaciones a gran escala.
4. **Rápido provisionamiento y despliegue**: Docker permite crear y destruir contenedores rápidamente. Esto es especialmente útil para pruebas, desarrollo y despliegue de aplicaciones. Puedes automatizar el proceso de construcción y despliegue de contenedores, lo que acelera el ciclo de desarrollo.
5. **Entorno consistente**: Con Docker, todos los miembros de tu equipo pueden trabajar en el mismo entorno, independientemente de su sistema operativo. Esto simplifica la colaboración y reduce los problemas de configuración.
6. **Seguridad**: Los contenedores Docker están diseñados para ser seguros por defecto. Cada contenedor se ejecuta de manera aislada, lo que reduce el riesgo de conflictos o vulnerabilidades que puedan afectar a otras partes de tu sistema.

Si estas convencido entonces vamos a instalarlo...

# ¿Como instalar Docker en distros basadas en debian?

En general, la primer distro que la mayoría instala, es o esta basada en debian, pero si tienes otra distro puedes guiarte desde las instrucciones en la página oficial de Docker **[aquí](https://docs.docker.com/engine/install/debian/)**

### 1er Paso

Tenemos que agregar las claves GPG de Docker a apt:

```bash
# Actualizamos el sistema
sudo apt-get update
# Instalamos las claves
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
# Añadimos el repositorio a las fuentes de apt
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

### 2do Paso

Una vez ejecutados los comandos del 1er paso, si todo salio correcto este comando debería instalar docker

```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

### 3er Paso

Añadimos nuestro usuario (**tutorial-user**) al grupo docker

```bash
sudo usermod -aG docker tutorial-user
```

Iniciamos el servicio **docker.service**

```bash
systemctl start docker.service
```

### 4to Paso 

Comprobamos que todo funcione

```bash
sudo docker run --name hola hello-world
```

Si todo ha salido bien, este comando deberia mostrar un mensaje como este:

```bash
Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
```

### 5to Paso 

Como ya sabemos que docker funciona, vamos a limpiar lo que hemos creado, para así cuando lo utilicemos en nuestro proyecto no tengamos imagenes viejas que no volveremos a utilizar.

```bash
docker rm hola && docker image rm hello-world
```

# ¿Cómo utilizar Docker en tu proyecto?

### 1. Iniciar el servicio docker

Con este comando iniciaremos el servicio de forma momentanea. Si apagamos el equipo o cerramos la sesión del usuario, este servicio también se detendrá y lo tendremos que volver a iniciar manualmente (recomendado).

```bash
systemctl start docker.service
```

Si queremos que el servicio de docker se inicie cada vez que prendemos el equipo 

```bash
systemctl enable docker.service
```

Solo si eres curioso te preguntaras ¿Por qué lo recomendado es iniciarlo manualmente? Bueno este es un motivo más personal que otra cosa. El servicio docker.service es un servicio que solo lo utilizaremos al momento de desarrollar una aplicación en la que empleamos docker, o bien al momento de correr una aplicación con docker, por lo que la mayoría del tiempo no estaremos utilizando el servicio, por lo que estará corriendo en vano. Sin embargo si eres una persona que constantemente esta ejecutando cosas en docker, o necesitas por un motivo particular que siempre este activo, puedes emplear el segundo comando.

### 2. Crear una imagen de docker

- Para crear una imagen de Docker debemos crear un archivo llamado Dockerfile

  Un Dockerfile es un archivo o documento de texto simple que incluye una serie de instrucciones que se necesitan ejecutar de manera consecutiva para cumplir con los procesos necesarios para la creación de una nueva imagen.

  ```bash
  touch Dockerfile
  ```

  Su contenido puede variar, para poder crear uno que se ajuste a tus necesidades puede consultar **[esta guía oficial](https://docs.docker.com/engine/reference/builder/)**. Para nuestro proyecto vamos utilizar este modelo:

  ```Docker
  FROM python:3-alpine

  WORKDIR /tu_directorio_de_trabajo

  RUN apk update
  RUN apk add git
  RUN apk add bash

  RUN git clone [link_to_your_repo]

  RUN pip install -r requirements.txt

  CMD [ "sh", "-c", "coverage run -m unittest && coverage report -m && python -m game.main " ]
  ```

- Una vez creado el archivo Dockerfile construimos la imagen y le damos un nombre

  ```bash
  docker build -t <nombre> .
  ```

  Y luego podemos correr esta imagen con el siguiente comando

  ```bash
  docker run -d --name name_id -p 5000:5000 my_image_name:latest
  ```

### Recordando algunos comandos de docker

| Comando                           | Acción                                                                                         |
| --------------------------------- | ---------------------------------------------------------------------------------------------- |
| `docker images`                   | Este comando muestra una lista de todas las imágenes de Docker que están almacenadas en tu sistema |
| `docker run my_image`             | Ejecuta un contenedor basado en la imagen especificada                                            |
| `docker ps`                       | Muestra una lista de los contenedores de Docker que están en ejecución actualmente               |
| `docker ps -a`                    | Este comando muestra una lista de todos los contenedores, ya sean ejecutados o detenidos         |
| `docker rm my_container`          | Elimina un contenedor específico con el nombre o el ID especificado                                |
| `docker image rm my&nbsp;image`   | Este comando elimina una imagen de Docker con el nombre especificado (no debe estar en un contenedor) |
| `docker build -t my_image .`      | Utilizado para construir una imagen de Docker a partir de un Dockerfile. (-t se utiliza para etiquetar la imagen con un nombre) (el punto . al final indica que Docker debe buscar el Dockerfile en el directorio actual) |

# ¿Quieres que tu docker imprima una ballena?

Primero instalamos 

```bash
docker pull docker/whalesay
```

Luego:

```bash
docker run docker/whalesay cowsay BOO
```

Resultado:

```text
     _____ 
    < BOO >
     ----- 
            \
             \
                \     
                                            ##        .            
                                ## ## ##       ==            
                         ## ## ## ##      ===            
                 /""""""""""""""""___/ ===        
        ~~~ {~~ ~~~~ ~~~ ~~~~ ~~ ~ /  ===- ~~~   
                 \______ o          __/            
                    \    \        __/             
                        \____\______/   
```