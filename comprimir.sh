#!/bin/bash

# Generar un archivo con la lista de nombres de todas las imágenes
find /home/spinazo/Escritorio/repo/silmv -type f -name "*.jpg" > lista_imagenes.txt

# Generar un archivo con la lista de nombres válidos
grep -E "^[a-zA-Z0-9_-]+\.(jpg|png)$" lista_imagenes.txt > lista_nombres_validos.txt

# Generar un archivo con el total de personas cuyo nombre finaliza con la letra "a"
grep -i "a\.[a-zA-Z]*\.(jpg|png)$" lista_imagenes.txt | wc -l > total_personas_a.txt

# Generar un archivo comprimido que incluya los archivos generados en los items anteriores y todas las imágenes
tar -czvf archivos_comprimidos.tar.gz lista_imagenes.txt lista_nombres_validos.txt total_personas_a.txt /home/spinazo/Escritorio/repo/silmv

# Permitir acceso al archivo comprimido desde fuera del contenedor
chmod 777 archivos_comprimidos.tar.gz
