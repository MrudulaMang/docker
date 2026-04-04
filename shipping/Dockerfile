FROM maven:3.9.14
EXPOSE 8080 #y EXPOSE?
WORKDIR /app
#COPY src . #copies only contents but we want src folder also
COPY src ./src # copies folder and contents
COPY pom.xml .
RUN mvn clean package # intalls app Dependencies
RUN mv  target/shipping-1.0.jar shipping.jar #renaming file
ENV CART_ENDPOINT="cart:8080" \
    DB_HOST="mysql"
CMD ["java", "-jar", "shipping.jar"]    #execstart =/bin/jar....
