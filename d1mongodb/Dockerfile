FROM mongo:7.0
COPY *.js /docker-entrypoint-initdb.d/

#docker builder -t mongodb:1.0.0
#docker run -d --network roboshop --name mongodb mongodb:1.0.0
# docker exec --> ps aux | grep mongodb
#mongosh mongodb://localhost:27017
# ps aux | grep mongodb
# ss -tulnp | grep 27017
# mongosh -u root -p or mongosh
# show databases
#--show catalogue
-----use catalogue
#cata..>show collections (collections are tables)
#-------db.products.find()---- gives rows which are documents
#--------db.products.find().pretty()
#----------db.products.countDocumens() -- no of rows

# 🧱 mongod
# This is the actual MongoDB server
# Runs automatically when container starts
# Listens on port 27017
# Stores and serves data
# 👉 This is the “database”

# 🧑‍💻 mongosh
# This is just a client tool
# Like a terminal to talk to MongoDB
# NOT running by default
# 👉 That’s why you must manually run it

# You asked:
# why after exec I still need mongosh?
# Because:
# docker exec → enters container OS
# mongosh     → connects to MongoDB process (mongod)
# 👉 These are two different layers

# 🔹 Real-world analogy

# Think like this:

# Container = Server machine
# mongod = Database service running on that server
# docker exec = SSH into server
# mongosh = MySQL client / DB client


