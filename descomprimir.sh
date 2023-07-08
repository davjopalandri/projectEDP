#!/bin/bash

# descomprimir.sh: Descarga un archivo comprimido de imágenes. 
# Se debe poder indicar por argumento dos archivos 
# (uno con las imágenes y otro con una suma de verificación). 
# Si ocurrió algún error se debe informar al usuario
# de lo contrario se procede a descomprimir.


IMAGENES=$1
CHECKSUM=$2

# Verifica si se ingresaron 2 argumentos.
if [ $# -ne 2 ]; then
	echo "Error: Debes proporcionar dos archivos como argumentos, (uno con las imágenes y otro con una suma de verificación)" 
	exit 1
fi

# Verifica si el archivo de imágenes existe.
if [ ! -f "$IMAGENES" ]; then
	echo "Error: El archivo de imágenes '$IMAGENES' no existe." 
	exit 1
fi

# Verifica si el archivo de suma de verificación existe.
if [ ! -f "$CHECKSUM" ]; then
	echo "Error: El archivo "$CHECKSUM" no existe." 
	exit 1
fi

# Verifica la integridad de las imágenes utilizando la suma de verificación.
#md5sum --check "$CHECKSUM"
#RESULTADO_DEL_CHECK=$?

# Si la verificación fue exitosa, procede a descomprimir las imágenes.
#if [ $RESULTADO_DEL_CHECK -eq 0 ]; then

if md5sum --status -c "$CHECKSUM"; then
  # Descomprime el archivo de imágenes en la carpeta 'imagenes'
  tar -xzf "$IMAGENES" -C ../datasets/

  echo "Descompresión completa. Las imágenes se encuentran en la carpeta 'imagenes'."
else
  echo "Error: La suma de verificación no coincide. No se puede proceder con la descompresión."
fi

