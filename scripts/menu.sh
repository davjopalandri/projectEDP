#!/bin/bash

# Función para generar imágenes utilizando generar.sh
generar_imagenes() {
  echo "Ingrese la cantidad de imágenes a generar:"
  read cantidad
  [[ ! $cantidad =~ ^[0-9]+$ ]] && "Tiene que ingresar un entero positivo" && return 1  
  echo "Generando $cantidad imágenes..."
  /app/scripts/generar.sh $cantidad
}

# Función para descomprimir archivos utilizando descomprimir.sh
descomprimir_archivos() {
  echo "Descomprimiendo archivos..."
  archivo_imagenes=/app/datasets/imagenes.tar.gz
  archivo_checksum=/app/datasets/checksum
  /app/scripts/descomprimir.sh $archivo_imagenes $archivo_checksum
}

# Función para procesar imágenes utilizando procesar.sh
procesar_imagenes() {
  echo "Procesando imágenes..."
  /app/scripts/procesar.sh
}

# Función para comprimir archivos y generar informes utilizando comprimir.sh
comprimir_archivos() {
  echo "Comprimiendo archivos y generando listas de nombres..."
  /app/scripts/comprimir.sh
}

# Menú principal
while true; do
  echo "------"

  echo "Seleccione una opción:"
  echo "1. Generar imágenes"
  echo "2. Descomprimir archivos"
  echo "3. Procesar imágenes"
  echo "4. Comprimir archivos y generar informes"
  echo "5. Salir"

  read opcion

  case $opcion in
    1) generar_imagenes ;;
    2) descomprimir_archivos ;;
    3) procesar_imagenes ;;
    4) comprimir_archivos ;;
    5) exit ;;
    *) echo "Opción inválida. Por favor, seleccione nuevamente." && exit ;;
  esac

done

