#session 58 - 59:00

FROM node:20.20.2-alpine3.23 as builder
WORKDIR /app 
COPY package.json .
COPY *.js .
RUN npm install

FROM node:20.20.2-alpine3.23 
WORKDIR /app
EXPOSE 8080
COPY --from=builder /app /app 
RUN addgroup -S roboshop && adduser -S roboshop -G roboshop
USER roboshop
# end is handeled in k8s via confgimap

ENV REDIS_HOST="redis" \
    CATALOGUE_HOST="catalogue" \
    CATALOGUE_PORT="8080"
CMD ["node" , "server.js"]    


# FROM node:20.20.2-alpine3.23
# WORKDIR /app
# COPY package.json .
# COPY *.js .
# ENV REDIS_HOST="redis" \
#     CATALOGUE_HOST="catalogue" \
#     CATALOGUE_PORT="8080"
# CMD ["node" , "server.js"]    

#docker build -t cart:1.0.0
#docker run -d --name cart --network roboshop cart:1.0.0
#docker exec -it cart sh
#> curl http://localhost:8080/health