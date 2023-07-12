#!/bin/bash

sudo docker build -t app-imagenes .
sudo docker compose run -it --entrypoint bash app-imagenes /app/scripts/menu.sh

