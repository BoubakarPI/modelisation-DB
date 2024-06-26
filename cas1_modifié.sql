-- Table pour les propriétaires généraux
CREATE TABLE Proprietaire (
    NumP INT PRIMARY KEY,
    TypeN VARCHAR(20)
);

-- Table pour les particuliers
CREATE TABLE Particulier
(
    idP INT PRIMARY KEY,
    Nom VARCHAR(50),
    Prenom VARCHAR(50),
    Date_naissance DATE,
    Rue VARCHAR(100),
    CP VARCHAR(10),
    Ville VARCHAR(50),
    Tel VARCHAR(15),
    idType INTEGER,
    FOREIGN KEY
    (idType) REFERENCES Proprietaire
    (NumP)
);

-- Table pour les sociétés
CREATE TABLE Societe
(
    idS INT PRIMARY KEY,
    Raison_sociale VARCHAR(100),
    Fax VARCHAR(15),
    Rue VARCHAR(100),
    CP VARCHAR(10),
    Ville VARCHAR(50),
    Tel VARCHAR(15),
    idType INTEGER,
    FOREIGN KEY (idType) REFERENCES Proprietaire(NumP)
);
