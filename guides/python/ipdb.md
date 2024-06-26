# Python Debugger

## ¿Que es un debugger?

¿No te ha pasado que codeas un programa, lo pruebas y falla? Luego, te detienes a leer tu codigo a ver si encuentras el error, y como no logras encontrarlo de forma sencilla, comienzas a colocar print's por todas partes para ver que valores van tomando tus variables... Bueno eso es debugear, pero de forma 'poco eficiente', ya que tenemos que ir adivinando en que parte se ejecuto el print hasta dar con la solución. Pues para evitar printear todo, existen programas dedicados a detener el flujo del programa e ir 'analizando' cada valor.

Un debugger es una herramienta esencial para el desarrollo de software, ya que facilita la identificación y corrección de errores, mejora la eficiencia del proceso de desarrollo y garantiza que el software funcione de manera esperada antes de su lanzamiento. Esto es fundamental para garantizar la calidad y confiabilidad de las aplicaciones y sistemas informáticos.

## Debuggers de python

Python cuenta con varios debuggers que permiten a los desarrolladores depurar sus programas de manera efectiva. Aquí hay una descripción de algunos de los debuggers más utilizados en el entorno Python:

1. pdb (Python Debugger):

    - Descripción: pdb es el módulo de depuración incorporado en Python. Proporciona una amplia gama de funciones de depuración para inspeccionar variables, establecer puntos de interrupción, rastrear la ejecución y más.
    - Uso: Puedes importar el módulo pdb en tu script y utilizar comandos como pdb.set_trace() para detener la ejecución y comenzar a depurar. Puedes avanzar paso a paso, inspeccionar variables y realizar otras acciones de depuración utilizando comandos de pdb.

2. IPython Debugger (ipdb):
    - Descripción: ipdb es una extensión de pdb que se integra con el entorno IPython. Proporciona una experiencia de depuración interactiva y más amigable en comparación con pdb estándar.
    - Uso: Puedes usar import ipdb y luego colocar ipdb.set_trace() en tu código para activar la depuración. Al detener la ejecución, puedes aprovechar todas las características de IPython para inspeccionar y manipular variables.

3. PyCharm Debugger:
    - Descripción: PyCharm es un popular entorno de desarrollo integrado (IDE) para Python que incluye un depurador visual integrado. Ofrece una interfaz gráfica de usuario para depurar tus programas, lo que facilita la inspección de variables, establecimiento de puntos de interrupción y seguimiento de la ejecución.
    - Uso: Debes instalar PyCharm y crear un proyecto Python en el IDE. Luego, puedes utilizar su depurador integrado para depurar tus programas de manera efectiva.

3. Visual Studio Code Debugger:
    - Descripción: Visual Studio Code (VS Code) es otro IDE popular que se utiliza comúnmente para programar en Python. También ofrece una extensión de depuración que facilita la depuración de programas Python. Puedes utilizarlo con Python instalando la extensión "Python" de Microsoft.
    - Uso: Después de instalar la extensión Python en VS Code, puedes configurar puntos de interrupción y usar las herramientas de depuración integradas para inspeccionar variables y seguir la ejecución de tu código.

4. pdb++ (pdbplus):
    - Descripción: pdb++ es una extensión de pdb que mejora la funcionalidad del depurador estándar. Ofrece una mejor visualización de variables, seguimiento de hilos y otras características útiles.
    - Uso: Para utilizar pdb++, debes instalarlo como una biblioteca de Python. Luego, puedes utilizarlo de manera similar a pdb estándar, pero con mejoras en la experiencia de depuración.

## Uso de ipdb

Antes de comenzar, asegúrate de tener ipdb instalado. Puedes instalarlo usando pip:

```bash
pip install ipdb
```

## Paso 1: Importar ipdb

```python
import ipdb
```

## Paso 2: Establecer el punto de interrupción

## Paso 3: Ejecutar el Programa

Ejecuta tu programa Python como lo harías normalmente. Cuando el programa alcance la línea `ipdb.set_trace()`, se abrirá una consola interactiva de ipdb que te permitirá depurar el código.

```python
# Tu código
# ...
ipdb.set_trace()  # El programa se detendrá aquí
# ...
# Más código
```

## Paso 4: Usar Comandos de ipdb

Una vez que estés en la consola interactiva de ipdb, puedes utilizar varios comandos para explorar y depurar tu código. Algunos comandos útiles incluyen:

    n (next): Ejecuta la siguiente línea de código.
    c (continue): Continúa la ejecución hasta el próximo punto de interrupción.
    s (step): Entra en una función y muestra su contenido.
    q (quit): Sale del depurador y finaliza el programa.
    l (list): Muestra el código fuente circundante.
    p variable: Muestra el valor de una variable.
    h (help): Muestra ayuda sobre los comandos disponibles.

## Paso 5: Salir del Depurador

Cuando hayas terminado de depurar, puedes salir del depurador escribiendo q o exit.

Este es un tutorial básico para empezar con ipdb. ipdb es extremadamente útil para depurar y entender lo que está sucediendo en tu código. Puedes explorar más comandos y capacidades avanzadas en la documentación oficial de ipdb: https://github.com/gotcha/ipdb.
