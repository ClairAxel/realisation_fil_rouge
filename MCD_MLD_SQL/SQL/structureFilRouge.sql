CREATE TABLE droit
(
	id_droit INT PRIMARY KEY auto_increment NOT NULL,
    nom_droit VARCHAR(30)
)engine=InnoDB;

CREATE TABLE utilisateur
(
	id_util INT PRIMARY KEY auto_increment NOT NULL,
    Pseudo_util VARCHAR(20),
    Email_util VARCHAR(250),
    MDP_util varchar(100),
    id_droit INT
)engine=InnoDB;

CREATE TABLE commentaire
(
	id_commentaire INT PRIMARY KEY auto_increment NOT NULL,
    commentaire TEXT,
    date_commentaire DATETIME,
    id_util int
)engine=InnoDB;

CREATE TABLE MODS
(
	id_mods INT PRIMARY KEY auto_increment NOT NULL,
    titre_mods VARCHAR(200),
    date_poster DATE,
    date_dernier_maj DATE,
    description_mods TEXT,
    version_mods VARCHAR(50),
    id_jeux INT,
    id_util INT
)engine=InnoDB;

CREATE TABLE jeux
(
	id_jeux INT PRIMARY KEY auto_increment NOT NULL,
    nom_jeux VARCHAR(50)
)engine=InnoDB;

CREATE TABLE categorie
(
	id_categorie INT PRIMARY KEY auto_increment NOT NULL,
    nom_categorie VARCHAR(30)
)engine=InnoDB;

CREATE TABLE image
(
	id_image INT PRIMARY KEY auto_increment NOT NULL,
    nom_image VARCHAR(50),
    url_image VARCHAR(255)
)engine=InnoDB;

CREATE TABLE diposer
(
	id_image INT,
    id_mods INT,
    PRIMARY KEY(id_image, id_mods)
)engine=InnoDB;

CREATE TABLE platform
(
	id_platform INT PRIMARY KEY auto_increment NOT NULL,
    nom_plat VARCHAR(30)
)engine=InnoDB;

CREATE TABLE telecharger
(
	id_util INT,
    id_mods INT,
    PRIMARY KEY(id_util, id_mods)
)engine=InnoDB;

CREATE TABLE voter
(
	id_util INT,
    id_mods INT,
    PRIMARY KEY(id_util, id_mods)
)engine=InnoDB;

CREATE TABLE avoir
(
	id_categorie INT,
    id_mods INT,
    PRIMARY KEY(id_categorie, id_mods)
)engine=InnoDB;

CREATE TABLE appartenir
(
	id_platform INT,
    id_mods INT,
    PRIMARY KEY(id_platform, id_mods)
)engine=InnoDB;

ALTER TABLE utilisateur
ADD CONSTRAINT fk_posseder_droit
FOREIGN KEY(id_droit)
REFERENCES droit(id_droit);

ALTER TABLE commentaire
ADD CONSTRAINT fk_poster_util
FOREIGN KEY(id_util)
REFERENCES utilisateur(id_util);

ALTER TABLE voter
ADD CONSTRAINT fk_voter_utilisateur
FOREIGN KEY(id_util)
REFERENCES utilisateur(id_util);

ALTER TABLE voter
ADD CONSTRAINT fk_voter_mods
FOREIGN KEY(id_mods)
REFERENCES mods(id_mods);

ALTER TABLE telecharger
ADD CONSTRAINT fk_telecharger_util
FOREIGN KEY(id_util)
REFERENCES utilisateur(id_util);

ALTER TABLE telecharger
ADD CONSTRAINT fk_telecharger_mods
FOREIGN KEY(id_mods)
REFERENCES mods(id_mods);

ALTER TABLE mods
ADD CONSTRAINT fk_ratacher_util
FOREIGN KEY(id_util)
REFERENCES utilisateur(id_util);

ALTER TABLE mods
ADD CONSTRAINT fk_contenir_jeux
FOREIGN KEY(id_jeux)
REFERENCES jeux(id_jeux);

ALTER TABLE appartenir
ADD CONSTRAINT fk_appartenir_mods
FOREIGN KEY(id_mods)
REFERENCES mods(id_mods);

ALTER TABLE appartenir
ADD CONSTRAINT fk_appartenir_platform
FOREIGN KEY(id_platform)
REFERENCES platform(id_platform);

ALTER TABLE avoir
ADD CONSTRAINT fk_avoir_mods
FOREIGN KEY(id_mods)
REFERENCES mods(id_mods);

ALTER TABLE avoir 
ADD CONSTRAINT fk_avoir_categorie
FOREIGN KEY(id_categorie)
REFERENCES categorie(id_categorie);

ALTER TABLE diposer
ADD CONSTRAINT fk_disposer_image
FOREIGN KEY(id_image)
REFERENCES image(id_image);

ALTER TABLE diposer
ADD CONSTRAINT fk_disposer_mods
FOREIGN KEY(id_mods)
REFERENCES mods(id_mods);