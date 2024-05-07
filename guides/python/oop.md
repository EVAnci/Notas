# Programación Orientada a Objetos (OOP)

La programación orientada a objetos (POO) en Python es un paradigma de programación que se basa en el concepto de "objetos", los cuales son entidades que pueden contener datos (llamados atributos) y funciones (llamados métodos). En general, podemos detallar cada una de las partes del paradigma de programacion Orientado a Objetos:

1. **Clases y Objetos**:
   
    En POO, una "clase" es una _plantilla_ para crear objetos. Define las propiedades y comportamientos comunes que tendrán los objetos de ese tipo.

    Un "objeto" es una instancia de una clase. Es una entidad que contiene datos y métodos asociados con la clase.

    Entonces, en resumen, puedo decir que si tengo una clase llamada Monitor, esta será como una plantilla que describe las propiedades que tiene un Monitor. Luego un objeto es una instancia de esa clase, por ejemplo un monitor Samsung 24" OLED.

    En python la sintaxis para definir una clase, como la clase monitor del ejemplo, es la siguiente:

    ```python
    class Monitor:
        def __init__(self):
            # Atributos
            ...
    ```

2. **Atributos**:

    Los atributos son "variables" que pertenecen a un objeto o a una clase. Pueden ser variables de instancia (pertenecientes a un objeto específico) o variables de clase (compartidas por todas las instancias de la clase).

    Se definen dentro de una clase y se accede a ellos utilizando la notación de punto.

    Siguiendo el ejemplo de los monitores, voy a suponer que las "propiedades" o atributos de un monitor pueden ser: el tamaño de pantalla, el tipo de pantalla, el brillo de pantalla, el armazon y la marca del monitor.

    ```python
    class Monitor:
        def __init__(self):
            self.__marca__ = ""
            self.__tipo_de_pantalla__ = ""
            self.__tamaño_de_pantalla__ = ""
            self.__tipo_de_armazon__ = ""
            self.__brillo__ = 0
    ```

    En este ejemplo notamos que los atributos son nombrados con doble guión bajo. Esto es una forma de nombrar las variables que son atributos de una clase en python.

    Para poder crear un objeto (o una instancia de la clase Monitor) en python, podemos hacerlo de la siguiente manera:

    ```python
    monitor_samsung = Monitor()
    ``` 

    Si quisieramos que al momento de crear el objeto, tengamos la posibilidad de elegir los valores iniciales, podemos elegir pasar los valores iniciales como argumentos a la clase:

    ```python
    class Monitor:
        def __init__(self, marca, tipo_de_pantalla, tamaño_de_pantalla, armazon):
            self.__marca__ = marca
            self.__tipo_de_pantalla__ = tipo_de_pantalla
            self.__tamaño_de_pantalla__ = tamaño_de_pantalla
            self.__tipo_de_armazon__ = armazon
            self.__brillo__ = 0
    ```

    Luego al momento de crear una instancia de esta clase, obligatoriamente debemos pasar los argumentos requeridos por el constructor, que en este caso son tres, pero el brillo, seguirá siendo inicializado en 0:

    ```python
    monitor_samsung = Monitor('Samsung', 'OLED', '27inch', 'Plástico')
    ``` 

3. **Métodos**:

    Los métodos son funciones asociadas con una clase. Pueden usarse para modificar los atributos de un objeto o para realizar operaciones específicas relacionadas con la clase.

    Los métodos de instancia operan en instancias específicas de una clase, mientras que los métodos de clase operan en la clase misma.

    Continuando con el ejemplo del Monitor, podemos hacer un método que sirva para subir o bajar el brillo (de 0% a 100%), de la siguiente manera:

    ```python
    class Monitor:
        def __init__(self, marca, tipo_de_pantalla, tamaño_de_pantalla, armazon):
            self.__marca__ = marca
            self.__tipo_de_pantalla__ = tipo_de_pantalla
            self.__tamaño_de_pantalla__ = tamaño_de_pantalla
            self.__tipo_de_armazon__ = armazon
            self.__brillo__ = 0

        def control_de_brillo(self, brillo):
            if 0 <= brillo and brillo >= 100:
                self.__brillo__ = brillo
    ```

    De esta manera, entonces, en nuestro objeto creado en la sección anterior (`monitor_samsung`), podemos cambiar el brillo accediendo al metodo `control_de_brillo` de esta manera:

    ```python
    monitor_samsung.control_de_brillo(50)
    ```

    De esta manera he ajustado el brillo del monitor al 50%.

