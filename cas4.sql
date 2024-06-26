-- Table pour les écritures comptables
CREATE TABLE EcritureComptable (
    Ecriture_ID INT PRIMARY KEY,
    Date DATE
);

-- Table pour les lignes d'écriture
CREATE TABLE LigneEcriture (
    Ligne_ID INT PRIMARY KEY,
    Ecriture_ID INT,
    Compte_Num INT,
    Montant DECIMAL(10, 2),
    Type ENUM('Debit', 'Credit'),
    FOREIGN KEY (Ecriture_ID) REFERENCES EcritureComptable(Ecriture_ID),
    CHECK (Montant >= 0)
);

-- Trigger pour empêcher la modification des lignes d'écriture
DELIMITER $$
CREATE TRIGGER PreventModification BEFORE UPDATE ON LigneEcriture
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Modification des lignes d\'écriture interdite';
END$$
DELIMITER ;

-- Trigger pour empêcher la suppression des lignes d'écriture
DELIMITER $$
CREATE TRIGGER PreventDeletion BEFORE DELETE ON LigneEcriture
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Suppression des lignes d\'écriture interdite';
END$$
DELIMITER ;
