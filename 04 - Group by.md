```sql
-- Funzioni di aggregazione
-- Groupby
-- media, sort, maxValue, minValue, conteggi

-- conteggio e sort
SELECT model_year, COUNT(*) as totalProducts FROM production.products
GROUP BY production.products.model_year

-- WHERE non pu' essere utilizzato dopo un groupby
-- WHERE totalProducts > 50

-- Il nome della colonna "totalProducts" non esiste
-- HAVING totalProducts > 50
HAVING count(*) > 50

ORDER BY totalProducts DESC;
```

```sql
SELECT state, city, COUNT(*) as totalForState FROM sales.customers
GROUP BY state, city

HAVING count(*) > 10

ORDER BY totalForState DESC;
```

```sql
-- Somma dei prezzi dei prodotti per ogni categoria


SELECT production.categories.category_id, production.categories.category_name, SUM(production.products.list_price) as totalPrice FROM production.products
INNER JOIN production.categories
ON production.products.category_id = production.categories.category_id

GROUP BY production.categories.category_id, production.categories.category_name

HAVING SUM(production.products.list_price) > 5000

ORDER BY totalPrice DESC;
```

```sql
-- Prezzo del prodotto con il prezzo piu' alto (Prezzo piu' alto)

SELECT production.products.product_name, production.products.list_price FROM production.products
WHERE production.products.list_price = (SELECT MAX(production.products.list_price) FROM production.products)
```