## Creare la tabella
```sql
CREATE TABLE Region (
    Id INT PRIMARY KEY IDENTITY(0, 1),
    Name VARCHAR(30),
    Average_Income DECIMAL(10, 2),
)

CREATE TABLE Province (
    Id INT PRIMARY KEY IDENTITY(0, 1),
    Name VARCHAR(40),
    Extension INT CHECK (Extension > 0), --km^2 greater than 0
    Id_Region INT FOREIGN KEY REFERENCES Region(Id)
)
```

## Popolare le tabelle
```sql
INSERT INTO regioni (Name, Average_Income)
VALUES
    ('Abruzzo', 20000),
    ('Basilicata', 25000),
    ('Calabria', 22000),
    ('Campania', 23000),
    ('Emilia-Romagna', 30000),
    ('Friuli-Venezia Giulia', 35000),
    ('Lazio', 28000),
    ('Liguria', 32000),
    ('Lombardia', 40000),
    ('Marche', 27000),
    ('Molise', 21000),
    ('Piemonte', 35000),
    ('Puglia', 24000),
    ('Sardegna', 26000),
    ('Sicilia', 22000),
    ('Toscana', 32000),
    ('Trentino-Alto Adige/Südtirol', 38000),
    ('Umbria', 29000),
    ("Valle d'Aosta/Vallée d'Aoste", 40000),
    ('Veneto', 33000);

-- Province della Lombardia
INSERT INTO Province (Name, Extension, Id_Region)
VALUES
    ('Milano', 1572, 8),
    ('Monza e della Brianza', 405, 8),
    ('Bergamo', 2723, 8),
    ('Brescia', 4784, 8),
    ('Como', 1287, 8),
    ('Cremona', 1740, 8),
    ('Lecco', 816, 8),
    ('Lodi', 782, 8),
    ('Mantova', 2241, 8),
    ('Pavia', 2966, 8),
    ('Sondrio', 3485, 8),
    ('Varese', 1196, 8);
    -- (SELECT Id FROM Region WHERE Name = 'Lombardia')

INSERT INTO Province (Name, Extension, Id_Region)
VALUES
    ('Cosenza', 6532, 2),
    ('Catanzaro', 2366, 2),
    ('Reggio Calabria', 3159, 2),
    ('Crotone', 1745, 2),
    ('Vibo Valentia', 1398, 2);
    -- (SELECT Id FROM Region WHERE Name = 'Calabria')
```

## Modificare le tabelle
```sql
-- ALTER TABLE
ALTER TABLE Province
ADD Typical_Dessert VARCHATR(40)

ALTER TABLE Region
ADD Main_City INT FOREIGN KEY REFERENCES Province(Id)

-- ALTER COLUMN
ALTER TABLE Province
ALTER COLUMN Typical_Dessert VARCHATR(50)

-- DROP COLUMN
ALTER TABLE Province
DROP COLUMN Typical_Dessert

-- DROP TABLE
DROP TABLE Province
DROP TABLE Province
```

## Modificare i dati
```sql
-- UPDATE
UPDATE Province
SET Extension = 2341
WHERE Id = 8 -- (SELECT Id FROM Province WHERE Name = 'Mantova')

UPDATE Province
SET Typical_Dessert = 'Panettone'
WHERE Name = 'Milano' -- ID = 0

-- DELETE
DELETE FROM Province
WHERE Name = 'Milano' 
```