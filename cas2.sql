-- Table pour les salariés
CREATE TABLE Salarie (
    Matricule INT PRIMARY KEY,
    Nom VARCHAR(50),
    Prenom VARCHAR(50),
    Date_naissance DATE
);

-- Table pour les formations
CREATE TABLE Formation (
    Formation_ID INT PRIMARY KEY,
    Titre VARCHAR(100),
    Description TEXT
);

-- Table pour les formateurs (qui sont des salariés)
CREATE TABLE Formateur (
    Matricule INT PRIMARY KEY,
    FOREIGN KEY (Matricule) REFERENCES Salarie(Matricule)
);

-- Table pour les participations aux formations
CREATE TABLE Participation (
    Matricule INT,
    Formation_ID INT,
    PRIMARY KEY (Matricule, Formation_ID),
    FOREIGN KEY (Matricule) REFERENCES Salarie(Matricule),
    FOREIGN KEY (Formation_ID) REFERENCES Formation(Formation_ID),
    CHECK (Matricule NOT IN (SELECT Matricule FROM Formateur))
);
