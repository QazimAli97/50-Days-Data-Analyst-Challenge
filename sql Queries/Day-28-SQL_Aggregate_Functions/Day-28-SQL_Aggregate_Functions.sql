/* 
Day 28 – SQL Aggregate Functions (SUM, COUNT, AVG)
Project: Sales Analysis
Tool: SQL Server (SSMS)
Author: Mohammad Ali

Objective:
Summarise transactional sales data into meaningful
business KPIs using SQL aggregate functions.
*/

--------------------------------------------------
-- 1. Overall Business Performance
--------------------------------------------------
-- Business Question:
-- How is the business performing overall?

SELECT
    COUNT(OrderNumber) AS Total_Orders,
    SUM(Line_Total) AS Total_Sales,
    SUM(Profit) AS Total_Profit,
    AVG(Line_Total) AS Avg_Order_Value,
    AVG(Profit) AS Avg_Profit_Per_Order
FROM [Sales Orders];

--------------------------------------------------
-- 2. Customer-wise Sales & Profit Performance
--------------------------------------------------
-- Business Question:
-- Which customers generate the most revenue and profit?

SELECT
    c.Customer_Names,
    SUM(so.Line_Total) AS Total_Sales,
    SUM(so.Profit) AS Total_Profit
FROM [Sales Orders] so
INNER JOIN Customers c
    ON c.Customer_Index = so.Customer_Name_Index
GROUP BY c.Customer_Names
ORDER BY Total_Sales DESC;

--------------------------------------------------
-- 3. Product-wise Sales & Profit Performance
--------------------------------------------------
-- Business Question:
-- Which products drive revenue and profitability?

SELECT
    p.Product_Name,
    SUM(so.Line_Total) AS Product_Sales,
    SUM(so.Profit) AS Product_Profit
FROM [Sales Orders] so
INNER JOIN Products p
    ON p.Product_Description_Index = so.Product_Description_Index
GROUP BY p.Product_Name
ORDER BY Product_Sales DESC;

--------------------------------------------------
-- 4. Region-wise Sales & Profit Performance
--------------------------------------------------
-- Business Question:
-- Which regions perform best?

SELECT
    sr.Region,
    SUM(so.Line_Total) AS Regional_Sales,
    SUM(so.Profit) AS Regional_Profit
FROM [Sales Orders] so
INNER JOIN Regions r
    ON so.Delivery_Region_Index = r.ID
INNER JOIN [State Regions] sr
    ON r.State_Code = sr.State_Code
GROUP BY sr.Region
ORDER BY Regional_Sales DESC;

--------------------------------------------------
-- 5. Average Sales & Profit per Product
--------------------------------------------------
-- Business Question:
-- Which products have higher average order value?

SELECT
    p.Product_Name,
    AVG(so.Line_Total) AS Avg_Sales_Per_Order,
    AVG(so.Profit) AS Avg_Profit_Per_Order
FROM [Sales Orders] so
INNER JOIN Products p
    ON p.Product_Description_Index = so.Product_Description_Index
GROUP BY p.Product_Name
ORDER BY Avg_Sales_Per_Order DESC;
