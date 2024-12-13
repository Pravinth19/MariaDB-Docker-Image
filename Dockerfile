# Verwende das offizielle MariaDB-Image von Docker Hub
FROM mariadb:latest

# Umgebungsvariablen für die Standardkonfiguration setzen
ENV MARIADB_ROOT_PASSWORD=admin
ENV MARIADB_DATABASE=mariaDB

# Kopiere die Initialisierungs-SQL-Skripte in das MariaDB-Verzeichnis für die Erstkonfiguration
COPY source /docker-entrypoint-initdb.d