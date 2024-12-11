/*================================================*/
/* Datenbanken II                                 */
/* Vereinsdatenbank                               */
/* Beispieldaten                                  */
/*================================================*/

/* Tabelle: Funktion */
INSERT INTO Funktion (FunkID, Bezeichner) VALUES
(1, 'Praesidium'),
(2, 'Vizepraesidium'),
(3, 'Kasse'),
(4, 'Beisitz'),
(5, 'PR');

/* Tabelle: Sponsor */
INSERT INTO Sponsor (SponID, Name, Strasse_Nr, PLZ, Ort, Spendentotal) VALUES
(1, 'Hasler AG', 'Zelgweg 9', '2540', 'Grenchen', 1270),
(2, 'Pauker Druck', 'Solothurnstr. 19', '2544', 'Bettlach', 2750),
(3, 'Meyer Toni', 'Rothstr. 22', '4500', 'Solothurn', 750);

/* Tabelle: Status */
INSERT INTO Status (StatID, Bezeichner, Beitrag) VALUES
(1, 'Junior', 0),
(2, 'Aktiv', 50),
(3, 'Ehemalig', NULL),
(4, 'Passiv', 30),
(5, 'Helfer', NULL),
(6, 'Extern', NULL);

/* Tabelle: Person */
INSERT INTO Person (PersID, StatID, Name, Vorname, Strasse_Nr, PLZ, Ort, Bezahlt, Bemerkungen, Eintritt, Austritt, MentorID) VALUES
(1, 3, 'Niiranen', 'Ulla', 'Nordstr. 113', '2500', 'Biel', '1', NULL, STR_TO_DATE('11-11-2007', '%d-%m-%Y'), STR_TO_DATE('31-03-2011', '%d-%m-%Y'), NULL),
(2, 3, 'Wendel', 'Otto', 'Sigriststr. 9', '4500', 'Solothurn', '1', NULL, STR_TO_DATE('01-01-2011', '%d-%m-%Y'), STR_TO_DATE('30-11-2014', '%d-%m-%Y'), NULL),
(3, 2, 'Meyer', 'Dominik', 'Rainstr. 13', '4528', 'Zuchwil', '1', NULL, STR_TO_DATE('01-01-2011', '%d-%m-%Y'), NULL, NULL),
(4, 2, 'Meyer', 'Petra', 'Rainstr. 13', '4528', 'Zuchwil', '1', NULL, STR_TO_DATE('15-02-2009', '%d-%m-%Y'), NULL, NULL),
(5, 2, 'Tamburino', 'Mario', 'Solothurnstr. 96', '2540', 'Grenchen', '0', NULL, STR_TO_DATE('30-09-2014', '%d-%m-%Y'), NULL, 4),
(6, 2, 'Bregger', 'Beni', 'Sportstr. 2', '2540', 'Grenchen', '1', NULL, STR_TO_DATE('21-05-2012', '%d-%m-%Y'), NULL, 4),
(7, 5, 'Luder', 'Kevin', 'Forstweg 14', '2545', 'Zuchwil', '1', 'Klaushock', NULL, NULL, NULL),
(8, 6, 'Frei', 'Barbara', 'Gartenstr.1', '2540', 'Grenchen', '1', NULL, NULL, NULL, NULL),
(9, 6, 'Huber', 'Felix', 'Eichmatt 7', '2545', 'Selzach', '1', NULL, NULL, NULL, NULL),
(10, 1, 'Cadola', 'Leo', 'Sportstr. 2', '4500', 'Solothurn', '1', NULL, STR_TO_DATE('01-10-2013', '%d-%m-%Y'), NULL, NULL),
(11, 1, 'Bart', 'Sabine', 'Bernstr. 15', '2540', 'Grenchen', '1', NULL, STR_TO_DATE('12-07-2014', '%d-%m-%Y'), NULL, 10),
(12, 2, 'Gruber', 'Romy', 'Gladbaechli 3', '2545', 'Selzach', '0', NULL, STR_TO_DATE('29-11-2009', '%d-%m-%Y'), NULL, NULL);

/* Tabelle: Anlass */
INSERT INTO Anlass (AnlaID, Bezeichner, Ort, Datum, Kosten, OrgID) VALUES
(1, 'GV', 'Solothurn', STR_TO_DATE('31-03-2013', '%d-%m-%Y'), 200, 2),
(2, 'Vorstandssitzung', 'Grenchen', STR_TO_DATE('17-01-2014', '%d-%m-%Y'), NULL, 12),
(3, 'GV', 'Bettlach', STR_TO_DATE('30-03-2013', '%d-%m-%Y'), 200, 6),
(4, 'Klaushock', 'Bettlach', STR_TO_DATE('06-12-2014', '%d-%m-%Y'), 150, 7),
(5, 'Vorstandssitzung', 'Grenchen', STR_TO_DATE('21-01-2015', '%d-%m-%Y'), NULL, 12),
(6, 'Turnier', 'Biel', STR_TO_DATE('28-02-2014', '%d-%m-%Y'), 1020, 10),
(7, 'GV', 'Grenchenberg', STR_TO_DATE('29-03-2015', '%d-%m-%Y'), 250, 4),
(8, 'Vorstandssitzung', 'Grenchen', STR_TO_DATE('19-01-2015', '%d-%m-%Y'), NULL, 6);

