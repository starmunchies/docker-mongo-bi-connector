# Use an ARM-compatible base image
FROM ubuntu:latest

# Set the working directory
WORKDIR /app

# Install necessary dependencies
RUN apt-get update && \
    apt-get install -y wget rsyslog && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Download and install MongoBI Connector (Replace the URL with the correct one)
RUN wget -O /app/mongodb-bi-linux-arm64-ubuntu2204-v2.14.12.tgz https://info-mongodb-com.s3.amazonaws.com/mongodb-bi/v2/mongodb-bi-linux-arm64-ubuntu2204-v2.14.12.tgz && \
    tar -xzf /app/mongodb-bi-linux-arm64-ubuntu2204-v2.14.12.tgz && \
    chmod +x /app/mongodb-bi-linux-arm64-ubuntu2204-v2.14.12/bin/* && \
    mv /app/mongodb-bi-linux-arm64-ubuntu2204-v2.14.12 /app/mongo-bi-connector

# Expose any ports required by MongoBI Connector
EXPOSE 3307

# Set the entrypoint command
run openssl req -newkey rsa:2048 -new -x509 -days 365 -nodes -out /etc/ssl/mongoconnect.pem -keyout /etc/ssl/mongoconnect.pem -subj '/CN=localhost'

# Copy the entrypoint script
COPY entrypoint.sh .

run chmod +x /app/entrypoint.sh


