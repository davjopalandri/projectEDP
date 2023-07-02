#!/bin/bash

# descargar.sh: Descarga un archivo comprimido de imágenes. 
# Se debe poder indicar por argumento dos archivos 
# (uno con las imágenes y otro con una suma de verificación). 
# Si ocurrió algún error se debe informar al usuario
# de lo contrario se procede a descomprimir.


IMAGENES=$1
CHECKSUM=$2

# Verifica si se ingresaron 2 argumentos.
[ $# -ne 2 ] && echo "Error: Debes proporcionar dos archivos como argumentos, (uno con las imágenes y otro con una suma de verificación)" && exit 1

# Verifica si el archivo de imágenes existe
[ ! -f "$IMAGENES" ] && echo "Error: El archivo de imágenes '$IMAGENES' no existe." && exit 1

# Verifica si el archivo de suma de verificación existe
[ ! -f "$CHECKSUM" ] && echo "Error: El archivo "$CHECKSUM" no existe." && exit 1


# Verifica la integridad de las imágenes utilizando la suma de verificación
md5sum --check "$CHECKSUM"
check_result=$?

# Si la verificación fue exitosa, procede a descomprimir las imágenes
if [ $check_result -eq 0 ]; then
  # Crea una carpeta para las imágenes
  mkdir -p imagenes

  # Descomprime el archivo de imágenes en la carpeta 'imagenes'
  tar -xzf "$IMAGENES" -C imagenes/

  echo "Descompresión completa. Las imágenes se encuentran en la carpeta 'imagenes'."
else
  echo "Error: La suma de verificación no coincide. No se puede proceder con la descompresión."
fi