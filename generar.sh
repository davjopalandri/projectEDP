#!/bin/bash

cantidad=$1

# Descargar lista de nombres
curl -L 'https://raw.githubusercontent.com/fernandezpablo85/name_suggestions/master/assets/dict.csv' -o lista_nombres

# Crear directorio para imágenes
mkdir -p imagenes

# Obtener nombres al azar
nombres=$(cat lista_nombres | awk -F',' '{print $1}' | sort | uniq | shuf -n $cantidad)

# Generar imágenes y asignar nombres de archivo
for nombre in $nombres; do
  curl -L "https://source.unsplash.com/random/900x700/?person" -o "imagenes/$nombre.jpg"
  sleep 1
done

# Comprimir imágenes
zip -r imagenes.zip imagenes

# Generar archivo con suma de verificación
md5sum imagenes.zip > checksum.txt

# Eliminar archivos temporales
rm lista_nombres
rm -r imagenes

