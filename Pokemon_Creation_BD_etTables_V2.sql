IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'Pokemon2') 
BEGIN
    CREATE DATABASE Pokemon2;
END

USE Pokemon2;

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Regions' AND type = 'U')
BEGIN
    CREATE TABLE Regions(
        Nom_region NVARCHAR(8) NOT NULL PRIMARY KEY,
        Nom_ville NVARCHAR(30) NOT NULL,
		CONSTRAINT UC_Regions UNIQUE (Nom_region)
    );
END

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Generations' AND type = 'U')
BEGIN
    CREATE TABLE Generations(
        Gen_number INT NOT NULL PRIMARY KEY,
        Nom_region NVARCHAR(8) NOT NULL,
		CONSTRAINT UC_Generations UNIQUE (Gen_number),
        FOREIGN KEY(Nom_region) REFERENCES Regions
    );
END




IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Pokemon' AND type = 'U')
BEGIN
    CREATE TABLE Pokemon(
        Pokemon_number INT NOT NULL PRIMARY KEY,
        Nom_Pokemon NVARCHAR(255) NOT NULL,
        Type_1 NVARCHAR(8) NOT NULL,
        Type_2 NVARCHAR(8),
        Gen_number INT NOT NULL,
        HP INT NOT NULL,
        Attack INT NOT NULL,
        Defense INT NOT NULL,
        Sp_Attack INT NOT NULL,
        Sp_Defense INT NOT NULL,
        Speed INT NOT NULL,
		CONSTRAINT UC_Pokemon UNIQUE (Pokemon_number),
        FOREIGN KEY(Gen_number) REFERENCES Generations
    );
END

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Type' AND type = 'U')
BEGIN
	CREATE TABLE Type(
		Pokemon_number INT NOT NULL,
		Type_1 NVARCHAR(8) NOT NULL,
		Type_2 NVARCHAR(8),
        CONSTRAINT PK_Pokemon_Type PRIMARY KEY (Pokemon_number),
        FOREIGN KEY(Pokemon_number) REFERENCES Pokemon(Pokemon_number)
	);
END

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Pokedex' AND type = 'U')
BEGIN
    CREATE TABLE Pokedex(
        Nom_du_jeu NVARCHAR(255) NOT NULL PRIMARY KEY,
        Gen_number INT NOT NULL,
        Nom_Pokemon NVARCHAR(255) NOT NULL,
        Pokemon_number INT NOT NULL,
		CONSTRAINT UC_Pokedex UNIQUE (Nom_du_jeu),
        FOREIGN KEY(Gen_number) REFERENCES Generations,
        FOREIGN KEY(Pokemon_number) REFERENCES Pokemon
    );
END

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Champions' AND type = 'U')
BEGIN
    CREATE TABLE Champions(
        Nom NVARCHAR(15) NOT NULL PRIMARY KEY,
        Team_type NVARCHAR(15) NOT NULL,
        Nom_du_jeu NVARCHAR(255) NOT NULL,
        Nom_region NVARCHAR(8) NOT NULL,
		CONSTRAINT UC_Champions UNIQUE (Nom),
        FOREIGN KEY(Nom_region) REFERENCES Regions,
        FOREIGN KEY(Nom_du_jeu) REFERENCES Pokedex
    );
END

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Dresseur' AND type = 'U')
BEGIN
    CREATE TABLE Dresseur(
        Nom NVARCHAR(15) NOT NULL PRIMARY KEY,
        Gen_number INT NOT NULL,
        Gender NVARCHAR(15) NOT NULL,
        Team_size TINYINT NOT NULL, /*Max 6*/
		CONSTRAINT UC_Dresseur UNIQUE (Nom),
        FOREIGN KEY(Nom) REFERENCES Champions,
        FOREIGN KEY(Gen_number) REFERENCES Generations
    );
END

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Pokemon_Dresseur' AND type = 'U')
BEGIN
    CREATE TABLE Pokemon_Dresseur(
		Nom_dresseur NVARCHAR(15) NOT NULL,
		Pokemon_number INT NOT NULL,
		Pokemon_level TINYINT,
		CONSTRAINT UC_Pokemon_Dresseur UNIQUE (Nom_dresseur),
		FOREIGN KEY(Nom_dresseur) REFERENCES Dresseur,
		FOREIGN KEY(Pokemon_number) REFERENCES Pokemon
	);
END

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Capacite' AND type = 'U')
BEGIN
	CREATE TABLE Capacite(
		Nom NVARCHAR(15) NOT NULL PRIMARY KEY,
		Lev_unlock INT NOT NULL,
		Power_cap INT,
		Accuracy INT,
		PP INT NOT NULL,
		CONSTRAINT UC_Capacite UNIQUE (Nom),
		Category NVARCHAR(12) NOT NULL,
		Type_cap NVARCHAR(8) NOT NULL
	);
END

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Pokemon_Capacite' AND type = 'U')
BEGIN
	CREATE TABLE Pokemon_Capacite(
		Pokemon_number INT NOT NULL,
		Nom NVARCHAR(15) NOT NULL,
		Level INT NOT NULL,
		CONSTRAINT UC_Pokemon_Capacite UNIQUE (Pokemon_number, Nom),
		FOREIGN KEY(Pokemon_number) REFERENCES Pokemon,
		FOREIGN KEY(Nom) REFERENCES Capacite
	);
END