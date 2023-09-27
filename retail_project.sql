-- Inserting data into Products
INSERT INTO Products VALUES
(1, 'White T-Shirt', 'Apparel', 20.00),
(2, 'Blue Jeans', 'Apparel', 50.00),
(3, 'Running Shoes', 'Footwear', 80.00),
(4, 'Leather Belt', 'Accessories', 25.00),
(5, 'Digital Watch', 'Accessories', 60.00);

-- Inserting data into Customers
INSERT INTO Customers VALUES
(1, 'John', 'Doe', 'john.doe@email.com'),
(2, 'Alice', 'Smith', 'alice.smith@email.com'),
(3, 'Bob', 'Johnson', 'bob.johnson@email.com'),
(4, 'Sarah', 'White', 'sarah.white@email.com'),
(5, 'Mike', 'Brown', 'mike.brown@email.com');

-- Inserting data into Sales
INSERT INTO Sales VALUES
(1, 1, 2, '2023-09-20', 2),
(2, 3, 4, '2023-09-15', 1),
(3, 4, 1, '2023-09-10', 1),
(4, 2, 3, '2023-09-05', 1),
(5, 5, 5, '2023-09-25', 1);

--Find total sales
SELECT SUM(p.Price * s.QuantitySold) AS TotalSales
FROM Products p
JOIN Sales s ON p.ProductID = s.ProductID;

--Find top 5 best-sellers
SELECT TOP 5 p.ProductName, SUM(s.QuantitySold) as TotalSold
FROM Products p
JOIN Sales s ON p.ProductID = s.ProductID
GROUP BY p.ProductName
ORDER BY TotalSold DESC;

--Sales by category
SELECT p.Category, SUM(p.Price * s.QuantitySold) AS SalesByCategory
FROM Products p
JOIN Sales s ON p.ProductID = s.ProductID
GROUP BY p.Category;

--Monthly sales
SELECT MONTH(s.SaleDate) AS Month, YEAR(s.SaleDate) AS Year, SUM(p.Price * s.QuantitySold) AS MonthlySales
FROM Sales s
JOIN Products p ON s.ProductID = p.ProductID
GROUP BY MONTH(s.SaleDate), YEAR(s.SaleDate)
ORDER BY Year, Month;
