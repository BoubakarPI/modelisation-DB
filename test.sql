CREATE TABLE CLIENT 
(
     CliId                INT                  NOT NULL
   , CliNom               VARCHAR(48)          NOT NULL
   , CliSiret             CHAR(14)             NOT NULL
  , CONSTRAINT CLIENT_PK PRIMARY KEY  (CliId)
  , CONSTRAINT CLIENT_AK1 UNIQUE (CliSiret)
) ;
CREATE TABLE ARTICLE 
(
     ArtId                INT                  NOT NULL
   , ArtNom               VARCHAR(48)          NOT NULL 
   , PrixHT               DECIMAL(16)          NOT NULL
 , CONSTRAINT ARTICLE_PK PRIMARY KEY (ArtId)
) ;
CREATE TABLE CAMION 
(
     CamionId             INT                  NOT NULL
   , CamImmat             VARCHAR(14)          NOT NULL
   , Camstatut            CHAR(2)              NOT NULL
 , CONSTRAINT CAMION_PK PRIMARY KEY (CamionId)
 , CONSTRAINT CAMION_AK1 UNIQUE (CamImmat)
) ;
CREATE TABLE COMMANDE 
(
     CliId                INT                  NOT NULL
   , CdeId                SMALLINT             NOT NULL
   , CdeNo                VARCHAR(12)          NOT NULL
   , CdeDate              CHAR(10)             NOT NULL
   , CdeStatut            CHAR(2)              NOT NULL
 , CONSTRAINT COMMANDE_PK PRIMARY KEY (CliId, CdeId)
 , CONSTRAINT COMMANDE_AK1 UNIQUE (CdeNo)
 , CONSTRAINT COMMANDE_CLIENT_FK FOREIGN KEY (CliId)
      REFERENCES CLIENT (CliId) ON DELETE CASCADE
) ;
CREATE TABLE LIGNECDE 
(
     CliId                INT                  NOT NULL
   , CdeId                SMALLINT             NOT NULL
   , LigneId              SMALLINT             NOT NULL
   , ArtId                INT                  NOT NULL
   , Quantite             INT                  NOT NULL
 , CONSTRAINT LIGNECDE_PK PRIMARY KEY (CliId, CdeId, LigneId)
 , CONSTRAINT LIGNECDE_CDE_FK FOREIGN KEY (CliId, CdeId)
      REFERENCES COMMANDE (CliId, CdeId) ON DELETE CASCADE
 , CONSTRAINT LIGNECDE_ART_FK FOREIGN KEY (ArtId)
      REFERENCES ARTICLE (ArtId)
) ;
CREATE TABLE ENGAGEMENT 
(
     CliId                INT                  NOT NULL
   , CdeId                SMALLINT             NOT NULL
   , LigneId              SMALLINT             NOT NULL
   , EngId                SMALLINT             NOT NULL
   , EngType              CHAR(2)              NOT NULL
   , EngDate              CHAR(10)             NOT NULL
   , Quantite             INT                  NOT NULL
, CONSTRAINT ENGAGEMENT_PK PRIMARY KEY (CliId, CdeId, LigneId, EngId)
, CONSTRAINT ENGAGEMENT_LIGNE_FK FOREIGN KEY (CliId, CdeId, LigneId)
      REFERENCES LIGNECDE (CliId, CdeId, LigneId) ON DELETE CASCADE
) ;
CREATE TABLE LIVRAISON 
(
     CliId                INT                  NOT NULL
   , CdeId                SMALLINT             NOT NULL
   , LigneId              SMALLINT             NOT NULL
   , EngId                SMALLINT             NOT NULL
   , LivrId               SMALLINT             NOT NULL
   , LivrDate             CHAR(10)             NOT NULL
   , LivrStatut           CHAR(2)              NOT NULL
   , Quantite             INT                  NOT NULL
   , CamionId             INT                  NOT NULL
   , CONSTRAINT LIVRAISON_PK PRIMARY KEY (CliId, CdeId, LigneId, EngId, LivrId)
   , CONSTRAINT LIVRAISON_ENG_FK FOREIGN KEY (CliId, CdeId, LigneId, EngId)
         REFERENCES ENGAGEMENT (CliId, CdeId, LigneId, EngId) ON DELETE CASCADE
   , CONSTRAINT LIVRAISON_CAMION_FK FOREIGN KEY (CamionId)
      REFERENCES CAMION (CamionId)
) ;