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

As the key is generated and added all you have to do is to append any certificates that connect to this service. This can be done by using a volume and loading it on containers that need to append keys.

# FAQ

**Sometimes the connector connects before my mongo db is loaded thus failing.**

To get around this in your compose file add mongo as a dependency.