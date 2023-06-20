#!/bin/bash

#Pide un argumento de entrada que indica cuantas imagenes generar.
ENTRADA=$1

#Descarga una lista de nombres de la web en un archivo llamado lista_nombres
echo $(curl 'https://raw.githubusercontent.com/fernandezpablo85/name_suggestions/master/assets/dict.csv' -o lista_nombres)

#El comando cat -e devuelve los valores con salto de linea.
#De la lista de nombres toma los datos necesarios (Nombre y apellido primera columna) con awk.
#Ordena y elimina repetidos si llegara a haber con los comandos sort y uniq.
#Los desordena (comando shuf) de manera aleatoria. 
#Toma la misma cantidad de nombres que el argumento ingresado.
NOMBRES=$(cat -e lista_nombres | awk -F',' '{print $1}' | sort | uniq | shuf -n $ENTRADA)

#IFS es el acrónimo de "Internal Field Separator", 
#Determinar cómo separar elementos de NOMBRES. (Para que tome el apellido ademas del nombre) 
IFS=$'\n'

#Itera sobre los elementos de NOMBRES 

for I in $NOMBRES; do
    #Ejecuta el comando para descargar imagenes con curl -L del servidor y las guarda en 
    #imagenes/$I con el nombre correspondiente.
    $(curl -L 'https://source.unsplash.com/random/900%C3%97700/?person' -o imagenes/$I)
    #Espera un segundo antes de iterar.
    sleep 1
done
