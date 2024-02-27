#!/bin/sh

# Echo the MONGO_URI environment variable

#Generate the key file and append to ssl_key volume
openssl req -newkey rsa:2048 -new -x509 -days 365 -nodes -out /etc/ssl/mongokeyfile/mongoconnect.pem -keyout /etc/ssl/mongokeyfile/mongoconnect.pem -subj '/CN=localhost'
# Run the application with specified variables
/app/mongo-bi-connector/bin/mongosqld --mongo-uri $MONGO_URI --mongo-username $MONGO_USERNAME --mongo-password $MONGO_PASSWORD --auth --sslMode requireSSL --sslPEMKeyFile /etc/ssl/mongokeyfile/mongoconnect.pem --mongo-authenticationSource $MONGO_AUTH_SOURCE --config /app/mongo-bi-connector/example-mongosqld-config.yml
