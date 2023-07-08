
#Proyecto de Entornos de Programación

=======
# proyectEDP
#Scripts

#• generar.sh: Genera imágenes utilizando algún servicios web. Tener
#en cuenta que al descargar de una página conviene usar un sleep entre
#descarga y descarga para no saturar el servicio y evitar problemas. Se debe
#poder indicar por argumento cuantas imágenes generar y se deben asignar
#nombres de archivo al azar de una lista de nombres de personas. Luego
#se deben comprimir las imágenes, y generar un archivo con su suma de
#verificación.
#• descomprimir.sh: Se debe poder indicar por argumento dos archivos (uno
#con las imágenes comprimidas y otro con una suma de verificación). Si
#ocurrió algún error se debe informar al usuario de lo contrario se procede
#a descomprimir.
#• procesar.sh: Se deberán recortar las imágenes a una resolución de
#512*512 con alguna utilidad como imagemagick. Solamente deben procesarse
#aquellas imágenes que tengan nombres de personas válidos. Entiéndase
#por nombres de personas válidos a cualquier combinación de palabras
#que empiecen con un letra mayúscula y sigan por minúsculas.
#• comprimir.sh: Finalmente, luego de procesadas las imágenes, se debe:
#– generar un archivo con la lista de nombres de todas las imágenes.
#– generar un archivo con la lista de nombres válidos.
#– generar un archivo con el total de personas cuyo nombre finaliza con
#la letra a.
#– por último, generar un archivo comprimido que incluya los archivos
#generados en los items anteriores y todas las imágenes. El archivo
#comprimido debe poder accederse desde fuera del contenedor.
#• menu.sh: Debe incluirse un menú para elegir cada una de las opciones
#anteriores.

