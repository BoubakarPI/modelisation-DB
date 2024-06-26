-- Table pour les départements
CREATE TABLE Departement (
    Departement_ID INT PRIMARY KEY,
    Nom VARCHAR(100)
);

-- Table pour les projets
CREATE TABLE Projet (
    Projet_ID INT PRIMARY KEY,
    Nom VARCHAR(100),
    Departement_ID INT,
    FOREIGN KEY (Departement_ID) REFERENCES Departement(Departement_ID)
);

-- Table pour les informaticiens
CREATE TABLE Informaticien (
    Informaticien_ID INT PRIMARY KEY,
    Nom VARCHAR(50),
    Prenom VARCHAR(50),
    Departement_ID INT,
    FOREIGN KEY (Departement_ID) REFERENCES Departement(Departement_ID)
);

-- Table pour les affectations aux projets
CREATE TABLE Affectation (
    Informaticien_ID INT,
    Projet_ID INT,
    PRIMARY KEY (Informaticien_ID, Projet_ID),
    FOREIGN KEY (Informaticien_ID) REFERENCES Informaticien(Informaticien_ID),
    FOREIGN KEY (Projet_ID) REFERENCES Projet(Projet_ID),
    CHECK (Departement_ID = (SELECT Departement_ID FROM Projet WHERE Projet.Projet_ID = Affectation.Projet_ID))
);
