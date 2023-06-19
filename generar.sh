#!/bin/bash

ENTRADA=$1

for I in $(seq $ENTRADA); do
    $(curl -L 'https://source.unsplash.com/random/900%C3%97700/?person' -o imagenes/imagen$I)
    sleep 1
done
