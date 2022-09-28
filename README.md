# Creare una *Query*
Quando si vuole scrivere una query fare riferimento ad i seguenti passaggi:
1. Individuare in quali tabelle si trovano le informazioni
    1. Se le informazioni si trovano in due tabelle e’ necessario eseguire una `JOIN` individuando i campi che hanno le tabelle in relazione
2. Visualizzare i campi richiesti dal testo all’interno della [`SELECT`](./03%20-%20Select.md#select) (Selezione verticale, prendo solo alcuni campi o colonne)
3. Se non sono necessari tutti i record, ma solo alcuni, utilizzare la clausola [`WHERE`](./03%20-%20Select.md#where) (Selezione orizzontale, prendo solo alcuni record, righe della tabella)
