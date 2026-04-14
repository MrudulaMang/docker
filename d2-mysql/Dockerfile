FROM mysql:8.0
# ENV MYSQL_ROOT_PASSWORD="RoboShop@1"
COPY db/ /docker-entrypoint-initdb.d 


#copy database files and executes from db folder to mysql when places in initdb.d at runtime in alphabetical order.
#i got this db folder from shipping folder(unzipped shipping folder) 
#we can load data from shipping service or mysql db
#removed schema.sql , duplicate data