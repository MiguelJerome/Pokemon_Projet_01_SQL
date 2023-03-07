-- Regions table
INSERT INTO Regions(Nom_region, Nom_ville)
VALUES
('Kanto', 'Pallet Town'),
('Johto', 'New Bark Town'),
('Hoenn', 'Littleroot Town'),
('Sinnoh', 'Twinleaf Town'),
('Unova', 'Nuvema Town'),
('Kalos', 'Vaniville Town'),
('Alola', 'Iki Town'),
('Galar', 'Postwick');

-- Generations table
INSERT INTO Generations(Gen_number, Nom_region)
VALUES
(1, 'Kanto'),
(2, 'Johto'),
(3, 'Hoenn'),
(4, 'Sinnoh'),
(5, 'Unova'),
(6, 'Kalos'),
(7, 'Alola'),
(8, 'Galar');

-- Pokemon table
INSERT INTO Pokemon(Pokemon_number, Nom_Pokemon, Type_1, Type_2, Gen_number, HP, Attack, Defense, Sp_Attack, Sp_Defense, Speed)
VALUES
(1, 'Bulbasaur', 'Grass', 'Poison', 1, 45, 49, 49, 65, 65, 45),
(2, 'Charmander', 'Fire', NULL, 1, 39, 52, 43, 60, 50, 65),
(3, 'Squirtle', 'Water', NULL, 1, 44, 48, 65, 50, 64, 43),
(4, 'Chikorita', 'Grass', NULL, 2, 45, 49, 65, 49, 65, 45),
(5, 'Cyndaquil', 'Fire', NULL, 2, 39, 52, 43, 60, 50, 65),
(6, 'Totodile', 'Water', NULL, 2, 50, 65, 64, 44, 48, 43),
(7, 'Treecko', 'Grass', NULL, 3, 40, 45, 35, 65, 55, 70),
(8, 'Torchic', 'Fire', NULL, 3, 45, 60, 40, 70, 50, 45),
(9, 'Mudkip', 'Water', NULL, 3, 50, 70, 50, 50, 50, 40),
(10, 'Turtwig', 'Grass', NULL, 4, 55, 68, 64, 45, 55, 31);

-- Type table
INSERT INTO Type(Pokemon_number, Type_1, Type_2)
VALUES
(1, 'Grass', 'Poison'),
(2, 'Fire', NULL),
(3, 'Water', NULL),
(4, 'Grass', NULL),
(5, 'Fire', NULL),
(6, 'Water', NULL),
(7, 'Grass', NULL),
(8, 'Fire', NULL),
(9, 'Water', NULL),
(10, 'Grass', NULL);