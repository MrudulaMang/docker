#as in class
FROM node:20.20.2-alpine3.23 AS builder  
# Pulls a Node.js + Alpine Linux image, Alpine = small, minimal OS
WORKDIR /app                             
#Creates /app inside container (if not exists)
COPY package.json .                      
#Bringing application source
COPY *.js .
RUN npm install                         
#Reads package.json and download dependencies 
 #and create node_modules inside container

FROM node:20.20.2-alpine3.23
WORKDIR /app
EXPOSE 8080
    #Documents which port the app uses
COPY --from=builder /app /app

# end is handeled in k8s via confgimap
# comment below two lines for k8
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


# --------------------------------other ports in container when docker run....before kuber
# udp   UNCONN   127.0.0.11:38697
# tcp   LISTEN   127.0.0.11:32885
# tcp   LISTEN   *:8080        (node)
# 🔥 Let’s break it down clearly
# ✅ 1. Your actual app
# *:8080  → node (PID 1)

# 👉 This is YOUR application

# Running on port 8080
# Listening on all interfaces (*)
# Healthy at process + port level ✅
# 🔹 2. These two ports (your question)
# 🔸 127.0.0.11:38697 (UDP)
# 🔸 127.0.0.11:32885 (TCP)

# 👉 These are NOT your app

# 🔥 What is 127.0.0.11?
# 127.0.0.11 = Docker internal DNS server

# 👉 Every container gets this automatically

# 🔹 Why Docker uses this

# Inside container:

# mongodb → resolves to container IP

# 👉 This resolution is handled by:

# 127.0.0.11 (Docker DNS)
# 🔥 So those ports are:
# Port	Type	Purpose
# 38697	UDP	DNS queries
# 32885	TCP	DNS fallback / resolution
# 🔥 Key insight (very important)

# These ports are internal Docker networking, not your application.

# 🔹 Real debugging mindset

# When you see:

# 127.0.0.11

# 👉 Immediately think:

# Docker DNS / service discovery
# 🔥 Your current health status
# ✔ Node running (PID 1)
# ✔ Port 8080 listening
# ✔ Container networking OK (DNS present)
# 🔹 FINAL STEP (most important now)

# Test app response:

# wget -qO- localhost:8080

# 👉 This confirms:

# App responding ✅
# Not just running
# 🔥 One-liner takeaway

# “Ports on 127.0.0.11 belong to Docker DNS, not your application.”

