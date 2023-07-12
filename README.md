# Programa de Procesamiento de Imágenes

Este programa es una aplicación diseñada para procesar un lote de imágenes, aplicando transformaciones específicas a las imágenes de personas. Proporciona opciones para generar, descargar, procesar y comprimir imágenes, así como generar archivos con información relevante.

## Características principales

- Generación y descarga de imágenes desde un servicio web.
   - Para generar imágenes de personas, se utilizó: [https://thispersondoesnotexist.com/](https://thispersondoesnotexist.com/)
   - Para nombres de personas, se utilizó el siguiente dataset: [https://raw.githubusercontent.com/adalessandro/EdP-2023-TP-Final/main/dict.csv](https://raw.githubusercontent.com/adalessandro/EdP-2023-TP-Final/main/dict.csv)
- Recorte de imágenes a una resolución de 512x512: Se utilizó ImageMagick para manipular las imágenes.
- Procesamiento exclusivo de imágenes de personas válidas.
- Compresión de imágenes y generación de un archivo comprimido.
- Generación de diversos archivos con información estadística.

## Requisitos del sistema

- Sistema operativo: Linux.
- Docker instalado para ejecutar el programa dentro de un contenedor.

## Instalación y configuración

1. Clona el repositorio del programa desde GitHub:

git clone https://github.com/davjopalandri/projectEDP.git

2. Accede al directorio del repositorio:

cd projectEDP

3. Ejecuta el archivo ejecutar.sh. (Verificar los accesos de ejecucion del usuario. Sino funciona probar con sudo)

./ejecutar.sh


## Uso del programa

El programa ofrece un menú con las siguientes opciones:

1. Generar imágenes: Genera imágenes utilizando algún servicio web.
2. Descomprimir archivos: Se debe poder indicar por argumento dos archivos (uno con las imágenes comprimidas y otro con una suma de verificación). Debes indicar la cantidad de imágenes a generar.
3. Procesar imágenes: Realiza el procesamiento de las imágenes generadas. Recorta las imágenes a una resolución de 512x512 y aplica transformaciones solo a las imágenes de personas válidas.
4. Comprimir archivos y generar informes: Genera un archivo comprimido que incluye las imágenes procesadas y archivos con información estadística.
5. Salir: Finaliza la ejecución del programa.

Para seleccionar una opción, ingresa el número correspondiente y presiona Enter.

## Estructura del repositorio

- README.md: Documentación del programa, proporcionando instrucciones de instalación, uso y configuración.
- Dockerfile: Archivo para construir la imagen de Docker que contiene el entorno de ejecución del programa.
- scripts:
    - generar.sh: Script para generar y descargar imágenes utilizando un servicio web.
    - descomprimir.sh: Si ocurrió algún error se debe informar al usuario de lo contrario se procede a descomprimir en imagenes.
    - procesar.sh: Script para procesar las imágenes, recortándolas y aplicando transformaciones específicas.
    - comprimir.sh: Script para comprimir las imágenes y generar archivos con información estadística.
    - menu.sh: Script que muestra el menú de opciones y maneja la interacción con el usuario.
- docker-compose.yml: Archivo para definir y administrar aplicaciones multi-contenedor como volumen.

## Créditos

- Hernán González
- Augusto Álvarez Arnesi
- Ariel D'Alessandro

## Autores

- Palandri David Jose
- Dito Daniela
- Pinazo Silvana

