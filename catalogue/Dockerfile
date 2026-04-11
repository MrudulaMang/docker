#as in class
FROM node:20.20.2-alpine3.23 AS builder  
# Pulls a Node.js + Alpine Linux image, Alpine = small, minimal OS
WORKDIR /app                             
#Creates /app inside container (if not exists)
COPY package.json .                      
#Bringing application source
COPY *.js .
RUN npm install                         
#Reads package.json and download dependencies and create node_modules inside container

FROM node:20.20.2-alpine3.23
WORKDIR /app
EXPOSE 8080
COPY --from=builder /app /app
# end is handeled in k8s via confgimap
#ENV MONGO="true" \
#    MONGO_URL="mongodb://mongodb:27017/catalogue"
RUN addgroup -S roboshop && adduser -S roboshop -G roboshop
RUN chown -R roboshop:roboshop /app
USER roboshop
#CMD ["node","server.js"]
CMD ["server.js"]
ENTRYPOINT ["node"]


#chatgpt optimized - claims the image size will be reduced to 150 mb or so, check
# # Stage 1

# FROM node:20.20.2-alpine3.23 as builder
# WORKDIR /app
# COPY package*.json ./
# RUN npm install --omit=dev && npm cache clean --force
# COPY . .

# # Stage 2

# FROM node:20.20.2-alpine3.23
# WORKDIR /app
# COPY --from=builder /app/node_modules ./node_modules
# COPY --from=builder /app/package*.json ./
# COPY --from=builder /app/*.js ./
# ENV MONGO="true" \
#     MONGO_URL="mongodb://mongodb:27017/catalogue"
# CMD ["node","server.js"]


# only change - minimal base image
# FROM node:20.20.2-alpine3.23
# WORKDIR /app
# COPY package.json .
# COPY *.js .
# ENV MONGO="true" \
#     MONGO_URL="mongodb://mongodb:27017/catalogue"
# RUN npm install 
# CMD ["node","server.js"]

#### initial normal docker file
# FROM node:20 #Gives runtime (Node + npm)
# WORKDIR /app
# COPY package.json .
# COPY *.js .
# ENV MONGO="true" \
#     MONGO_URL="mongodb://mongodb:27017/catalogue"
# # Environment=MONGO_URL="mongodb://<MONGODB-SERVER-IPADDRESS>:27017/catalogue"(NodejsPackageManager), 
# # here mongo is in same ec2 as catalogue and other so  container name owrks as DNS 
# RUN npm install #Install App Dependencies, read pakckage.json and install the libraries my app needs
# CMD ["node","server.js"]

# docker network create roboshop
# docker network diconnect bridge mongodb
# docker network connect roboshop mongodb catalogue

#docker build
#docker run

# why copy *.js why not just server.js
# 1. Future-proofing
    # Today:
        # server.js
    # Tomorrow:
        # server.js
        # db.js
        # routes.js
        # utils.js

# Most production-grade Dockerfiles actually do:
#     COPY . .
#  BUT with a .dockerignore:
#     node_modules
#     .git
#     *.log
# 👉 This gives:
#     Flexibility
#     Control
#     Clean builds

# Avoid forgetting dependencies
#     In Node apps, logic often gets split:
#         server.js → entry point
#         db.js → DB connection
#         routes.js → APIs
#     If you forget to copy one file → runtime crash:
#     Error: Cannot find module './db'
#     Wildcard avoids that class of mistake.