1. progettare il modello ER per questa situazione
2. scrivere il modello logico corrispondente al modello ER proposto
3. creare le tabelle con le varie primary key ma senza le foreign key e permettendo che tutti i campi possano essere `NULL`
    ```sql
    CREATE TABLE Ricette (
      ID INT PRIMARY KEY IDENTITY(0,1),
      Nome VARCHAR(255),
      Procedimento TEXT,
      Difficolta VARCHAR(16),
      TempoCottura INT,
      TempoProcedimento INT
    );

    CREATE TABLE Ingrediente (
      ID INT PRIMARY KEY IDENTITY(0,1),
      Nome VARCHAR(255)
    );

    CREATE TABLE Rivista (
      ID INT PRIMARY KEY IDENTITY(0,1),
      Anno INT,
      Mese INT,
    );

    CREATE TABLE Ricette_Ingrediente (
      Quantita DECIMAL(6, 2),
      UnitaMisura VARCHAR(8)
    );

    CREATE TABLE Pubbl (
      Pagina INT
    );
    ```
4. modificare le tabelle appena create aggiungendo le foreign key necessarie
    ```sql
    ALTER TABLE Ricette_Ingrediente
    ADD IDric INT FOREIGN KEY REFERENCES Ricette(ID), IDing INT FOREIGN KEY REFERENCES Ingrediente(ID);

    ALTER TABLE Pubbl
    ADD IDric INT FOREIGN KEY REFERENCES Ricette(ID), IDriv INT FOREIGN KEY REFERENCES Rivista(ID);
    ```
5. aggiungere le informazioni riguardanti le calorie della ricetta
    ```sql
    ALTER TABLE Ricette
    ADD Calorie INT
    ```
6. inserire le seguenti informazioni presenti nella rivista pubblicata nel febbraio del 2019:
    1. a pagina 34 è stata pubblicata la
    ricetta della foto iniziale
    2. a pagina 55 della stessa rivista è stata pubblicata la ricetta “Dentice al forno in crosta di mandorle”
    ```sql
    -- a
    INSERT INTO Rivista VALUES (2019, 2);

    INSERT INTO Ricette VALUES ('Filetto di storione in salsa di gamberi', 'Il fantastico procedimento', 'Media', 60, 35, 570);

    INSERT INTO Ingrediente VALUES ('Storione');
    INSERT INTO Ingrediente VALUES ('Gamberoni');

    INSERT INTO Ricette_Ingrediente (IDric, IDing, Quantita, UnitaMisura) VALUES (0, 0, 800, 'g');
    INSERT INTO Ricette_Ingrediente (IDric, IDing, Quantita, UnitaMisura) VALUES (0, 1, 800, 'g');

    INSERT INTO Pubbl (IDric, IDriv, Pagina) VALUES (0, 0, 34);

    -- b
    INSERT INTO Ricette VALUES ('Dentice al forno in crosta di mandorle', 'Il fantastico procedimento', 'Facile', 25, 25, 490);

    INSERT INTO Ingrediente VALUES ('Dentice');
    INSERT INTO Ingrediente VALUES ('Radicchio');

    INSERT INTO Ricette_Ingrediente (IDric, IDing, Quantita, UnitaMisura) VALUES (1, 2, 1.2, 'kg');
    INSERT INTO Ricette_Ingrediente (IDric, IDing, Quantita, UnitaMisura) VALUES (1, 3, 2, 'cespi');

    INSERT INTO Pubbl (IDric, IDriv, Pagina) VALUES (1, 0, 55);


    -- altri Ingredienti
    INSERT INTO Ingrediente(Nome) VALUES ('Patate Colorate');
    INSERT INTO Ingrediente(Nome) VALUES ('Sedano');
    INSERT INTO Ingrediente(Nome) VALUES ('Carota');
    INSERT INTO Ingrediente(Nome) VALUES ('Cipolla bionda');
    INSERT INTO Ingrediente(Nome) VALUES ('Prezzemolo');
    INSERT INTO Ingrediente(Nome) VALUES ('Finocchietto');
    INSERT INTO Ingrediente(Nome) VALUES ('Alloro');
    INSERT INTO Ingrediente(Nome) VALUES ('Limone');
    INSERT INTO Ingrediente(Nome) VALUES ('Vino bianco');
    INSERT INTO Ingrediente(Nome) VALUES ('Olio extravergine d''oliva');
    INSERT INTO Ingrediente(Nome) VALUES ('Sale');
    INSERT INTO Ingrediente(Nome) VALUES ('Pepe');
    INSERT INTO Ingrediente(Nome) VALUES ('Meline selvatiche');
    INSERT INTO Ingrediente(Nome) VALUES ('Mandorle');
    INSERT INTO Ingrediente(Nome) VALUES ('Semi di sesamo');
    INSERT INTO Ingrediente(Nome) VALUES ('Vino');
    INSERT INTO Ingrediente(Nome) VALUES ('Aglio');
    INSERT INTO Ingrediente(Nome) VALUES ('Timo');

    INSERT INTO Ricette_Ingrediente (IDric, IDing, Quantita, UnitaMisura) VALUES (0,2,800,'g');
    INSERT INTO Ricette_Ingrediente (IDric, IDing, Quantita, UnitaMisura) VALUES (0,3,1,'costa');
    INSERT INTO Ricette_Ingrediente (IDric, IDing, Quantita, UnitaMisura) VALUES (0,4,1,'');
    INSERT INTO Ricette_Ingrediente (IDric, IDing, Quantita, UnitaMisura) VALUES (0,5,1,'');
    INSERT INTO Ricette_Ingrediente (IDric, IDing, Quantita, UnitaMisura) VALUES (0,6,1,'mazzetto');
    INSERT INTO Ricette_Ingrediente (IDric, IDing, Quantita, UnitaMisura) VALUES (0,7,1,'mazzetto');
    INSERT INTO Ricette_Ingrediente (IDric, IDing, Quantita, UnitaMisura) VALUES (0,8,1,'foglia');
    INSERT INTO Ricette_Ingrediente (IDric, IDing, Quantita, UnitaMisura) VALUES (0,9,0.5,'');
    INSERT INTO Ricette_Ingrediente (IDric, IDing, Quantita, UnitaMisura) VALUES (0,10,1,'bicchiere');
    INSERT INTO Ricette_Ingrediente (IDric, IDing, Quantita, UnitaMisura) VALUES (0,11,NULL,'QB');
    INSERT INTO Ricette_Ingrediente (IDric, IDing, Quantita, UnitaMisura) VALUES (0,12,NULL,'QB');
    INSERT INTO Ricette_Ingrediente (IDric, IDing, Quantita, UnitaMisura) VALUES (0,13,NULL,'QB');

    INSERT INTO Ricette_Ingrediente (IDric, IDing, Quantita, UnitaMisura) VALUES (1,16,12,'');
    INSERT INTO Ricette_Ingrediente (IDric, IDing, Quantita, UnitaMisura) VALUES (1,17,50,'g');
    INSERT INTO Ricette_Ingrediente (IDric, IDing, Quantita, UnitaMisura) VALUES (1,18,2,'cucchiai');
    INSERT INTO Ricette_Ingrediente (IDric, IDing, Quantita, UnitaMisura) VALUES (1,19,.5,'bicchieri');
    INSERT INTO Ricette_Ingrediente (IDric, IDing, Quantita, UnitaMisura) VALUES (1,20,1,'spicchio');
    INSERT INTO Ricette_Ingrediente (IDric, IDing, Quantita, UnitaMisura) VALUES (1,21,1,'mazzetto');
    INSERT INTO Ricette_Ingrediente (IDric, IDing, Quantita, UnitaMisura) VALUES (1,11,NULL,'QB');
    INSERT INTO Ricette_Ingrediente (IDric, IDing, Quantita, UnitaMisura) VALUES (1,12,NULL,'QB');
    INSERT INTO Ricette_Ingrediente (IDric, IDing, Quantita, UnitaMisura) VALUES (1,13,NULL,'QB');
    ```
