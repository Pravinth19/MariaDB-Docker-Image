-- Benutzererstellung und Rechteverwaltung

-- Benutzer "scott" erstellen
CREATE USER 'scott'@'%' IDENTIFIED BY 'tiger';

-- Volle Rechte auf Tabellen emp und dept
GRANT ALL PRIVILEGES ON mariaDB.emp TO 'scott'@'%';
GRANT ALL PRIVILEGES ON mariaDB.dept TO 'scott'@'%';

-- Berechtigung, Views zu erstellen
GRANT CREATE VIEW ON mariaDB.* TO 'scott'@'%';

-- Benutzervereinuser erstellen
CREATE USER 'vereinuser'@'%' IDENTIFIED BY 'vereinuser';

-- Volle Rechte auf spezifische Tabellen
GRANT ALL PRIVILEGES ON mariaDB.Anlass TO 'vereinuser'@'%';
GRANT ALL PRIVILEGES ON mariaDB.Funktion TO 'vereinuser'@'%';
GRANT ALL PRIVILEGES ON mariaDB.Funktionsbesetzung TO 'vereinuser'@'%';
GRANT ALL PRIVILEGES ON mariaDB.Person TO 'vereinuser'@'%';
GRANT ALL PRIVILEGES ON mariaDB.Spende TO 'vereinuser'@'%';
GRANT ALL PRIVILEGES ON mariaDB.Sponsor TO 'vereinuser'@'%';
GRANT ALL PRIVILEGES ON mariaDB.Sponsorenkontakt TO 'vereinuser'@'%';
GRANT ALL PRIVILEGES ON mariaDB.Status TO 'vereinuser'@'%';
GRANT ALL PRIVILEGES ON mariaDB.Teilnehmer TO 'vereinuser'@'%';

-- Berechtigung, Views zu erstellen
GRANT CREATE VIEW ON mariaDB.* TO 'vereinuser'@'%';

-- Abschluss
FLUSH PRIVILEGES;
