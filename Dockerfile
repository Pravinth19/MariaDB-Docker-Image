# Use the official MariaDB-Image from Docker Hub
FROM mariadb:latest

# Set environment variables for the standard configuration
ENV MARIADB_ROOT_PASSWORD=admin
ENV MARIADB_DATABASE=mariaDB

# Copy the initialization SQL-Scripts to the MariaDB directory used for initial setup
COPY source /docker-entrypoint-initdb.d