7. modificare la quantità di radicchio tardivo della ricetta del “Dentice al forno” portandolo a 100 gr
    ```sql
    UPDATE Ricette_Ingrediente SET Quantita = 100, UnitaMisura = 'g'
    WHERE IDing = (
      SELECT ID FROM Ingrediente
      WHERE Nome = 'Radicchio'
    )
    AND IDric = (
      SELECT ID
      FROM Ricette
      WHERE Nome = 'Dentice al forno'
    )
    ```
8. visualizzare:
    1. i nomi delle ricette che hanno tra gli ingredienti il pangrattato. Visualizzare anche il mese e l’anno della rivista in cui si trova la ricetta.
    2. i nomi delle ricette che utilizzano almeno 70 gr di pangrattato. Visualizzare anche il mese e
    l’anno della rivista in cui si trova la ricetta.
    3. i nomi delle ricette dove non c’è il latte
        ![Esercizio_3c](./../data/images/Esercizio3/es3-c.png)
    4. i nomi delle ricette in cui c’è dell’olio
        ![Esercizio_3d](./../data/images/Esercizio3/es3-d.png)
    5. il numero di ingredienti per ogni ricetta
        ![Esercizio_3e](./../data/images/Esercizio3/es3-e.png)
    6. i nomi delle ricette con più di 10 ingredienti. Visualizzare anche il mese e l’anno della rivista in
    cui si trova la ricetta.
        ![Esercizio_3f](./../data/images/Esercizio3/es3-f.png)
    7. il tempo medio necessario per la preparazione delle ricette “Facili”
        ![Esercizio_3g](./../data/images/Esercizio3/es3-g.png)
    8. il nome della ricetta con più calorie. Visualizzare anche il mese e l’anno della rivista in cui si trova la ricetta.
        ![Esercizio_3h](./../data/images/Esercizio3/es3-h.png)
    ```sql
    -- a
    SELECT Ricette.Nome, Rivista.Mese, Rivista.Anno FROM Ricette
    INNER JOIN Pubbl
    ON  Ricette.ID = Pubbl.IDric
    INNER JOIN Rivista
    ON Rivista.ID = Pubbl.IDriv
    INNER JOIN Ricette_Ingrediente
    ON Ricette_Ingrediente.IDric = Ricette.ID
    INNER JOIN Ingrediente
    ON Ricette_Ingrediente.IDing = Ingrediente.ID
    WHERE Ingrediente.Nome = 'pangrattato';

    -- b
    SELECT Ricette.Nome, Rivista.Mese, Rivista.Anno FROM Ricette
    INNER JOIN Pubbl
    ON  Ricette.ID = Pubbl.IDric
    INNER JOIN Rivista
    ON Rivista.ID = Pubbl.IDriv
    INNER JOIN Ricette_Ingrediente
    ON Ricette_Ingrediente.IDric = Ricette.ID
    INNER JOIN Ingrediente
    ON Ricette_Ingrediente.IDing = Ingrediente.ID
    WHERE Ingrediente.Nome = 'pangrattato'
    AND Ricette_Ingrediente.Quantita >= 70;

    -- c
    SELECT Ricette.Nome FROM Ricette
    WHERE Ricette.ID NOT IN (
      SELECT Ricette.ID FROM Ricette
      INNER JOIN Ricette_Ingrediente
      ON Ricette_Ingrediente.IDric = Ricette.ID
      INNER JOIN Ingrediente
      ON Ricette_Ingrediente.IDing = Ingrediente.ID
      WHERE Ingrediente.Nome = 'Latte'
    );

    -- d
    SELECT Ricette.Nome FROM Ricette
    WHERE Ricette.ID IN (
      SELECT Ricette.ID FROM Ricette
      INNER JOIN Ricette_Ingrediente
      ON Ricette_Ingrediente.IDric = Ricette.ID
      INNER JOIN Ingrediente
      ON Ricette_Ingrediente.IDing = Ingrediente.ID
      WHERE Ingrediente.Nome LIKE '%Olio%'
    );

    -- e
    SELECT Ricette.Nome, COUNT(*) as IngredientiTotali FROM Ricette_Ingrediente
    INNER JOIN Ricette
    ON Ricette.ID = Ricette_Ingrediente.IDric
    GROUP BY Ricette_Ingrediente.IDric, Ricette.Nome;

    -- f
    SELECT Rivista.Anno, Rivista.Mese, COUNT(*) as IngredientiTotali FROM Ricette_Ingrediente
    INNER JOIN Ricette
    ON  Ricette.ID = Ricette_Ingrediente.IDric
    INNER JOIN Pubbl
    ON  Ricette.ID = Pubbl.IDric
    INNER JOIN Rivista
    ON Rivista.ID = Pubbl.IDriv
    GROUP BY Ricette_Ingrediente.IDric, Rivista.Anno, Rivista.Mese
    HAVING COUNT(*)  > 10;

    -- g
    SELECT AVG(Ricette.TempoProcedimento) AS TempoPreparazioneMEdia FROM Ricette
    WHERE Ricette.Difficolta = 'Facile';

    -- h
    SELECT Ricette.Nome, Rivista.Mese, Rivista.Anno FROM Ricette
    INNER JOIN Pubbl
    ON  Ricette.ID = Pubbl.IDric
    INNER JOIN Rivista
    ON Rivista.ID = Pubbl.IDriv
    WHERE Ricette.Calorie = (
      SELECT MAX(Ricette.Calorie) FROM Ricette
    );
    ```
9.  eliminare le ricette che hanno un numero di calorie superiori a 300
    ```sql
    DELETE FROM Pubblicazioni
    WHERE IDRic IN (
      SELECT ID FROM Ricette
      WHERE Ricette.Calorie > 300
    );

    DELETE FROM IngredientiRicette
    WHERE IDR IN (
      SELECT ID FROM Ricette
      WHERE Ricette.Calorie > 300
    );

    DELETE FROM Ricette
    WHERE Ricette.Calorie > 300;
    ```
10. eliminare le foreign key (solo quelle)
    ```sql
    ALTER TABLE Ricette_Ingrediente
    DROP COLUMN IDric;

    ALTER TABLE Ricette_Ingrediente
    DROP COLUMN IDing;

    ALTER TABLE Pubbl
    DROP COLUMN IDric;

    ALTER TABLE Pubbl
    DROP COLUMN IDriv;
    ```
11. eliminare le tabelle create
    ```sql
    DROP TABLE Ricette_Ingrediente;
    DROP TABLE Pubbl;
    DROP TABLE Ricette;
    DROP TABLE Ingrediente;
    DROP TABLE Rivista;
    ```