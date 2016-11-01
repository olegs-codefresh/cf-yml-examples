FROM node:latest

RUN mkdir -p /var/www/api
WORKDIR /var/www/api

COPY package.json /var/www/api/

RUN npm install --silent
RUN npm install -g pm2

COPY . /var/www/api/

ADD nginx.conf /etc/nginx/
ADD default /etc/nginx/sites-available/

EXPOSE 8081

ENV PORT 8081

#CMD pm2 start app.js
CMD npm start