/* Tabelle: Spende */
INSERT INTO Spende (SponID, SpenID, AnlaID, Bezeichner, Datum, Betrag) VALUES
(1, 5, 6, 'Apéro', STR_TO_DATE('02-02-2015', '%d-%m-%Y'), 720),
(1, 6, NULL, 'Defizittilgung', STR_TO_DATE('13-04-2015', '%d-%m-%Y'), 550),
(2, 3, 7, 'Getraenke', STR_TO_DATE('05-03-2015', '%d-%m-%Y'), 600),
(2, 4, 6, 'Plakate', STR_TO_DATE('11-03-2015', '%d-%m-%Y'), 300),
(2, 5, NULL, 'Defizittilgung', STR_TO_DATE('13-04-2015', '%d-%m-%Y'), 750),
(3, 1, 4, 'Gluehwein', STR_TO_DATE('29-11-2014', '%d-%m-%Y'), 200),
(3, 2, 7, 'Unterhaltungsmusik', STR_TO_DATE('23-02-2015', '%d-%m-%Y'), 550);

/* Tabelle: Teilnehmer */
INSERT INTO Teilnehmer (PersID, AnlaID) VALUES
(3, 1), (4, 1), (6, 1), (12, 1),
(2, 2), (3, 2), (4, 2),
(2, 3), (4, 3), (6, 3), (12, 3),
(3, 5), (12, 5),
(2, 7), (3, 7), (6, 7),
(4, 8), (12, 8);

/* Tabelle: Sponsorenkontakt */
INSERT INTO Sponsorenkontakt (PersID, SponID) VALUES
(8, 1), (4, 2), (9, 2), (3, 3), (4, 3);

/* Tabelle: Funktionsbesetzung */
INSERT INTO Funktionsbesetzung (PersID, FunkID, Antritt, Ruecktritt) VALUES
(1, 1, STR_TO_DATE('11-11-2007', '%d-%m-%Y'), STR_TO_DATE('31-03-2010', '%d-%m-%Y')),
(4, 2, STR_TO_DATE('01-04-2009', '%d-%m-%Y'), STR_TO_DATE('31-03-2011', '%d-%m-%Y')),
(12, 1, STR_TO_DATE('01-04-2010', '%d-%m-%Y'), STR_TO_DATE('31-03-2011', '%d-%m-%Y')),
(4, 1, STR_TO_DATE('01-04-2011', '%d-%m-%Y'), STR_TO_DATE('31-03-2013', '%d-%m-%Y')),
(12, 2, STR_TO_DATE('01-04-2011', '%d-%m-%Y'), STR_TO_DATE('31-03-2012', '%d-%m-%Y')),
(2, 3, STR_TO_DATE('01-04-2011', '%d-%m-%Y'), STR_TO_DATE('31-03-2013', '%d-%m-%Y')),
(3, 2, STR_TO_DATE('01-04-2012', '%d-%m-%Y'), STR_TO_DATE('31-03-2013', '%d-%m-%Y')),
(12, 1, STR_TO_DATE('01-04-2012', '%d-%m-%Y'), NULL),
(6, 3, STR_TO_DATE('01-04-2013', '%d-%m-%Y'), STR_TO_DATE('31-03-2014', '%d-%m-%Y')),
(3, 4, STR_TO_DATE('01-04-2013', '%d-%m-%Y'), STR_TO_DATE('31-03-2015', '%d-%m-%Y')),
(4, 5, STR_TO_DATE('01-04-2013', '%d-%m-%Y'), STR_TO_DATE('31-03-2014', '%d-%m-%Y')),
(6, 2, STR_TO_DATE('01-04-2014', '%d-%m-%Y'), STR_TO_DATE('30-04-2029', '%d-%m-%Y')),
(4, 4, STR_TO_DATE('01-04-2014', '%d-%m-%Y'), NULL),
(2, 5, STR_TO_DATE('01-04-2014', '%d-%m-%Y'), STR_TO_DATE('30-11-2028', '%d-%m-%Y')),
(3, 3, STR_TO_DATE('01-08-2014', '%d-%m-%Y'), NULL);

/* Transaktion abschließen */
COMMIT;