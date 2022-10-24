-- 3
-- a
SELECT AVG(Guarda.Valutazione) FROM Episodio
INNER JOIN SerieTV
ON Episodio.IDSerie = SerieTV.ID
INNER JOIN Guarda
ON Guarda.IDSerie = SerieTV.ID
WHERE SerieTV.Nome = 'Dahmer'
AND Episodio.Titolo = 'La scatola del bravo ragazzo';

-- modo alternativo
SELECT AVG(Guarda.Valutazione) FROM Guarda
WHERE Guarda.IDEpisodio = (
  SELECT ID FROM Episodio
  WHERE Nome = 'La scatola del bravo ragazzo'
  AND IDSerie = (
    SELECT ID FROM SerieTV
    WHERE Nome = 'Dahmer'
  )
);


-- b
SELECT SerieTV.Nome, COUNT(*) AS Episodi FROM SerieTV
INNER JOIN SerieTV
ON SerieTV.ID = Episodio.IDSerie
GROUP BY SerieTV.ID, SerieTV.Nome;


-- c
SELECT Utente.Nome, Utente.Cognome, COUNT(*) AS Episodi FROM Visione
INNER JOIN Utente
ON Visione.IDUtente = Utente.ID
GROUP BY Visione.IDUtente, Utente.Nome, Utente.Cognome
HAVING COUNT(*) > 100;
-- atro
ORDER BY Episodi DESC;


-- d



-- e
SELECT Utente.id, Episodio.Serie FROM Utente, Serie
INNER JOIN Visualizza
ON Utente.ID = Visualizza.IDUtente
INNER JOIN Episodio
ON Episodio.ID = Visualizza.IDEpisodio
INNER JOIN Serie
ON Serie.ID = Episodio.IDSerie
WHERE Serie.Nome = 'Dahmer'
AND DATEDIFF(DAY, Visualizza.Date, DATEADD(DAY, -30, GETDATE())) > 0
-- AND DATEDIFF(DAY, Visualizza.Date, GETDATE()) < 30


-- 4
-- a
SELECT * FROM Serie
INNER JOIN APpartiene
ON Serie.ID = Appartiene.IDSerie
INNER JOIN Genere
ON Genere.ID = Appartiene.IDGenere
WHERE Genere.Nome = 'Drammatico' OR Genere.Nome = 'Fantascienza'
-- WHERE Genere.Nome IN ('Drammatico', 'Fantascienza')
ORDER BY Genere.Nome DESC, Serie.Nome


-- b (a)
SELECT Episodio.Titolo, Serie.Nome FROM Attore
INNER JOIN Recita
ON Attore.ID = Recita.IDAttore
INNER JOIN Episodio
ON Episodio.ID = Recita.IDEpisodio
INNER JOIN Serie
ON Serie.ID = Episodio.IDSerie
WHERE Attore.Nome = 'Flavio' AND Attore.Cognome = 'Nedina'


-- b (b)
SELECT * FROM Serie
WHERE Nome LIKE 'THE %'


-- c
SELECT COUNT(*) AS NumeroUtenti FROM Utente
Inner JOIN Visualizza
ON Utente.ID = Visualizza.IDUtente
WHERE Visualizza.Data BETWEEN '2022-09-01' AND '2022-09-30'


-- 5
-- a
CREATE TABLE Genere (
  ID INT IDENTITY (0,1) PRIMARY KEY,
  Nome VARCHAR(50)
)


-- b
CREATE TABLE Appartiene (
  IDSerie INT FOREIGN KEY REFERENCES Serie(ID),
  IDGenere INT FOREIGN KEY REFERENCES Genere(ID),
)


-- c
ALTER TABLE Utente
ADD Telefono VARCHAR(20)


-- d
ALTER TABLE Utente
DROP COLUMN Sesso


-- e
DELETE FROM Utente
WHERE Utente.AbbEnd < GETDATE();


-- f
ALTER TABLE Valutazione
ALTER COLUMN Voto DECIMAL(3, 1);

UPDATE Valutazione
SET Voto = Voto / 2
WHERE Voto > 1;