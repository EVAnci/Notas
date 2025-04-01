Un **decorador en Python** es una función que modifica el comportamiento de otra función, método o clase. Es una forma de "envolver" una función para añadirle funcionalidad adicional, sin modificar su código original.

### Cómo funcionan
- Un decorador es simplemente una función que toma otra función como entrada y devuelve una nueva función.
- Se aplica usando el símbolo `@` seguido del nombre del decorador, colocado directamente encima de la función que queremos decorar.

### Ejemplo básico

```python
# Decorador simple
def mi_decorador(func):
    def envoltura():
        print("Antes de ejecutar la función.")
        func()
        print("Después de ejecutar la función.")
    return envoltura

# Función decorada
@mi_decorador
def saludo():
    print("¡Hola!")

saludo()
```

**Salida:**
```
Antes de ejecutar la función.
¡Hola!
Después de ejecutar la función.
```

Aquí:
1. `mi_decorador` es el decorador.
2. `saludo` es la función decorada.
3. Cuando llamas a `saludo()`, en realidad estás llamando a la función `envoltura` que se definió dentro del decorador.

### Usos comunes de los decoradores
1. **Logging**: Registrar información sobre las funciones que se ejecutan.
2. **Autenticación**: Verificar permisos antes de ejecutar una función.
3. **Caching**: Almacenar resultados de funciones para evitar cálculos repetidos.
4. **Medición de tiempo**: Medir cuánto tarda en ejecutarse una función.

### Ejemplo práctico: Medir tiempo de ejecución

```python
import time

def medir_tiempo(func):
    def envoltura(*args, **kwargs):
        inicio = time.time()
        resultado = func(*args, **kwargs)
        fin = time.time()
        print(f"Tiempo de ejecución: {fin - inicio} segundos")
        return resultado
    return envoltura

@medir_tiempo
def tarea_lenta():
    time.sleep(2)
    print("Tarea completada.")

tarea_lenta()
```

**Salida:**
```
Tarea completada.
Tiempo de ejecución: 2.0 segundos
```

### Decoradores con argumentos
Si necesitas que el decorador acepte argumentos, puedes anidarlo dentro de otra función:

```python
def repetir(n):
    def decorador(func):
        def envoltura(*args, **kwargs):
            for _ in range(n):
                func(*args, **kwargs)
        return envoltura
    return decorador

@repetir(3)
def hola():
    print("¡Hola!")

hola()
```

**Salida:**
```
¡Hola!
¡Hola!
¡Hola!
```