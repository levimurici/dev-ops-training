FROM node:latest
MAINTAINER Levizeira da Bahia
ENV NODE_ENV=production
ENV PORT=3000
COPY . /var/www
# Diretório inicial 
WORKDIR /var/www
RUN npm install
ENTRYPOINT ["npm", "start"]
EXPOSE $PORT
