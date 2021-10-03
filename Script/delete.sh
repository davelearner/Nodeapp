#!/bin/bash
# Script de Limpieza para Contenedores
# DB: MongoDB
# Web: NodeJS

#Detencion y Eliminacion del contenedor de base de datos
docker stop mongodb
docker rm mongodb

#Detenciòn y eliminaciòn del contenedor de aplicacion

docker stop nodeonair
docker rm nodeonair

#Eliminar la carpeta de la base de datos

rm -Rf -- "$(pwd)"/mongodb/

#Eliminacion de la red
docker network rm nw_nodejs_mongo