#session 59 :  33:30 hardend image -> no previlage acces keep only what u need
FROM python:3.9.25-alpine3.22 AS builder
WORKDIR /app
RUN apk add --no-cache build-base linu-headers pcre-dev   
#alpine dont have many dependencies so we are including them here, so that it dont fail
COPY requirements.txt .
RUN pip3.9 install --prefix=/install -r requirements.txt  
 #dependencies will be created in insstall folder which willbe created


FROM python:3.9.25-alpine3.22
EXPOSE 8080
WORKDIR /app
RUN apk add --no cache pcre
#   adding install dir to /usr/local, anything here are executable
RUN addgroup -S roboshop && adduser -S roboshop -G roboshop
RUN chown -R roboshop:roboshop /app
COPY --from=builder /install /usr/local 
# can use COPY --chown=roboshop:roboshop payment.ini *.py requirement.txt -> WITH USERNAME (39:32)
COPY payment.ini *.py requirement.txt
ENV CART_HOST="cart" \
    CART_PORT="8080" \
    USER_HOST="user" \
    USER_PORT="8080" \
    AMQP_HOST="rabbitmq" \
    AMQP_USER="roboshop" \
    AMQP_PASS="roboshop123" 
USER roboshop                   
CMD ["uwsgi", "--ini", "payment.ini"]


# FROM pyhton:3.9 #this might be on debian/unbuntu size is large
# EXPOSE 8080
# WORKAPP /app
# COPY payment.ini
# COPY *.py 
# COPY requirements.txt
# RUN pip install -r requirements.txt # install app dependencies
# CMD ["uwsgi", "--ini", "payment.ini"] 