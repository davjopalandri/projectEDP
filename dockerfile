Para obtener una imagen desde Docker Hub, puedes utilizar el comando docker pull seguido del nombre de la imagen. Por ejemplo:

Copy code
docker pull ubuntu:latest
Si tienes una imagen personalizada, puedes construirla utilizando un archivo Dockerfile y el comando docker build. Por ejemplo:

Copy code
docker build -t mi-imagen:latest .
Crea un contenedor: Una vez que tienes una imagen, puedes crear un contenedor basado en esa imagen. Puedes utilizar el comando docker run para crear y ejecutar un contenedor.

Si deseas ejecutar un contenedor interactivo en el primer plano, puedes utilizar el siguiente comando:

arduino
Copy code
docker run -it nombre_imagen
Si deseas ejecutar un contenedor en segundo plano (dettached mode), puedes agregar la opción -d al comando docker run:

arduino
Copy code
docker run -d nombre_imagen
Interactúa con el contenedor: Una vez que el contenedor está en ejecución, puedes interactuar con él.

Para acceder a la terminal interactiva de un contenedor en ejecución, puedes utilizar el comando docker exec:

bash
Copy code
docker exec -it nombre_contenedor bash
Puedes copiar archivos dentro y fuera del contenedor utilizando docker cp:

bash
Copy code
docker cp archivo_local nombre_contenedor:ruta_destino
docker cp nombre_contenedor:ruta_archivo archivo_local
Detén y elimina el contenedor: Cuando hayas terminado de utilizar el contenedor, puedes detenerlo y eliminarlo.

Para detener un contenedor en ejecución, puedes utilizar el comando docker stop seguido del nombre o ID del contenedor:

arduino
Copy code
docker stop nombre_contenedor
Para eliminar un contenedor, puedes utilizar el comando docker rm seguido del nombre o ID del contenedor:

bash
Copy code
docker rm nombre_contenedor
Estos son los pasos básicos para correr un contenedor utilizando Docker. Puedes consultar la documentación oficial de Docker para obtener más información sobre los comandos y opciones disponibles.