# Dockerfile para Imagen de Contenedor - NodeOnAir en NodeJs
# Web: NodeJS

#Seleccion de imagen base
FROM node:16.10.0-bullseye-slim

#Se estalece el espacio de trabajo
WORKDIR /usr/src/app

#Se copia el fichero de configuracion
COPY package.json .

#Se actualiza para poder instalar depedencias
RUN npm update 

#Se instalan depedencias
RUN npm install

#Se instala la libreria dotenv
RUN npm install dotenv

#Se agregan metadatos
LABEL maintainer="davelearner@outlook.com" \
description="MyApp en NodeJS" \
version="1.0"

# Se expone el puerto por que se expone la aplicacion
EXPOSE 8081

# Se ejecuta el proceso dentro del contenedor
CMD [ "npm", "start" ]

# Se copia el resto del codigo
COPY . .
