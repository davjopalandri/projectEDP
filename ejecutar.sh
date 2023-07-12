#!/bin/bash
sudo chmod 777 ./scripts/*  
sudo chmod 777 *
sudo docker build -t app-imagenes .
sudo docker compose run -it --entrypoint bash app-imagenes /app/scripts/menu.sh

