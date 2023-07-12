#!/bin/bash
chmod 777 ./scripts/*
chmod 777 *
sudo docker build -t app-imagenes .
sudo docker compose run -it --entrypoint bash app-imagenes /app/scripts/menu.sh

exit 0
