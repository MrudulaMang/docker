FROM node:20
WORKDIR /app
COPY package.json .
COPY server.js .
RUN npm install
ENV REDIS_HOST="redis" \
    CATALOGUE_HOST="catalogue" \
    CATALOGUE_PORT="8080"
CMD ["node" , "server.js"]    

#docker build -t cart:1.0.0
#docker run -d --name cart --network roboshop cart:1.0.0