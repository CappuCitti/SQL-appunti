## `SELECT`
L'istruzione `SELECT` si utilizza per prelevare dati da un database.
```sql
SELECT * FROM Dipendente
```

Puo' essere utilizzanto per:
- Raggruppare dati di piu' tabelle passando un dato che li accomuna e l'istruzione `INNER JOIN`
    ```sql
    SELECT * FROM Partecipazione

    -- Primo join
    INNER JOIN Progetto
    ON Partecipazione.IDprog = Progetto.ID

    -- Secondo join
    INNER JOIN Dipendente
    ON Partecipazione.IDdip = Dipendente.ID
    ```

- Prelevare solo alcune colonne
    ```sql
    SELECT Progetto.Nome, Dipendente.Nome, Dipendente.Cognome FROM Partecipazione
    INNER JOIN Progetto
    ON Partecipazione.IDprog = Progetto.ID
    INNER JOIN Dipendente
    ON Partecipazione.IDdip = Dipendente.ID
    ```

- Dare un ordine al raggruppamento con l'istruzione `ORDER BY`
    ```sql
    SELECT Progetto.Nome, Dipendente.Nome, Dipendente.Cognome FROM Partecipazione
    INNER JOIN Progetto
    ON Partecipazione.IDprog = Progetto.ID
    INNER JOIN Dipendente
    ON Partecipazione.IDdip = Dipendente.ID

    -- Sort
    ORDER BY Dipendente.Nome
    ```

## `WHERE`
Con l'istruzione `WHERE` e' possibile filtrare i record che rispettano determinate condizioni:
```sql
SELECT Progetto.Nome, Dipendente.Nome, Dipendente.Cognome FROM Partecipazione
INNER JOIN Progetto
ON Partecipazione.IDprog = Progetto.ID
INNER JOIN Dipendente
ON Partecipazione.IDdip = Dipendente.ID

-- Condizione
WHERE Progetto.Nome = 'ING'

ORDER BY Dipendente.Nome
```

Insieme ad esso e' possibile utilizzare i seguenti operatori (oltre alle istruzioni `AND`, `OR` e `NOT`):
Operator | Description
--: | :--
`=` | Uguale
`>` | Maggiore di
`<` | Minore di
`>=` | Maggiore uguale a
`<=` | Minore uguale a
`<>` | Diverso da
`BETWEEN` | Compreso tra
`LIKE` | [Pattern](#like)
`IN` | Specifica le parole da filtrare dalla colonna desiderata

### `LIKE`
Esistono due caratteri *Jolly*:
- **%** Rappresenta n caratteri
- **_** Rappresente un carattere

```sql
SELECT * FROM Progetto
WHERE Nome LIKE 'I%';
```
