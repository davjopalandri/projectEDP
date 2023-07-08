#!/bin/bash

# Función para generar imágenes utilizando generar.sh
generar_imagenes() {
  #echo "Ingrese la cantidad de imágenes a generar:"
  #read cantidad
  
  #read -p para mostrar el mensaje y leer la entrada del usuario en una sola línea.
  read -p "Ingrese la cantidad de imágenes a generar: " cantidad
  
  #devuelve verdadero si la variable $cantidad no coincide con el patrón, es decir, si no es un entero positivo.
  #[[ ! $cantidad =~ ^[0-9]+$ ]] && "Tiene que ingresar un entero positivo" && return 1  

  # reformulo función generar_imagenes(), con la logica de negar al entero positivo en caso de que matchee,
  # devuelve verdadero si la variable $cantidad coincide con el patrón ^[0-9]+$, es decir, si es un entero positivo. El operador ! se coloca fuera de la expresión para negar la condición y verificar si la varia  # ble $cantidad no es un entero positivo
  if ! [[ $cantidad =~ ^[0-9]+$ ]]; then
    echo "Debe ingresar un entero positivo."
    return 1
  fi

  echo "Generando $cantidad imágenes..."
  ./generar.sh $cantidad
}

# Función para descomprimir archivos utilizando descomprimir.sh
descomprimir_archivos() {
  echo "Descomprimiendo archivos..."
  archivo_imagenes=../datasets/imagenes.tar.gz
  archivo_checksum=../datasets/checksum
  ./descomprimir.sh $archivo_imagenes $archivo_checksum
}

# Función para procesar imágenes utilizando procesar.sh
procesar_imagenes() {
  echo "Procesando imágenes..."
  ./procesar.sh
}

# Función para comprimir archivos y generar informes utilizando comprimir.sh
comprimir_archivos() {
  echo "Comprimiendo archivos y generando listas de nombres..."
  ./comprimir.sh
}

# Menú principal
while true; do
  echo "Seleccione una opción:"
  echo "1. Generar imágenes"
  echo "2. Descomprimir archivos"
  echo "3. Procesar imágenes"
  echo "4. Comprimir archivos y generar informes"
  echo "5. Salir"

  #read opcion
  read -r opcion

  case $opcion in
    1) generar_imagenes ;;
    2) descomprimir_archivos ;;
    3) procesar_imagenes ;;
    4) comprimir_archivos ;;
    5) exit ;;
    *) echo "Opción inválida. Por favor, seleccione nuevamente." ;;
  esac

done




