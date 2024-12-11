/*================================================*/
/* Datenbanken II                                 */
/* Vereinsdatenbank                               */
/* Schemen  erzeugen                              */
/*================================================*/

/* Tabelle: Anlass */
CREATE TABLE Anlass (
    AnlaID INT NOT NULL,
    Bezeichner VARCHAR(20) NOT NULL,
    Ort VARCHAR(20),
    Datum DATE NOT NULL,
    Kosten DECIMAL(8,2),
    OrgID INT NOT NULL,
    PRIMARY KEY (AnlaID),
    CONSTRAINT chk_kosten CHECK (Kosten IS NULL OR Kosten >= 0)
);

/* Tabelle: Funktion */
CREATE TABLE Funktion (
    FunkID INT NOT NULL,
    Bezeichner VARCHAR(20) NOT NULL,
    PRIMARY KEY (FunkID)
);


/* Tabelle: Funktionsbesetzung */
CREATE TABLE Funktionsbesetzung (
    Antritt DATE NOT NULL,
    Ruecktritt DATE,
    FunkID INT NOT NULL,
    PersID INT NOT NULL,
    PRIMARY KEY (FunkID, PersID, Antritt),
    CONSTRAINT chk_ruecktritt CHECK (Antritt <= Ruecktritt OR Ruecktritt IS NULL)
);


/* Tabelle: Person */
CREATE TABLE Person (
    PersID INT NOT NULL,
    Name VARCHAR(20) NOT NULL,
    Vorname VARCHAR(15) NOT NULL,
    Strasse_Nr VARCHAR(20) NOT NULL,
    PLZ CHAR(4) NOT NULL,
    Ort VARCHAR(20) NOT NULL,
    Bezahlt CHAR(1) NOT NULL,
    Bemerkungen VARCHAR(25),
    Eintritt DATE,
    Austritt DATE,
    StatID INT NOT NULL,
    MentorID INT,
    PRIMARY KEY (PersID),
    CONSTRAINT chk_austritt CHECK ((Eintritt <= Austritt OR Austritt IS NULL) OR (Eintritt IS NULL AND Austritt IS NULL))
);

/* Tabelle: Spende */
CREATE TABLE Spende (
    SpenID INT NOT NULL,
    Bezeichner VARCHAR(20),
    Datum DATE DEFAULT CURRENT_DATE NOT NULL,
    Betrag DECIMAL(8,2) NOT NULL,
    SponID INT NOT NULL,
    AnlaID INT,
    PRIMARY KEY (SpenID, SponID)
);

/* Tabelle: Sponsor */
CREATE TABLE Sponsor (
    SponID INT NOT NULL,
    Name VARCHAR(20) NOT NULL,
    Strasse_Nr VARCHAR(20) NOT NULL,
    PLZ CHAR(4) NOT NULL,
    Ort VARCHAR(20) NOT NULL,
    Spendentotal DECIMAL(8,2) NOT NULL,
    PRIMARY KEY (SponID)
);

/* Tabelle: Sponsorenkontakt */
CREATE TABLE Sponsorenkontakt (
    PersID INT NOT NULL,
    SponID INT NOT NULL,
    PRIMARY KEY (PersID, SponID)
);


/* Tabelle: Status */
CREATE TABLE Status (
    StatID INT NOT NULL,
    Bezeichner VARCHAR(20) NOT NULL,
    Beitrag DECIMAL(5),
    PRIMARY KEY (StatID),
    CONSTRAINT chk_beitrag_status CHECK (Beitrag IS NULL OR Beitrag >= 0)
);

/* Tabelle: Teilnehmer */
CREATE TABLE Teilnehmer (
    PersID INT NOT NULL,
    AnlaID INT NOT NULL,
    PRIMARY KEY (PersID, AnlaID)
);

/* Fremdschlüssel */
ALTER TABLE Anlass ADD CONSTRAINT Anlass_Person_FK FOREIGN KEY (OrgID) REFERENCES Person (PersID);
ALTER TABLE Sponsorenkontakt ADD CONSTRAINT FK_SPONK_PERSON FOREIGN KEY (PersID) REFERENCES Person (PersID);
ALTER TABLE Sponsorenkontakt ADD CONSTRAINT FK_SPONK_SPONSOR FOREIGN KEY (SponID) REFERENCES Sponsor (SponID);
ALTER TABLE Teilnehmer ADD CONSTRAINT FK_TEILN_ANLASS FOREIGN KEY (AnlaID) REFERENCES Anlass (AnlaID);
ALTER TABLE Teilnehmer ADD CONSTRAINT FK_TEILN_PERSON FOREIGN KEY (PersID) REFERENCES Person (PersID);
ALTER TABLE Funktionsbesetzung ADD CONSTRAINT Funktionsbesetzung_Funktion_FK FOREIGN KEY (FunkID) REFERENCES Funktion (FunkID);
ALTER TABLE Funktionsbesetzung ADD CONSTRAINT Funktionsbesetzung_Person_FK FOREIGN KEY (PersID) REFERENCES Person (PersID);
ALTER TABLE Person ADD CONSTRAINT Person_Person_FK FOREIGN KEY (MentorID) REFERENCES Person (PersID);
ALTER TABLE Person ADD CONSTRAINT Person_Status_FK FOREIGN KEY (StatID) REFERENCES Status (StatID);
ALTER TABLE Spende ADD CONSTRAINT Spende_Anlass_FK FOREIGN KEY (AnlaID) REFERENCES Anlass (AnlaID);
ALTER TABLE Spende ADD CONSTRAINT Spende_Sponsor_FK FOREIGN KEY (SponID) REFERENCES Sponsor (SponID);