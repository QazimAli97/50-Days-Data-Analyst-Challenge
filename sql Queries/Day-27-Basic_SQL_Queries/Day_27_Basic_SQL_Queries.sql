/* 
Day 27 – Basic SQL Queries (SELECT, WHERE, ORDER BY)
Project: Sales Analysis
Tool: SQL Server (SSMS)
Author: Mohammad Ali

Objective:
Use basic SQL clauses to extract meaningful business insights
from transactional sales data.
*/

--------------------------------------------------
-- 1. View Sample Data
--------------------------------------------------
SELECT TOP 10 *
FROM [Sales Orders];

--------------------------------------------------
-- 2. Select Specific Columns (Best Practice)
--------------------------------------------------
SELECT 
    OrderNumber,
    OrderDate,
    Customer_Name_Index,
    Product_Description_Index,
    Line_Total AS Sales,
    Profit
FROM [Sales Orders];

--------------------------------------------------
-- 3. High Sales Orders
--------------------------------------------------
SELECT 
    so.OrderNumber,
    c.Customer_Names,
    so.Line_Total AS Sales
FROM [Sales Orders] so
INNER JOIN Customers c
    ON c.Customer_Index = so.Customer_Name_Index
WHERE so.Line_Total > 50000;

--------------------------------------------------
-- 4. Orders with Low or No Profit
--------------------------------------------------
SELECT 
    OrderNumber,
    Product_Description_Index,
    Line_Total AS Sales,
    Profit
FROM [Sales Orders]
WHERE Profit <= 0;

--------------------------------------------------
-- 5. Orders from West Region
--------------------------------------------------
SELECT 
    so.OrderNumber,
    c.Customer_Names,
    sr.Region,
    so.Line_Total AS Sales
FROM [Sales Orders] so
INNER JOIN Customers c
    ON c.Customer_Index = so.Customer_Name_Index
INNER JOIN Regions r
    ON so.Delivery_Region_Index = r.id
INNER JOIN [State Regions] sr
    ON r.State_Code = sr.State_Code
WHERE sr.Region = 'West'
ORDER BY so.OrderNumber;

--------------------------------------------------
-- 6. High Sales but Low Profit Orders
--------------------------------------------------
SELECT 
    so.OrderNumber,
    p.Product_Name,
    so.Line_Total AS Sales,
    so.Profit
FROM [Sales Orders] so
INNER JOIN Products p
    ON p.Product_Description_Index = so.Product_Description_Index
WHERE so.Line_Total > 50000
  AND so.Profit < 5000;

--------------------------------------------------
-- 7. Orders from South or West Region
--------------------------------------------------
SELECT 
    so.OrderNumber,
    c.Customer_Names,
    sr.Region
FROM [Sales Orders] so
INNER JOIN Customers c
    ON c.Customer_Index = so.Customer_Name_Index
INNER JOIN Regions r
    ON so.Delivery_Region_Index = r.id
INNER JOIN [State Regions] sr
    ON r.State_Code = sr.State_Code
WHERE sr.Region IN ('West', 'South')
ORDER BY so.OrderNumber;

--------------------------------------------------
-- 8. Highest Sales Orders
--------------------------------------------------
SELECT 
    so.OrderNumber,
    c.Customer_Names,
    so.Line_Total AS Sales
FROM [Sales Orders] so
INNER JOIN Customers c
    ON c.Customer_Index = so.Customer_Name_Index
ORDER BY so.Line_Total DESC;

--------------------------------------------------
-- 9. Lowest Profit Orders
--------------------------------------------------
SELECT 
    so.OrderNumber,
    p.Product_Name,
    so.Profit
FROM [Sales Orders] so
INNER JOIN Products p
    ON p.Product_Description_Index = so.Product_Description_Index
ORDER BY so.Profit ASC;

--------------------------------------------------
-- 10. Top 10 High-Value Orders
--------------------------------------------------
SELECT TOP 10
    so.OrderNumber,
    c.Customer_Names,
    so.Line_Total AS Sales
FROM [Sales Orders] so
INNER JOIN Customers c
    ON c.Customer_Index = so.Customer_Name_Index
ORDER BY so.Line_Total DESC;

--------------------------------------------------
-- 11. Orders within a Sales Range
--------------------------------------------------
SELECT 
    OrderNumber,
    Line_Total AS Sales
FROM [Sales Orders]
WHERE Line_Total BETWEEN 20000 AND 50000;

--------------------------------------------------
-- 12. Customers Whose Name Starts with 'A'
--------------------------------------------------
SELECT 
    c.Customer_Names,
    so.Line_Total AS Sales
FROM [Sales Orders] so
INNER JOIN Customers c
    ON c.Customer_Index = so.Customer_Name_Index
WHERE c.Customer_Names LIKE 'A%';
