
-- Creazione delle tabelle
CREATE TABLE italy.regions (
    id INT PRIMARY KEY IDENTITY(0, 1),
    name VARCHAR(255),
    capoluogo VARCHAR(255)
);

CREATE TABLE italy.regions_borders (
    id_region int FOREIGN KEY REFERENCES italy.regions(id),
    id_border int FOREIGN KEY REFERENCES italy.regions(id),
);


-- Popolazione del database
INSERT INTO italy.regions (name, capoluogo) VALUES
('Abruzzo', 'L''Aquila'),
('Aosta Valley', 'Aosta'),
('Apulia', 'Bari'),
('Basilicata', 'Potenza'),
('Calabria', 'Catanzaro'),
('Campania', 'Naples'),
('Emilia-Romagna', 'Bologna'),
('Friuli-Venezia Giulia', 'Trieste'),
('Lazio', 'Rome'),
('Liguria', 'Genoa'),
('Lombardy', 'Milan'),
('Marche', 'Ancona'),
('Molise', 'Campobasso'),
('Piedmont', 'Turin'),
('Sardinia', 'Cagliari'),
('Sicily', 'Palermo'),
('Trentino-Alto Adige/Südtirol', 'Trento/Bolzano'),
('Tuscany', 'Florence'),
('Umbria', 'Perugia'),
('Veneto', 'Venice');

INSERT INTO italy.regions_borders (id_region, id_border)VALUES
(13, 7),
(13, 14),
(15, 3),
(15, 4),
(3, 15),
(3, 19),
(4, 15),
(4, 20),
(4, 13),
(8, 5),
(8, 9),
(8, 12),
(8, 16),
(6, 17),
(6, 18),
(7, 13),
(7, 4),
(7, 10),
(7, 16),
(10, 8),
(10, 12),
(11, 7),
(11, 16),
(14, 13),
(16, 8),
(16, 5),
(16, 12),
(21, 22),
(21, 3),
(22, 21),
(22, 18),
(23, 4),
(23, 21);


-- Query
-- 1
SELECT name FROM italy.regions
INNER JOIN italy.regions_borders
ON italy.regions.id = italy.regions_borders.id_region
WHERE italy.regions_borders.id_border = 10;

-- 2
SELECT name FROM italy.regions
INNER JOIN italy.regions_borders
ON italy.regions.id = italy.regions_borders.id_region
WHERE id NOT IN (
    SELECT id_region FROM italy.regions_borders
);

-- 3
SELECT count(*) FROM italy.regions
INNER JOIN italy.regions_borders
ON italy.regions.id = italy.regions_borders.id_region
GROUP BY id
HAVING id IN (
    SELECT id_region
    FROM italy.regions_borders
    GROUP BY italy.regions_borders.id_region
    HAVING COUNT(*) = 1
);


-- Modifica del database e popolazione dei dati mancanti
ALTER TABLE italy.regions 
ADD surface INT;

UPDATE italy.regions SET surface = 
   CASE 
      WHEN name = 'Abruzzo' THEN 10831
      WHEN name = 'Basilicata' THEN 9997
      WHEN name = 'Calabria' THEN 15090
      WHEN name = 'Campania' THEN 13565
      WHEN name = 'Emilia-Romagna' THEN 22454
      WHEN name = 'Friuli-Venezia Giulia' THEN 7855
      WHEN name = 'Lazio' THEN 17233
      WHEN name = 'Liguria' THEN 5423
      WHEN name = 'Lombardy' THEN 23860
      WHEN name = 'Marche' THEN 9366
      WHEN name = 'Molise' THEN 4439
      WHEN name = 'Piedmont' THEN 25374
      WHEN name = 'Apulia' THEN 19540
      WHEN name = 'Sardinia' THEN 24090
      WHEN name = 'Sicily' THEN 25708
      WHEN name = 'Tuscany' THEN 22999
      WHEN name = 'Trentino-Alto Adige/Südtirol' THEN 13605
      WHEN name = 'Umbria' THEN 8464
      WHEN name = 'Aosta Valley' THEN 3260
      WHEN name = 'Veneto' THEN 18302
      ELSE 0
   END;


-- 4
SELECT name as Regione FROM italy.regions
WHERE id = (
    SELECT MAX(surface) FROM italy.regions
);

-- 5 
SELECT SUM(surface) FROM italy.regions;

-- 6
SELECT italy.regions.surface / SUM(italy.regions.surface) OVER() * 100 as percentage FROM italy.regions
ORDER BY percentage DESC;


-- ALtro
SELECT * FROM italy.regions;
SELECT * FROM italy.regions_borders;