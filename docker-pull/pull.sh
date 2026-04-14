docker run -d --network roboshop --name mongodb mrudula158/mongodb:1.0.0
docker run -d --network roboshop --name catalogue mrudula158/catalogue:1.0.0
docker run -d --network roboshop --name redis redis:7
docker run -d --network roboshop --name rabbitmq rabbitmq:3
docker run -d --network roboshop --name mysql mrudula158/mysql:1.0.0
docker run -d --network roboshop --name cart mrudula158/cart:1.0.0
docker run -d --network roboshop --name user mrudula158/user:1.0.0
docker run -d --network roboshop --name shipping mrudula158/shipping:1.0.0
docker run -d --network roboshop --name payment mrudula158/payment:1.0.0
docker run -d -p 80:80 --network roboshop --name frontend mrudula158/frontend:1.0.0
