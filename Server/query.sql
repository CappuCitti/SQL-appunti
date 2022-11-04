-- Il numero di prodotti per ogni categoria, sia in formato testuale sia tabellare sia in forma di grafico a barre verticali
SELECT production.categories.category_name, COUNT(*) AS NumeroProdotti FROM production.products
INNER JOIN production.categories
ON production.products.category_id = production.categories.category_id
GROUP BY production.products.category_id, production.categories.category_name


-- Numero di ordini per ogni store, sia in formato tabellare sia in forma di grafico a barre orizzontali
SELECT sales.stores.store_name, COUNT(*) AS NumeroOrdini FROM sales.stores
INNER JOIN sales.orders
ON sales.orders.store_id = sales.stores.store_id
GROUP BY sales.stores.store_id, sales.stores.store_name


-- Il numero di prodotti per ogni brand, sia in formato tabellare, sia sotto forma di grafico a torta
SELECT production.brands.brand_name, COUNT(*) AS NumeroProdotti FROM production.products
INNER JOIN production.brands
ON production.brands.brand_id = production.products.brand_id
GROUP BY production.products.brand_id, production.brands.brand_name