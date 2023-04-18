[Database](https://www.w3schools.com/sql/trysql.asp?filename=trysql_select_all) di riferimento, il modello E/R ed il modello logico fanno riferimento a [questo](./05%20-%20Reverse%20engineering.md) esercizio.


## Query
1. L'elenco dei nomi dei prodotti in ordine alfabetico con il nome della categoria a cui appartengono
    ```sql
    SELECT ProductName as Product, CategoryName as Category FROM [Products]
    INNER JOIN Categories
    ON Products.CategoryID = Categories.CategoryID
    ORDER BY ProductName
    ```
2. L'elenco dei nomi dei prodotti in ordine alfabetico con il nome della categoria a cui appartengono e il nome del fornitore che li fornisce
    ```sql
    SELECT ProductName as Product, CategoryName as Category, SupplierName as Supplier FROM [Products]
    INNER JOIN Categories
    ON Products.CategoryID = Categories.CategoryID
    INNER JOIN Suppliers
    ON Products.SupplierID = Suppliers.SupplierID
    ORDER BY ProductName
    ```
3. Il numero di prodotti per ogni categoria: visualizzare il nome della categoria e il numero di prodotti
    ```sql
	SELECT CategoryName, COUNT(*) AS Products FROM Categories
	INNER JOIN Products
    ON Products.CategoryID = Categories.CategoryID
    GROUP BY Categories.CategoryID
    ```
4. Il cognome dei clienti con il numero dell'ordine e il cognome del dipendente che ha seguito quell'ordine. Ordinare sul cognome del cliente
    ```sql
    SELECT CustomerName, OrderID, LastName FROM Customers
    INNER JOIN Orders
    ON Customers.CustomerID = Orders.CustomerID
    INNER JOIN Employees
    ON Orders.EmployeeID = Employees.EmployeeID
    ORDER BY Customers.CustomerName
    ```
5. Il cognome del cliente con il totale complessivo di quanto ha speso. Ordinare a partire dal cliente che ha speso di più a quello che ha speso di meno
    ```sql
    SELECT Customers.CustomerName as Customer, SUM(Price) * Quantity as TotalPrice
    FROM Customers
    INNER JOIN Orders
    ON Orders.CustomerID = Customers.CustomerID
    INNER JOIN OrderDetails
    ON Orders.OrderID = OrderDetails.OrderID
    INNER JOIN Products
    ON Products.ProductID = OrderDetails.ProductID
    GROUP BY Customers.CustomerID, CustomerName
    ORDER BY TotalPrice DESC
    ```
6. La quantità di prodotti trasportati da ogni corriere. 
    ```sql
    SELECT ShipperName, SUM(OrderDetails.Quantity) as Products FROM [Shippers]
    INNER JOIN Orders
    ON Shippers.ShipperID = Orders.ShipperID
    INNER JOIN OrderDetails
    ON OrderDetails.OrderID = Orders.OrderID
    GROUP BY Shippers.ShipperID
    ```
7. Il corriere che ha consegnato più prodotti
    ```sql
    SELECT ShipperName, MAX(p) as Products FROM (
        SELECT ShipperName, SUM(OrderDetails.Quantity) as p FROM [Shippers]
        INNER JOIN Orders
        ON Shippers.ShipperID = Orders.ShipperID
        INNER JOIN OrderDetails
        ON OrderDetails.OrderID = Orders.OrderID
        GROUP BY Shippers.ShipperID
    )
    ```
8. L'ordine con più prodotti al suo interno
    ```sql
    SELECT MAX(p) as Products FROM (
        SELECT SUM(Quantity) as p FROM [OrderDetails]
        GROUP BY OrderID
    )
    ```
9.  I clienti che non hanno effettuato nessun ordine
    ```sql
    SELECT * FROM [Customers]
    WHERE CustomerID NOT IN (
        SELECT Customers.CustomerID FROM Customers
        INNER JOIN Orders
        ON Customers.CustomerID = Orders.CustomerID
    )
    ```