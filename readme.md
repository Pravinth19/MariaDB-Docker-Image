## MariaDB Docker Image

Dieses Repository enthält den Quellcode und das Dockerfile, um ein MariaDB-Docker-Image zu erstellen. Da die Images nicht in einer Container-Registry wie Docker Hub oder GitHub Container Registry gespeichert sind, muss das Image lokal aus dem bereitgestellten Quellcode gebaut werden.

## Schritte zur Verwendung

### 1. Repository klonen
Klonen Sie das GitHub-Repository auf Ihren Rechner:

```bash
git clone https://github.com/Pravinth19/MariaDB-Docker-Image.git
```

Wechseln Sie in das geklonte Verzeichnis:

```bash
cd MariaDB-Docker-Image
```

### 2. Docker-Image bauen
Bauen Sie das Docker-Image mit dem `docker build`-Befehl:

```bash
docker build -t mariadb-custom-image .
```

- **`-t mariadb-custom-image`**: Gibt dem Image den Namen `mariadb-custom-image`.
- **`.`**: Gibt an, dass das `Dockerfile` im aktuellen Verzeichnis liegt.

### 3. Container aus dem Image starten
Starten Sie einen Container mit dem neuen Image:

```bash
docker run -d --name mariadb -p 3306:3306 mariadb-custom-image
```

- **`-d`**: Startet den Container im Hintergrund.
- **`--name mariadb`**: Gibt dem Container den Namen `mariadb`.
- **`-p 3306:3306`**: Bindet den MariaDB-Port `3306` an den Host-Port `3306`.

### 4. Verbindung zur MariaDB herstellen

#### a) Direkt im Container
Verbinden Sie sich mit dem MariaDB-Client direkt im Container:

```bash
docker exec -it mariadb mariadb -u root -p
```

Geben Sie das Passwort ein, wenn Sie dazu aufgefordert werden (Standardpasswort: abhängig von Ihrer Konfiguration).
```bash
pw: admin
```

#### b) Mit einem externen SQL-Client
Verwenden Sie einen beliebigen SQL-Client (z. B. MySQL Workbench oder SQLTools in VS Code), um sich mit der Datenbank zu verbinden:

- **Host:** `localhost`
- **Port:** `3306`
- **Benutzername:** `vereinuser` oder `root`
- **Passwort:** (wie konfiguriert) `vereinuser = vereinuser` oder `root` = `admin`

### 5. Debugging und Logs

Falls Probleme auftreten, überprüfen Sie die Logs des Containers:

```bash
docker logs mariadb-container
```

### Hinweis
Stellen Sie sicher, dass der Port `3306` nicht bereits von einem anderen Prozess oder Container belegt ist. Falls der Port belegt ist, können Sie einen alternativen Port auf dem Host verwenden, z. B.:

```bash
docker run --name mariadb -d -p 3306:3306 hftm-mariadb
```

Nun können Sie über Port `3306` auf die Datenbank zugreifen.

---

# Vergleich MariaDB und Oracle-Beispiel-Datenbank


| **Aspekt**                      | **MariaDB**                                                                 | **Oracle**                                                                                     |
|----------------------------------|-----------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------|
| **Lizenz und Kosten**         | Open-Source und kostenlos verfügbar (GPL-Lizenz).                          | Proprietär und lizenzpflichtig, was zu höheren Kosten führen kann.                            |
| **Benutzerfreundlichkeit**    | Einfache Einrichtung und Verwaltung, ideal für kleinere Teams/Unternehmen.  | Steilere Lernkurve, ausgelegt auf komplexe Unternehmensanwendungen.                           |
| **Speicher-Engines**          | Unterstützt verschiedene Speicher-Engines wie InnoDB, MyISAM und Aria.      | Verwendet eine monolithische Speicher-Engine.                                                 |
| **JSON-Unterstützung**        | Native Unterstützung für JSON-Datentypen und JSON-Funktionen.              | Unterstützt JSON erst seit neueren Versionen, Implementierung oft komplexer.                  |                 |
| **Partitionierung**           | Partitionierung ist weniger komplex zu konfigurieren.                      | Partitionierungsfunktionen vorhanden, jedoch teilweise komplizierter.                        |
| **Cluster und Replikation**   | Unterstützt Galera Cluster für Multi-Master-Replikation.                    | Komplexe, aber leistungsstarke Lösungen wie Real Application Clusters (RAC).                 |
| **Beispieldatenbanken**       | Bereitgestellte Beispieltabellen sind einfach und zeigen grundlegende SQL-Funktionen. | Beispiel-Datenbanken (z. B. HR, SH) für Oracle-spezifische Features optimiert.               |
| **Performance bei kleineren Systemen** | Optimiert für kleinere bis mittelgrosse Systeme.                              | Speziell für grosse, komplexe Anwendungen und höhere Datenvolumen konzipiert.                  |
| **Community-Support**        | Grosse Open-Source-Community mit schneller Hilfe und Erweiterungen.          | Hauptsächlich kommerzieller Support, der kostenpflichtig ist.                                 |

---

# MariaDB Datenbank Übersicht

## Informationen zur physischen Speicherung der Daten
- Daten werden standardmässig im **InnoDB**-Format gespeichert, das schnelle Abfragen und Datenintegrität bietet.
- Jede Tabelle kann in einer eigenen Datei oder im gemeinsamen Speicherbereich gespeichert werden (`innodb_file_per_table`).
- **Dateien**:
  - Tabellen und Daten: `.ibd` (InnoDB) oder `.MYD` und `.MYI` (MyISAM).
  - Log-Dateien: Speichern Änderungen und Transaktionen für Wiederherstellung und Replikation.
- Daten können lokal, auf Netzwerkspeichern oder in der Cloud abgelegt werden.
- **Kompression**: Tabellen können komprimiert werden, um Speicherplatz zu sparen.

## Hinweise für den Betrieb der Datenbank
- **Backups**:
  - Nutzen Sie `mysqldump` oder MariaDB Backup für regelmässige Sicherungen.
  - Replikation hilft, Ausfälle abzufedern und Backups einfacher zu machen.
- **Performance**:
  - Aktivieren Sie Query-Caching (`query_cache_size`) für schnellere Abfragen.
  - Verwenden Sie `EXPLAIN`, um langsame Abfragen zu analysieren und zu verbessern.
- **Skalierung**:
  - Nutzen Sie Replikation oder Galera Cluster, um die Datenbank zu skalieren.
  - Für bessere Leistung kann die Hardware (mehr RAM, SSD) aufgerüstet werden.
- **Sicherheit**:
  - Aktivieren Sie SSL-Verschlüsselung für Verbindungen.
  - Setzen Sie sichere Passwörter und beschränken Sie Benutzerzugriffe.
- **Wartung**:
  - Führen Sie regelmässig `OPTIMIZE TABLE` aus, um Tabellen effizient zu halten.
  - Entfernen Sie alte Log-Dateien und temporäre Dateien.
- **Updates**:
  - Testen Sie neue Versionen zuerst in einer Testumgebung.
  - Halten Sie die Datenbank auf dem neuesten Stand für Sicherheits- und Leistungsverbesserungen.

Mit diesen einfachen Massnahmen lässt sich die MariaDB-Datenbank sicher und effizient betreiben.
