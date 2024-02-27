#!/bin/sh

# Echo the MONGO_URI environment variable
echo "$MONGO_URI"
echo "$MONGO_USERNAME"
echo "$MONGO_PASSWORD"
echo "$MONGO_AUTH_SOURCE"

openssl req -newkey rsa:2048 -new -x509 -days 365 -nodes -out /etc/ssl/mongokeyfile/mongoconnect.pem -keyout /etc/ssl/mongokeyfile/mongoconnect.pem -subj '/CN=localhost'

/app/mongo-bi-connector/bin/mongosqld --mongo-uri $MONGO_URI --mongo-username $MONGO_USERNAME --mongo-password $MONGO_PASSWORD --auth --sslMode requireSSL --sslPEMKeyFile /etc/ssl/mongokeyfile/mongoconnect.pem --mongo-authenticationSource $MONGO_AUTH_SOURCE --config /app/mongo-bi-connector/example-mongosqld-config.yml
