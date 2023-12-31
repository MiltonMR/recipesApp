FROM node:20.10.0

WORKDIR /app_back_end

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 8080

RUN apt-get update && apt-get install -y wget
ENV DOCKERIZE_VERSION v0.7.0
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
  && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
  && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz


CMD ["npm", "start"]