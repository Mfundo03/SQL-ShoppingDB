-- CREATE DATABSE
CREATE DATABASE ShoppingDB;
GO
-- USE DATABASE
USE ShoppingDB;
GO
-- CREATE TABLES
CREATE TABLE Customers(
             CustomerID INT PRIMARY KEY IDENTITY(1,1),
             FirstName VARCHAR(50) NOT NULL,
             LastName VARCHAR(50) NOT NULL,
             Email VARCHAR(100) UNIQUE,
             City VARCHAR(50) NOT NULL
);

CREATE TABLE Products(
             ProductID INT PRIMARY KEY IDENTITY(1,1),
             ProductName VARCHAR(100) NOT NULL,
             Category VARCHAR(50) NOT NULL,
             Price DECIMAL DEFAULT 10.2,
             StockQuantity INT NOT NULL
);

CREATE TABLE Orders(
             OrderID INT PRIMARY KEY IDENTITY(1,1),
             CustomerID INT,
             FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
             ProductID INT,
             FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
             OrderDate DATE NOT NULL,
             Quantity INT NOT NULL
);
-- INSERT VALUES/INFORMATION
INSERT INTO Customers(FirstName,LastName,Email,City)
       VALUES('Amanda','Smith','amanda@gmail.com','Pretoria'),
             ('Peter','Jones','peter@gmail.com','Johannesburg'),
             ('Sarah','Brown','sarah@gmail.com','Centurion'),
             ('David','Miller','david@gmail.com','Pretoria'),
             ('Alice','Johnson','alice@gmail.com','Midrand'),
             ('James','Wilson','james@gmail.com','Johannesburg');

INSERT INTO Products(ProductName,Category,Price,StockQuantity)
       VALUES('Laptop','Electronics',12000,10),
             ('Headphones','Electronics',850,25),
             ('Office Chair','Furniture',2500,8),
             ('Desk','Furniture',1800,12),
             ('Mouse','Electronics',250,40),
             ('Backpack','Accessories',650,15);
-- DISPLAY ALL CUSTOMERS
SELECT * FROM Customers;
-- DISPLAY ALL PRODUCTS
SELECT * FROM Products;
-- Display products costing more than R1,000.
SELECT ProductName FROM Products
WHERE Price > 1000;
-- Find products with stock quantities below 15.
SELECT ProductName FROM Products
WHERE StockQuantity < 15;
-- Display customers from Pretoria.
SELECT FirstName FROM Customers
WHERE City = 'Pretoria';
-- Sort products from cheapest to most expensive.
SELECT ProductName, Price FROM Products
ORDER BY Price ASC;
-- Display the 3 most expensive products.
SELECT TOP 3 ProductName,Price FROM Products
ORDER BY Price DESC;
-- Count the total number of customers.
SELECT COUNT(*) FROM Customers;
-- Find the average product price.
SELECT AVG(Price) FROM Products;
-- Update the stock quantity of one product.
UPDATE Products SET StockQuantity = 35
WHERE ProductID = 5;
SELECT StockQuantity FROM Products
WHERE ProductID = 5;
-- Change one customer's city.
UPDATE Customers SET City = 'Springs'
WHERE CustomerID = 4;
SELECT City FROM Customers
WHERE CustomerID = 4
-- Delete one product (consider its existing orders first).
DELETE FROM Products
WHERE ProductID = 6;
SELECT * FROM Products;
-- Display all orders.
INSERT INTO Orders(CustomerID,ProductID,OrderDate,Quantity)
        VALUES(1,1,'2026-10-11',13),
              (2,2,'2026-10-18',38),
              (3,3,'2026-10-14',11),
              (4,4,'2026-10-22',25),
              (5,5,'2026-10-30',15);
            
SELECT * FROM Orders;
-- Find the total quantity of products ordered.
SELECT SUM(Quantity) FROM Orders;
-- Display customer names and their order dates using JOIN.
SELECT Customers.FirstName,Orders.OrderDate
FROM Customers
INNER JOIN Orders
ON Customers.CustomerID = Orders.OrderID;


