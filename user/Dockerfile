FROM node:20
WORKDIR /app
COPY package.json .
COPY server.js .
RUN npm install
ENV MONGO="true" \
    MONGO_URL="mongodb://mongodb:27017/catalogue"
    REDIS_URL="redis://redis:6379"
CMD ["node" , "server.js"]    

#create redis image before creating user image,
#since we are not customizing redis image use the belwo command. no need of docker file for redis
#docker run -d --name redis --network roboshop redis:1.0.0

#docker build -t user:1.0.0
#docker run -d --name user --network roboshop user:1.0.0

/*
CMD node server.js
👉 Internally becomes:
/bin/sh -c "node server.js"
*/