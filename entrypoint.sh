#!/bin/sh

# Echo the MONGO_URI environment variable
echo "password" | service rsyslog start
echo "$MONGO_URI"
echo "$MONGO_USERNAME"
echo "$MONGO_PASSWORD"
echo "$MONGO_AUTH_SOURCE"

/app/mongo-bi-connector/bin/mongosqld --mongo-uri $MONGO_URI --mongo-username $MONGO_USERNAME --mongo-password $MONGO_PASSWORD --auth --sslMode requireSSL --sslPEMKeyFile /etc/ssl/mongoconnect.pem --mongo-authenticationSource $MONGO_AUTH_SOURCE --config /app/mongo-bi-connector/example-mongosqld-config.yml