**Docker image for setting up the mongo-bi-connector arm64 in a container**

# Usage

```docker build -t mongo-bi-connector .```

```docker compose up```

# Enviroment Variables

Add to an .env file or can be specified in a Docker-compose file.

 +  MONGO_URI
 +  MONGO_USERNAME
 +  MONGO_PASSWORD
 +  MONGO_AUTH_SOURCE

As the key is generated and added All you have to do is to append any certificates that connect to this service. This will be shown in the example docker-compose file

# FAQ

**Sometimes the connector connects before my mongo db is loaded thus failing.**

To get around this in your compose file add mongo as a dependency.