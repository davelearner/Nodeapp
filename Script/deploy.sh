#!/bin/bash
# Script de Deployment para Contenedores
# DB: MongoDB
# Web: NodeJS
#Obtencion de la imagen
docker pull bitnami/mongodb:latest

#Creación de la red
docker network create nw_nodejs_mongo 
#--driver bridge

#DB
#Proceso de ejecucion del contenedor de Base de datos
#Variables de entorno utilizadas para creación de DB
# MONGO_INITDB_ROOT_USERNAME Usuario de la base de datos MongoDB
# MONGO_INITDB_ROOT_PASSWORD Clave de la base de datos MongoDB
docker run -dit --name mongodb \
  --env MONGODB_USERNAME=myuser \
  --env MONGODB_PASSWORD=secret \
  --env MONGODB_DATABASE=myMongoDB \
  --env MONGODB_ROOT_PASSWORD=qwerty \
  --env MONGODB_ENABLE_DIRECTORY_PER_DB=yes \
  --network nw_nodejs_mongo \
  --volume "$(pwd)"/mongodb:/bitnami/mongodb \
  --restart=always \
  bitnami/mongodb:latest

#Web
#Proceso de ejecucion del contenedor de NodeJS
docker run -dit --name nodeonair \
  -p 8081:8080 \
  --network nw_nodejs_mongo \
  --restart=always \
  myapp:latest

