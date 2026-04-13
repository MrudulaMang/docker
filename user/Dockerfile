FROM node:20.20.2-alpine3.23 AS builder
WORKDIR /app
COPY package.json .
COPY *.js .
RUN npm install

FROM node:20.20.2-alpine3.23
WORKDIR /app
EXPOSE 8080
COPY --from=builder /app /app
RUN addgroup -S roboshop && adduser -S roboshop -G roboshop
RUN chown roboshop:roboshop /app
ENV REDIS_URL="redis://redis:6379" \
    MONGO_URL="mongodb://mongodb:27017/users"

USER roboshop
CMD ["server.js"]
ENTRYPOINT ["node"]






# FROM node:20
# WORKDIR /app
# COPY package.json .
# COPY server.js .
# RUN npm install
# ENV MONGO="true" \
#     MONGO_URL="mongodb://mongodb:27017/catalogue" \
#     REDIS_URL="redis://redis:6379"
# CMD ["node" , "server.js"]    

#create redis image before creating user image,
#since we are not customizing redis image use the belwo command. no need of docker file for redis
#docker run -d --name redis --network roboshop redis:1.0.0

#docker build -t user:1.0.0
#docker run -d --name user --network roboshop user:1.0.0

# /*
# CMD node server.js
# 👉 Internally becomes:
# /bin/sh -c "node server.js"
# */