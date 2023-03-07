	CREATE DATABASE Pokemon2
	USE Pokemon2


	CREATE TABLE Type(
		Type_1 NVARCHAR(8) NOT NULL,
		Type_2 NVARCHAR(8),
	);

	CREATE TABLE Regions(
        Nom_region NVARCHAR(8) NOT NULL PRIMARY KEY,
		Nom_ville NVARCHAR(30) NOT NULL
	);

	CREATE TABLE Generations(
        Gen_number INT NOT NULL PRIMARY KEY,
        Nom_region NVARCHAR(8) NOT NULL,
		FOREIGN KEY(Nom_region) REFERENCES Regions
    );

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
		FOREIGN KEY(Gen_number) REFERENCES Generations,
	);

	CREATE TABLE Pokedex(
		Nom_du_jeu NVARCHAR(255) NOT NULL PRIMARY KEY,
		Gen_number INT NOT NULL,
		Nom_Pokemon NVARCHAR(255) NOT NULL,
		Pokemon_number INT NOT NULL,
		FOREIGN KEY(Gen_number) REFERENCES Generations,
		FOREIGN KEY(Pokemon_number) REFERENCES Pokemon
	);

	CREATE TABLE Champions(
		Nom NVARCHAR(15) NOT NULL PRIMARY KEY,
		Team_type NVARCHAR(15) NOT NULL,
		Nom_du_jeu NVARCHAR(255) NOT NULL,
        Nom_region NVARCHAR(8) NOT NULL,
		FOREIGN KEY(Nom_region) REFERENCES Regions,
		FOREIGN KEY(Nom_du_jeu) REFERENCES Pokedex
	);

	CREATE TABLE Dresseur(
		Nom NVARCHAR(15) NOT NULL PRIMARY KEY,
		Gen_number INT NOT NULL,
		Gender NVARCHAR(15) NOT NULL,
		Team_size TINYINT NOT NULL, /*Max 6*/
		FOREIGN KEY(Nom) REFERENCES Champions,
		FOREIGN KEY(Gen_number) REFERENCES Generations,
	);

	CREATE TABLE Pokemon_Dresseur(
		Nom_dresseur NVARCHAR(15) NOT NULL,
		Pokemon_number INT NOT NULL,
		Pokemon_level TINYINT,
		FOREIGN KEY(Nom_dresseur) REFERENCES Dresseur,
		FOREIGN KEY(Pokemon_number) REFERENCES Pokemon,
	);

	CREATE TABLE Capacite(
		Nom NVARCHAR(15) NOT NULL PRIMARY KEY,
		Lev_unlock INT NOT NULL,
		Power_cap INT,
		Accuracy INT,
		PP INT NOT NULL,
		Category NVARCHAR(12) NOT NULL,
		Type_cap NVARCHAR(8) NOT NULL,
	);

	CREATE TABLE Pokemon_Capacite(
		Pokemon_number INT NOT NULL,
		Nom NVARCHAR(15) NOT NULL,
		Level INT NOT NULL,
		FOREIGN KEY(Pokemon_number) REFERENCES Pokemon,
		FOREIGN KEY(Nom) REFERENCES Capacite,
	);