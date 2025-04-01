# Introduccion sobre Tipos de Datos, Estructuras y Funciones en Python

Esta guía profundiza en los **tipos de datos** y las **estructuras de control** en Python, enfocándose en aspectos detallados como:  
- Los parámetros y condiciones de las estructuras de control (decisión y repetitivas)  
- La comparación entre **listas** y **tuplas**: cuándo y por qué utilizar cada una  
- Un análisis detallado de las **funciones**: definición, argumentos posicionales, retorno de valores, llamadas a funciones y el paso de datos

El objetivo de esta guía es aprender a trabajar con datos y controlar el flujo de ejecución de los programas, así como entender la eficiencia y el manejo interno de los objetos mutables e inmutables en Python.

---

## 1. Tipos de Datos y Estructuras de Datos

### 1.1 Variables
Las **variables** son contenedores para almacenar datos. En Python, la tipificación es dinámica, por lo que no es necesario declarar el tipo explícitamente. 

**Ejemplo:**

```python
edad = 30
nombre = "María"
pi = 3.1416

print("Nombre:", nombre)
print("Edad:", edad)
print("Valor de pi:", pi)
```

### 1.2 Listas

Las listas son colecciones ordenadas y mutables que permiten almacenar múltiples elementos. Cada elemento tiene una posición específica, denominada **índice**, que comienza en 0 para el primer elemento, 1 para el segundo, y así sucesivamente.

**Características y funcionamiento interno:**

- **Mutabilidad:**  
    Las listas pueden modificarse después de su creación. Esto significa que puedes agregar, eliminar o actualizar elementos. Al ser mutables, cada operación de modificación (como `append`, `insert`, o asignar a un índice) desencadena ciertas verificaciones internas en Python para:
    - **Verificar la validez del índice:** Se comprueba que el índice usado para acceder o modificar esté dentro de los límites de la lista, evitando errores como `IndexError`.
    - **Mantener la integridad de la estructura:** Cuando se añaden elementos, Python puede necesitar reasignar memoria para expandir la lista. Esto implica mover datos y actualizar referencias para garantizar que la lista conserve su coherencia interna.
    - **Gestión de referencias:** Al modificar la lista, se actualizan las referencias a los objetos almacenados, asegurando que no haya fugas de memoria y que la información sea accesible de manera correcta.

- **Manejo de índices:**  
    - **Índices positivos:** Comienzan en 0, lo que permite acceder al primer, segundo, tercer elemento, etc. Por ejemplo, `lista[0]` devuelve el primer elemento.
    - **Índices negativos:** Permiten acceder a los elementos desde el final de la lista. Por ejemplo, `lista[-1]` devuelve el último elemento, `lista[-2]` el penúltimo, y así sucesivamente.
    - **Verificaciones de rango:** Cada vez que se accede a la lista mediante un índice, Python verifica que el índice esté dentro del rango permitido para evitar errores en tiempo de ejecución.

- **Uso recomendado:**  
Utiliza listas cuando necesites una colección de elementos que pueda cambiar durante la ejecución del programa, por ejemplo, para gestionar datos dinámicos, realizar operaciones de inserción o eliminación, o manipular secuencias de elementos de manera flexible.

- **Ejemplo de lista:**

    ```python
    # Creación de una lista
    frutas = ["manzana", "banana", "cereza"]

    # Agregar un elemento al final
    frutas.append("naranja")  # Se realizan verificaciones internas para garantizar la consistencia

    # Modificar un elemento en una posición específica
    frutas[1] = "kiwi"  # 'banana' es reemplazada por 'kiwi'

    # Acceso a elementos mediante índices
    print("Primera fruta:", frutas[0])  # Acceso con índice positivo
    print("Última fruta:", frutas[-1])   # Acceso con índice negativo

    # Recorrer la lista mostrando índices y elementos
    for indice, fruta in enumerate(frutas):
        print(f"Fruta en el índice {indice}: {fruta}")
    ```

### 1.3 Tuplas

Las tuplas son colecciones ordenadas e inmutables que, al igual que las listas, almacenan múltiples elementos y utilizan índices para su acceso. Sin embargo, una vez definidas, sus elementos no pueden modificarse.

**Características y ventajas:**

- **Inmutabilidad:**
Una vez creada, la tupla no puede alterarse. Esto implica que:

    - No se pueden agregar, eliminar o modificar elementos.

    - No se realizan las verificaciones internas de integridad y actualización de memoria que son propias de las listas.

    - Esta inmutabilidad permite a Python optimizar el uso de memoria y mejorar la velocidad de acceso a los datos.

- **Manejo de índices:**

    - Al igual que las listas, los elementos de una tupla se acceden mediante índices positivos (empezando en 0) y negativos (para contar desde el final).

    - La inmutabilidad elimina la necesidad de verificaciones en operaciones de modificación, ya que no existen tales operaciones en las tuplas.

- **Uso recomendado:**
Emplea tuplas cuando necesites garantizar que los datos permanezcan constantes durante la ejecución del programa, por ejemplo, para almacenar configuraciones fijas, coordenadas o cualquier conjunto de valores que no deban cambiar.

- **Ejemplo de tuplas:**

    ```python
    # Creación de una tupla
    coordenadas = (15.5, 23.8)

    # Acceso a elementos mediante índices
    print("Coordenada x:", coordenadas[0])
    print("Coordenada y:", coordenadas[1])

    # Acceso utilizando índices negativos
    print("Última coordenada:", coordenadas[-1])

    # Intentar modificar una tupla genera error (descomentar la siguiente línea provocaría un TypeError)
    # coordenadas[0] = 20.0
    ```

