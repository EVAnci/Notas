# ¿Como añadir una clave ssh a github?

## Crear una clave SSH

Primero en una terminal, en nuestro directorio home vamos a crear una carpeta llamada .ssh

```bash
mkdir ~/.ssh
cd ~/.ssh
```

Luego vamos a generar una clave ssh

```bash
ssh-keygen -t ed25519 -C 'mail@exaple'
```

Este comando nos preguntará el nombre del archivo en el cual queremos guardar nuestra clave ssh, podemos dejarlo por defecto si no ponemos nada. Luego nos pedira la contraseña. Ahí vamos a poner una contraseña para clave ssh. Esta contraseña no tiene nada que ver con nuestra contraseña de linux, podemos poner la clave que queramos.

## Copiar la clave publica

Luego de colocar el nombre de archivo y la contraseña aparecera un dibujo, y se crearan dos archivos. En el caso de haber dejado el nombre vacio, seran:

```bash
$ ls
id_ed25519  id_ed25519.pub
```

El que no termina en nada es nuestro archivo privado, el cual no se comparte. El que termina en .pub es nuestra clave publica. El contenido del archivo .pub lo vamos a copiar para pegarlo en github. Esto lo podemos hacer de la siguiente manera:

```bash
cat ~/.ssh/id_ed25519.pub
```

## Añadir la clave publica a GitHub

La clave que copiamos tendra un aspecto similar a este:

```bash
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINDK/hxaQDY0NojrsYtdRmKbCFORP0/jNioG2uS2QNvs user@host
```

La salida de este comando la podemos copiar seleccionandola y copiandola con ctrl+shift+c. Con esto vamos a ir a nuestra cuenta de github y nos dirigimos a Opciones/SSH and GPG Keys. Ahí podremos crear una nueva clave ssh dandole al botón verde que dice "Nueva clave SSH", y ahi pegamos todo el contenido de nuestra clave. 

## Adicional

En el caso de que no quieras poner la contraseña cada ves que pusheas algo a github se puede agregar la clave ssh al agente de ssh:

```bash
eval $(ssh-agent -s)
```

Luego agregamos la clave privada, nos pedirá la contraseña de ssh.

```bash
ssh-add ~/.ssh/id_ed25519
```

# Comandos utiles para iniciar un repo de git

```bash
git init

git commit -m "first commit"

git branch -M main

git remote add origin ssh@link_de_tu_repo

git push -u origin main
```

Clonar un repositorio remoto:


```bash
git clone <URL del repositorio>
```

Agregar cambios al área de preparación:


```bash
git add <archivo>
```

Confirmar cambios:


```bash
git commit -m "Mensaje de commit"
```

Ver el estado de los archivos:


```bash
git status
```

Ver el historial de commits:


```bash
git log
```

Crear una nueva rama:


```bash
git branch <nombre-de-la-rama>
```

Cambiar a una rama existente:


```bash
git checkout <nombre-de-la-rama>
```

Fusionar una rama en la rama actual:


```bash
git merge <nombre-de-la-rama>
```

Eliminar una rama local:


```bash
git branch -d <nombre-de-la-rama>
```

Enviar cambios a un repositorio remoto:


```bash
git push origin <nombre-de-la-rama>
```

