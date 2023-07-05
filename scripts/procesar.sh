#!/bin/bash

mkdir -p "./imagenes procesadas"

# Iterar sobre las imágenes en el directorio de entrada
for I in ./imagenes/*; do

    # Obtener el nombre del archivo sin la ruta
    NOMBRE_IMG=$(basename "$I")
    
    # Verificar si el nombre del archivo coincide con el patrón de nombres de personas válidos

    if [[ $NOMBRE_IMG =~ ^[[:upper:]][[:lower:]]+" "[[:upper:]][[:lower:]]+\. ]]; then

        # Ruta completa de salida para el archivo procesado
        ARCHIVO_SALIDA="./imagenes procesadas/$NOMBRE_IMG"

          
        # Utiliza ImageMagick para recortar la imagen a 512x512
        convert "$I" -gravity center -resize 512x512+0+0 -extent 512x512 "$ARCHIVO_SALIDA"



        echo "Imagen procesada: $ARCHIVO_SALIDA"

    else
        echo "Nombre de archivo no válido: $I"
    fi
done