---

## 2. Estructuras de Control

Las estructuras de control determinan el flujo de ejecución de un programa, permitiendo que se tomen decisiones o se repitan bloques de código según determinadas condiciones.

### 2.1 Estructuras de Decisión

Las estructuras de decisión son fundamentales para que el programa ejecute diferentes bloques de código en función del resultado de condiciones evaluadas.

**Condicionales:**

- **`if`:**  
  Evalúa una condición; si la condición es verdadera (`True`), se ejecuta el bloque de código indentado que le sigue.

- **`elif` (else if):**  
  Permite evaluar condiciones adicionales cuando la condición anterior es falsa. Se pueden encadenar varios `elif` para cubrir distintos casos.

- **`else`:**  
  Se ejecuta cuando ninguna de las condiciones anteriores se cumple, actuando como un caso por defecto.

**Aspectos importantes:**

- **Condición:**  
  Cada condicional evalúa una expresión que debe retornar un valor booleano (`True` o `False`). Estas expresiones pueden involucrar operadores relacionales (como `>`, `<`, `==`, `!=`) y operadores lógicos (`and`, `or`, `not`).

- **Encadenamiento y anidación:**  
  Es posible combinar múltiples condiciones utilizando `elif` y, de ser necesario, anidar estructuras condicionales para resolver escenarios complejos.

**Ejemplo práctico:**

```python
numero = 10

if numero > 0:
    print("El número es positivo")
elif numero == 0:
    print("El número es cero")
else:
    print("El número es negativo")
```

### 2.2 Estructuras Repetitivas
Las estructuras repetitivas permiten ejecutar un bloque de código múltiples veces, ya sea mientras se cumpla una condición o recorriendo los elementos de una secuencia.

**Bucle while:**

- **Concepto:** Ejecuta repetidamente un bloque de código mientras la condición evaluada sea verdadera.

- **Parámetro principal:** Una condición que debe evaluarse en cada iteración. Es fundamental actualizar una variable involucrada en la condición para evitar bucles infinitos

```python
contador = 0
while contador < 5:
    print("Contador:", contador)
    contador += 1  # Actualiza la variable para salir del bucle
```

**Bucle for:**

- **Concepto:** Permite iterar sobre elementos de una secuencia (como listas, tuplas, cadenas) o sobre un rango de valores.

- **Parámetros comunes:**

    - La secuencia o rango a iterar.

    - Una variable de iteración que toma el valor de cada elemento en cada ciclo.

**Ejemplo iterando sobre una lista:**
```python
nombres = ["Ana", "Luis", "Carlos"]
for nombre in nombres:
    print("Hola", nombre)
```   

**Ejemplo iterando sobre un rango:**
```python
for i in range(5):  # range(5) genera una secuencia de números de 0 a 4
    print("Número", i)
```

--- 

## 3. Funciones en Python

Las funciones son bloques de código reutilizables que realizan una tarea específica. Se definen con la palabra clave `def` y pueden recibir argumentos y retornar valores.

### 3.1 Definición de Funciones
- **Sintaxis básica:**
    ```python
    def nombre_funcion(param1, param2):
        # Bloque de código
        return resultado
    ```

- **Componentes:**

    - **Nombre de la función:** Debe ser descriptivo y seguir las convenciones de nomenclatura.
 
    - **Parámetros:** Variables que se usan para recibir datos de entrada.
 
    - **Bloque de código:** Conjunto de instrucciones que realiza la función.

    - **Retorno:** La función puede retornar un valor utilizando la palabra clave return. Si no se especifica, la función retorna None.

### 3.2 Argumentos Posicionales
- Son aquellos que se pasan a la función en el orden en que se definieron.

- **Ejemplo:**

    ```python
    def saludar(nombre, edad):
        print(f"Hola, {nombre}. Tienes {edad} años.")

    saludar("Carlos", 25)  # "Carlos" es el primer argumento, 25 el segundo.
    ```

### 3.3 Retorno de Valores

- El valor retornado por una función se puede almacenar en una variable o usar directamente.

- Una función puede retornar cualquier tipo de dato (números, cadenas, listas, tuplas, etc.) o incluso múltiples valores empaquetados en una tupla.

- Ejemplo:

    ```python
    def sumar(a, b):
        return a + b

    resultado = sumar(10, 5)
    print("Resultado de la suma:", resultado)
    ```

### 3.4 Funciones con Múltiples Tipos de Argumentos    
- **Argumentos por defecto:** Permiten asignar un valor por defecto a un parámetro, que se utiliza si no se provee un valor al llamar la función.

    ```python
    def presentar(nombre, saludo="Hola"):
        print(f"{saludo}, {nombre}!")

    presentar("Ana")              # Usa el saludo por defecto "Hola"
    presentar("Luis", "Bienvenido")  # Sobrescribe el saludo por defecto
    ```
- **Argumentos variables:**

    - `Posicionales variables (*args)`: Permiten pasar una cantidad variable de argumentos posicionales.

    - `Palabra clave variables (**kwargs)`: Permiten pasar una cantidad variable de argumentos con nombre.

    ```python
    def mostrar_info(*args, **kwargs):
        print("Argumentos posicionales:", args)
        print("Argumentos con clave:", kwargs)

    mostrar_info(1, 2, 3, nombre="Carlos", edad=30)
    ```