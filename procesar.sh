#!/bin/bash

# Directorio de imágenes de entrada
DIRECTORIO=./imagenes

# Directorio de salida para las imágenes procesadas
DIRECTORIO_SALIDA=./'imagenes procesadas'

mkdir -p "$DIRECTORIO_SALIDA"

# Iterar sobre las imágenes en el directorio de entrada
for I in $DIRECTORIO/*; do
    # Obtener el nombre del archivo sin la ruta
    NOMBRE_IMG=$(basename "$I")
    
    # Verificar si el nombre del archivo coincide con el patrón de nombres de personas válidos
    if [[ $NOMBRE_IMG =~ ^[[:upper:]][[:lower:]]+" "[A-Z][a-z]+\. ]]; then

        # Ruta completa de salida para el archivo procesado
        ARCHIVO_SALIDA="$DIRECTORIO_SALIDA/$NOMBRE_IMG"
        
        # Utiliza ImageMagick para recortar la imagen a 512x512
        convert "$I" -gravity center -resize 512x512+0+0 -extent 512x512 "$ARCHIVO_SALIDA"


        echo "Imagen procesada: $DIRECTORIO_SALIDA"
    else
        echo "Nombre de archivo no válido: $I"
    fi
done

