# Usa una imagen base de Node.js
FROM node:20-alpine

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia los archivos package.json y package-lock.json
COPY package*.json ./

# Instala las dependencias del proyecto
RUN npm ci --only=production

# Copia el resto del código de la aplicación
COPY . .

# Expone el puerto en el que se ejecuta la aplicación (debe coincidir con PORT en index.js)
EXPOSE 3000

# Define el comando para ejecutar la aplicación
CMD [ "npm", "start" ]