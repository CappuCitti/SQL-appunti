### Introduzione
Netflix vuole realizzare una base di dati che permetta di memorizzare le informazioni sulle valutazioni degli utenti degli episodi delle serie TV che vengono trasmesse dalla societa di streaming, in particolare si vogliono memorizzare le seguenti informazioni:
1. Informazioni sugli utenti
    1. Generalità eta nazione di residenza sesso
    2. Data inizio e fine dell abbonamento
    3. Data in cui l'utente ha guardato un episodio (ogni singolo episodio)
    4. Valutazioni dell'utente dei vari episodi che ha guardato (opzionale). Se lutente valuta episodio puo esprimere la valutazione con un numero da 1 a 10. Va memorizzata anche la data in cui ha guardato l episodio
    5. valutazioni complessiva dell utente della serie TV di cui ha guardato qualche episodio opzionale). Se l'utente valuta la serie può esprimere la valutazione con un numero da 1 a 10. Va memorizzata anche la data in cui ha guardato l'episodio
2. Informazioni sugli episodi delle serie TV
    1. Nome e genere della serie TV con una breve descrizione della trama
    2. Numero di stagioni della serie TV
    3. Titolo di ogni singolo episodio
    4. Durata dell'episodio in minuti
    5. Generalità degli attori che prendono parte ad ogni singolo episodio con indicazione del nome e cognome e del personaggio che interpretano

### Richieste

Nella risposta seguire scrupolosamente le indicazioni e l'ordine delle richieste. Nel caso non si sappia rispondere lasciare uno spazio bianco scrivendo comunque la lettera dell esercizio. Se non indicato espressamente visualizzare tutte le colonne della tabella coinvolta.
1. Progettare il modello ER per questa situazione nella seconda facciata del foglio protocollo (prima meta)
2. Scrivere il modello logico corrispondente nella seconda facciata (seconda metà)
3. scrivere nella terza facciata le istruzioni SQL per
    1. Avere il gradimento medio dell episodio La scatola del bravo ragazzo della serie TV Dahmer
    2. Avere l'elenco delle serie TV con il numero di episodi di ogni serie
    3. Avere gli utenti (nome e cognome) che hanno guardato più di 100 episodi
    4. avere gli utenti che hanno guardato episodi di più di 10 serie TV diverse
    5. Avere l'elenco degli utenti che nell'ultimo mese non hanno guardato la serie TV Dahmer
4. Scrivere nella quarta facciata le istruzioni SQL per
    1. Avere l'elenco delle serie TV di genere drammatico e fantascientifico Ordinare in ordine alfabetico visualizzando prima le serie di fantascienza e poi quelle drammatiche 
    2. Avere elenco degli episodi (titolo e serie TV) in cui ha recitato Flavio Nedina avere elenco delle serie TV in cui compare la parola The all'inizio del nome della serie TV
    3. Avere il numero di utenti che hanno guardato episodi nel settembre del 2022 
5. Scrivere nella prima facciata le istruzioni SQL per
    1. Creare una tabella che rappresenta una entità
    2. Creare una tabella che rappresenta una relazione collegata all entita precedente 
    3. Aggiungere il campo numero di telefono all utente
    4. Eliminare attributo sesso dell'utente
    5. Eliminare tutti gli utenti a cui è scaduto abbonamento 
    6. Modificare la valutazione degli episodi passando da un voto da 1 a 10 ad un voto da 1 a 5 stelle secondo la seguente tabella
        Voto | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10
        :-- | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-:
        Stelle | 1 | 1 | 1.5 | 2 | 2.5 | 3 | 3.5 | 4 | 4.5 | 5

### Soluzione
➡ [Qui](./3%20-%20Netflix.sql)