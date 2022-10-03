# Bikes Stores
:link: [Riferimento](https://www.sqlservertutorial.net/sql-server-sample-database/)

## Modello ER
![Modello ER](./../data/images/Esercizio1/M_ER.png)

## Modello Logico
![Modello Logico](./../data/images/Esercizio1/M_Log.png)

1. I nomi dei brand
    ```sql
    SELECT production.products.brand_name FROM production.brands;
    ```
    ![1](./../data/images/Esercizio1/Es1-1.PNG)

2. I nomi dei prodotti con il brand
    ```sql
    SELECT production.products.product_name, production.brands.brand_name FROM production.products
    INNER JOIN production.brands
    ON production.brands.brand_id = production.products.brand_id;
    ```
    ![2](./../data/images/Esercizio1/Es1-2.PNG)

3. I nomi dei prodotti con il brand e la categoria a cui appartiene il prodotto
    ```sql
    SELECT production.products.product_name, production.brands.brand_name, production.categories.category_name FROM production.products
    INNER JOIN production.brands
    ON production.brands.brand_id = production.products.brand_id
    INNER JOIN production.categories
    ON production.products.category_id = production.products.category_id;
    ```
    ![3](./../data/images/Esercizio1/Es1-3.PNG)

4. I nomi dei prodotti con le quantità disponibili in stock
    ```sql
    SELECT production.products.product_name, production.stocks.quantity FROM production.products
    INNER JOIN production.stocks
    ON production.products.product_id = production.stocks.product_id
    ```
    ![4](./../data/images/Esercizio1/Es1-4.PNG)

5. I nomi dei prodotti che hanno uno stock superiore a 10
    ```sql
    SELECT production.products.product_name FROM production.products
    INNER JOIN production.stocks
    ON production.products.product_id = production.stocks.product_id
    WHERE production.stocks.quantity > 10
    ```
    ![5](./../data/images/Esercizio1/Es1-5.PNG)

6. I nomi dei prodotti che hanno uno stock compreso tra 5 e 10
    ```sql
    SELECT production.products.product_name FROM production.products
    INNER JOIN production.stocks
    ON production.products.product_id = production.stocks.product_id
    WHERE production.stocks.quantity BETWEEN 5 AND 10
    ```
    ![6](./../data/images/Esercizio1/Es1-6.PNG)

7. I nomi dei prodotti che hanno uno stock compreso tra 5 e 10 e cje costano meno di 300 $
    ```sql
    SELECT production.products.product_name FROM production.products
    INNER JOIN production.stocks
    ON production.products.product_id = production.stocks.product_id
    WHERE production.stocks.quantity BETWEEN 5 AND 10
    AND production.products.list_price < 300
    ```
    ![7](./../data/images/Esercizio1/Es1-7.PNG)

8. I nomi dei prodotti che hanno la parola "Cruiser" nel nome
    ```sql
    SELECT production.products.product_name FROM production.products
    WHERE production.products.product_name LIKE '%Cruiser%'
    ```
    ![8](./../data/images/Esercizio1/Es1-8.PNG)

9. I nomi dei prodotti che non hanno la parola "Cruiser" nel nome
    ```sql
    SELECT production.products.product_name FROM production.products
    WHERE production.products.product_name NOT LIKE '%Cruiser%'
    ```
    ![9](./../data/images/Esercizio1/Es1-9.PNG)