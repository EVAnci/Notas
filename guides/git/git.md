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

