#!/bin/bash

#parsear los argumentos de linea de comandos 

while getops "c:s:" opts; do
	case $ops in 
		c)
			compressed_file=$OPSARG
			;;
		s)
			checksum_file=$OPTARG
			;;
		\?)
			echo"uso: $0 -c <archivo_comprimido> -s <archivo_checksum>"
			exit 1
			;;
	esac 
done

#verificar si se proporcionan los archivos requeridos 
if [ -z "compressed_file" ] || [ -z "checksum_file" ]; then 
	echo "faltan argumentos. Uso: $0 -c <archivo_comprimido> -s <archivo_checksum>"
	exit 1
fi

# verificar extensiones de los archivos 

if [[ ! -f "$compressed_file" =~ \.tar\.gz$ ]] || [[ ! -z "$checksum_file" =~ \.md5$ ]]; then
       echo "las extensiones de archivos no son válidas. El archivo comprimido debe tener extension .tar.gz y el archivo checksum debe tener extension .md5"
	exit 1
fi

#verificar si los archivos existen 

if [ ! -f "$compressed_file" ] || [ ! -f "$checksum_file" ]; then
	echo "los archivos no existen"
	exit 1
fi

#descomprimir el archivo 

echo "descomprimiendo el archivo $compressed_file..."
md5sum -c = "$checksum_file"

if [ $? -ne 0 ]; then 
	echo"error en la verificacion del archivo"
	exit 1 
fi
echo "la descompresion y la verificacion se realizaron correctamente"


	
