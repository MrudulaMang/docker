FROM maven:3.9
EXPOSE 8080
WORKAPP /app
COPY payment.ini
COPY *.py 
COPY requirements.txt
RUN pip install -r requirements.txt # install app dependencies
CMD ["uwsgi", "--ini", "payment.ini"] 