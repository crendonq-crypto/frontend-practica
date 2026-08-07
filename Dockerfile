# Usar la imagen oficial de Node.js en Alpine
FROM node:20-alpine

# Definir variables de entorno/build args opcionales
ARG APP_ENV
ENV APP_ENV=${APP_ENV}

# Directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar archivos de dependencias e instalar
COPY package*.json ./
RUN npm install

# Copiar el resto del código del proyecto
COPY . .

# Exponer el puerto por defecto de Vite
EXPOSE 5173

# Comando para levantar la aplicación escuchando en todas las interfaces de red
CMD ["npm", "run", "dev", "--", "--host"]