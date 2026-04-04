FROM nginx:1.24.0
RUN rm -rf /usr/share/nginx/html/*
RUN rm -rf /etc/nginx/nginx.conf
RUN rm -rf /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY static /usr/share/nginx/html/

#do changes in nginx.conf file to url
#docker build -t frontend:1.0.0.0 .
#docker logs frontend
#docker run -d -p 80:80 --network roboshop --name frontend frontend:1.0.0

#docker rm -f frontend


/*
RUN rm -rf /usr/share/nginx/html/* && \
    rm -rf /etc/nginx/nginx.conf
🔍 What’s happening here
RUN executes a shell command during build
&& ensures:
second command runs only if first succeeds
\ is a line continuation character (for readability)

With a trailing /, Docker treats the destination as a directory and will create it if it doesn’t exist.
COPY nginx.conf /etc/nginx/
else just write COPY nginx.conf /etc/nginx/nginx.conf
*/