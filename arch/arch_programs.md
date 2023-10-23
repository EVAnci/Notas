# Arch Linux

## ¿Que hago luego de una instalación?

Es normal que luego de instalar arch linux te preguntes ¿Qué paquetes debería instalar? ¿Qué es lo que necesito? Bueno, pues hay un apartado detallado en la Archwiki sobre [esto](https://wiki.archlinux.org/title/General_recommendations).
Aquí no voy a enfocarme mucho en lo que son entornos de escritorio, y elementos básicos de un sistema Linux, ya que en la guia de instalación de arch estan los pasos bien detallados. Entonces una vez el [entorno de Escritorio](https://wiki.archlinux.org/title/Desktop_environment) instalado, lo normal es empezar a instalar todos los programas que solemos usar. 

Aquí, en un script de bash dejaré la instalación de un AUR Helper ([paru](https://wiki.archlinux.org/title/AUR_helpers)) y todos los paquetes que suelo utilizar en mi día a día. (Aclaración: en el script he separado la instalación de algunos componentes como utilidades de video, dependiendo la placa de video que tu tengas.) 

> [IMPORTANTE]
> No se instalaran los driver de la placa de video, sino utilidades de configuración de la placa.

## Ejecución del script

Para ejecutar el script (una vez descargado) vas a darle permisos de ejecución

```bash
chmod u+x programs.sh
```

Luego ejecutamos

```bash
bash programs.sh
```