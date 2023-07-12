#!/bin/bash

# Generar archivo con la lista de nombres de todas las imágenes
cd /app/datasets/imagenes
ls -1 * > ../lista_nombres_imagenes.txt
cd /app/datasets
# Generar archivo con la lista de nombres válidos
egrep ^[[:upper:]][[:lower:]]+" "[[:upper:]][[:lower:]]+\. ./lista_nombres_imagenes.txt > lista_nombres_validos.txt

# Generar archivo con el total de personas cuyo nombre finaliza con la letra 'a'
COLUMNA_DE_NOMBRES_1=$(cut -d ' ' -f1 lista_nombres_imagenes.txt | egrep -c a$) 
COLUMNA_DE_NOMBRES_2=$(cut -d ' ' -f2 lista_nombres_imagenes.txt | egrep -c a.jpg$) 

echo $(($COLUMNA_DE_NOMBRES_1 + $COLUMNA_DE_NOMBRES_2)) > total_nombres_terminados_en_a.txt
#cat lista_nombres_validos.txt | grep -c *a.jpg$ > total_personas_termina_en_a.txt

# Generar archivo comprimido que incluye todos los archivos generados y las imágenes
tar -czvf imagenes_comprimidas.tar.gz lista_nombres_imagenes.txt lista_nombres_validos.txt total_nombres_terminados_en_a.txt

# Cambiar permisos del archivo comprimido para que pueda accederse desde fuera del contenedor
chmod 777 imagenes_comprimidas.tar.gz
