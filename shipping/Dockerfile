#session 59 -1.24

FROM maven:3.9.14
WORKDIR /app
COPY src ./src
COPY pom.xml .
RUN maven clean package && \
    target/shipping-1.0.jar shipping.jar 

FROM eclipse-temurin:17-jre-alpine
EXPOSE 8080
WORKDIR /app
COPY --from=builder /app/shipping.jar .
RUN addgroup -S roboshop && adduser -S roboshop -G roboshop && \
    chown roboshop:roboshop /app
ENV CART_ENDPOINT="cart:8080" \
    DB_HOST="mysql"    
USER roboshop
CMD ["shipping.jar"]
ENTRYPOINT ["java","jar"] #####check


# FROM maven:3.9.14
# EXPOSE 8080 #y EXPOSE?
# WORKDIR /app
# #COPY src . #copies only contents but we want src folder also
# COPY src ./src # copies folder and contents
# COPY pom.xml .
# RUN mvn clean package # intalls app Dependencies
# RUN mv  target/shipping-1.0.jar shipping.jar #renaming file
# ENV CART_ENDPOINT="cart:8080" \
#     DB_HOST="mysql"
# CMD ["java", "-jar", "shipping.jar"]    #execstart =/bin/jar....
