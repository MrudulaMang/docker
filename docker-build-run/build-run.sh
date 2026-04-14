cd d1-mongodb
docker build -t mongodb:1.2.0 .
docker run -d --name mongodb mongodb:1.2.0

cd ../b1-catalogue
docker build -t catalogue:1.2.0 .
docker run -d --name catalogue catalogue:1.2.0

cd ../b2-user
docker build -t user:1.2.0 .
docker run -d --name user user:1.2.0

cd ../b3-cart
docker build -t cart:1.2.0 .
docker run -d --name cart cart:1.2.0

cd ../b4-shipping
docker build -t shipping:1.2.0 .
docker run -d --name shipping shipping:1.2.0

cd ../b5-payment
docker build -t payment:1.2.0 .
docker run -d --name payment payment:1.2.0
cd ../b6-frontend
docker build -t frontend:1.2.0 .
docker run -d --name frontend frontend:1.2.0


cd ../d2-mysql
docker build -t mysql:1.2.0 .
docker run -d --name mysql mysql:1.2.0
#rabbitmq
#redis 