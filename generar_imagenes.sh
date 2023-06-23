 #Generar archivo de imagenes
 
#!/bin/bash

cantidad=$1

# Descargar lista de nombres
curl -L 'https://raw.githubusercontent.com/fernandezpablo85/name_suggestions/master/assets/dict.csv' -o lista_nombres

# Crear directorio para imágenes
mkdir -p imagenes

# Obtener nombres al azar , modificar la primer letra a mayusc. con awk ( selecciona el primer caracter de c/ linea ($0) y lo convierte a mayusc., y luego selecciona todos los caract. a partir del segundo carac#ter y lo transforma en minuscula
nombres=$(cat lista_nombres | awk -F',' '{print $1}' | sort | uniq | shuf -n $cantidad  | awk '{print toupper(substr($0, 1, 1)) tolower(substr($0, 2))}')


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

 
