# session 59 1:00
FROM nginx:1.24.0-alpine3.17-slim

RUN rm -f /etc/nginx/nginx.conf /etc/nginx/conf.d/default.conf
#-f = ignore if file doesn’t exist
RUN mkdir -p /var/cache/nginx/client_temp && \
    mkdir -p /var/cache/nginx/proxy_temp && \
    mkdir -p /var/cache/nginx/fastcgi_temp && \
    mkdir -p /var/cache/nginx/uwsgi_temp && \
    mkdir -p /var/cache/nginx/scgi_temp && \
    chown -R nginx:nginx /var/cache/nginx && \
    chown -R nginx:nginx /etc/nginx/ && \
    chmod -R 755 /etc/nginx/ && \
    chown -R nginx:nginx /var/log/nginx

RUN mkdir -p /etc/nginx/ssl/ && \
    chown -R nginx:nginx /etc/nginx/ssl/ && \
    chmod -R 755 /etc/nginx/ssl/

RUN touch /var/run/nginx.pid && \
    chown -R nginx:nginx /var/run/nginx.pid /run/nginx.pid
COPY nginx.conf /etc/nginx/

COPY static /usr/share/nginx/html/
USER nginx
CMD ["nginx", "-g", "daemon off;"]







# learn about these dirs later and nginx.conf
#when we install nginx we get nginx user by default; check in nginx.conf 1st line

#  in real time projects also we gather data like above from forums





# FROM nginx:1.24.0
# RUN rm -rf /usr/share/nginx/html/*
# RUN rm -rf /etc/nginx/nginx.conf
# RUN rm -rf /etc/nginx/conf.d/default.conf
# COPY nginx.conf /etc/nginx/nginx.conf
# COPY static /usr/share/nginx/html/

#do changes in nginx.conf file to url
#docker build -t frontend:1.0.0.0 .
#docker logs frontend
#docker run -d -p 80:80 --network roboshop --name frontend frontend:1.0.0

#docker rm -f frontend


# /*
# RUN rm -rf /usr/share/nginx/html/* && \
#     rm -rf /etc/nginx/nginx.conf
# 🔍 What’s happening here
# RUN executes a shell command during build
# && ensures:
# second command runs only if first succeeds
# \ is a line continuation character (for readability)

# With a trailing /, Docker treats the destination as a directory and will create it if it doesn’t exist.
# COPY nginx.conf /etc/nginx/
# else just write COPY nginx.conf /etc/nginx/nginx.conf
# */