4. **Herencia**:
   
    La herencia es la capacidad de una clase de heredar atributos y métodos de otra clase (llamada clase base, clase padre o superclase).

    Permite la reutilización de código y la creación de jerarquías de clases.

    En Python, una clase puede heredar de una o más clases padre. Las clases que heredan de una clase padre, son llamadas clases hijo.

    Entonces, ahora supongamos que hacemos una plantilla de TV. En esta plantilla o **_clase_** vamos a definir las siguientes características: el tamaño de pantalla, el tipo de pantalla y la marca del TV. Esto, en python resulta ser:

    ```python
    class Tv:
        def __init__(self, marca, tipo_de_pantalla, tamaño_de_pantalla):
            self.__marca__ = marca
            self.__tipo_de_pantalla__ = tipo_de_pantalla
            self.__tamaño_de_pantalla__ = tamaño_de_pantalla
            self.__smart__ = True
    ```

    De la misma manera hagamoslo para un Teléfono. Resultando:

    ```python
    class Telefono:
        def __init__(self, marca, tipo_de_pantalla, tamaño_de_pantalla, procesador, memoria):
            self.__marca__ = marca
            self.__tipo_de_pantalla__ = tipo_de_pantalla
            self.__tamaño_de_pantalla__ = tamaño_de_pantalla
            self.__procesador__ = procesador
            self.__memoria__ = memoria
            self.__funda__ = "sin funda"

        def cambiar_funda(self, funda):
            self.__funda__ = funda
    ```

    Como podemos ver, hay varias cosas en común entre un Monitor, un Tv y un Teléfono. En general, podemos decir que todos tienen una pantalla. Entonces partiendo de esto en común, podemos crear una clase de dispositivos con pantalla, donde tendrán las siguientes propiedades:

    ```python
    class Dispositivo_con_Pantalla:
        def __init__(self, marca, tipo_de_pantalla, tamaño_de_pantalla):
            self.__marca__ = marca
            self.__tipo_de_pantalla__ = tipo_de_pantalla
            self.__tamaño_de_pantalla__ = tamaño_de_pantalla
    ```

    De esta manera podemos ver que estos atributos, se repiten en las tres clases de dispositivos que hemos creado. Entonces, mediante herencia podemos indicar a estas tres clases de dispositivos que tienen pantalla, que hereden estos atributos para que no tengamos que repetir el codigo. Esto lo podemos implementar de la siguiente manera:

    ```python
    # Clase Monitor, Hija de clase Dispositivo con pantalla

    class Monitor(Dispositivo_con_Pantalla):
        def __init__(self, marca, tipo_de_pantalla, tamaño_de_pantalla, armazon):
            super().__init__(marca, tipo_de_pantalla, tamaño_de_pantalla)
            self.__tipo_de_armazon__ = armazon
            self.__brillo__ = 0

        def control_de_brillo(self, brillo):
            if 0 <= brillo and brillo >= 100:
                self.__brillo__ = brillo

    # Clase Tv, Hija de clase Dispositivo con pantalla

    class Tv(Dispositivo_con_Pantalla):
        def __init__(self, marca, tipo_de_pantalla, tamaño_de_pantalla):
            super().__init__(marca, tipo_de_pantalla, tamaño_de_pantalla)
            self.__smart__ = True

    # Clase Telefono, Hija de clase Dispositivo con pantalla

    class Telefono(Dispositivo_con_Pantalla):
        def __init__(self, marca, tipo_de_pantalla, tamaño_de_pantalla, procesador, memoria):
            super().__init__(marca, tipo_de_pantalla, tamaño_de_pantalla)
            self.__procesador__ = procesador
            self.__memoria__ = memoria
            self.__funda__ = "sin funda"

        def cambiar_funda(self, funda):
            self.__funda__ = funda    
    ```

    Visto esto, vemos que siempre que una clase hereda los atributos de otra clase, debe responder a la siguiente frase: "La clase hijo **_es_** la clase padre". Es decir, siguiendo nuestro ejemplo tendríamos:
    - Un Monitor **es** un Dispositivo_con_Pantalla
    - Un Tv **es** un Dispositivo_con_Pantalla
    - Un Teléfono **es** un Dispositivo_con_Pantalla

    Nótese también, que de la clase padre, no sólo se heredan los atributos únicamente, sino también se heredarán los metodos de esta.

5. **Encapsulación**:

   La encapsulación es el concepto de agrupar los datos y los métodos que operan en esos datos en una sola unidad (el objeto).
   
   En Python, no hay restricciones de acceso estrictas como en otros lenguajes, pero se puede simular encapsulación utilizando convenciones de nombres y métodos privados.

6. **Polimorfismo**:

   El polimorfismo permite que objetos de diferentes clases respondan al mismo mensaje (llamada de método) de manera diferente.
   
   Puede implementarse mediante el uso de métodos con el mismo nombre en diferentes clases, pero con comportamientos específicos para cada una.