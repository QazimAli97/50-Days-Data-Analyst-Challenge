/* 
Day 32 – Customer-Level Sales Analysis
Project: Sales Analysis
Tool: SQL Server (SSMS)
Author: Mohammad Ali

Objective:
Analyse customer contribution, repeat behaviour, and profitability
to support retention and revenue optimisation strategies.
*/

--------------------------------------------------
-- 1. Customer Sales & Profit Contribution
--------------------------------------------------
-- Business Question:
-- Which customers generate the most revenue and profit?

SELECT
    c.Customer_Names,
    ROUND(SUM(so.Line_Total), 2) AS Total_Sales,
    ROUND(SUM(so.Profit), 2) AS Total_Profit
FROM [Sales Orders] so
INNER JOIN Customers c
    ON c.Customer_Index = so.Customer_Name_Index
GROUP BY c.Customer_Names
ORDER BY Total_Sales DESC;

--------------------------------------------------
-- 2. Repeat Customers (Order Frequency)
--------------------------------------------------
-- Business Question:
-- Which customers place the most orders?

SELECT
    c.Customer_Names,
    COUNT(so.OrderNumber) AS Order_Count,
    ROUND(SUM(so.Line_Total), 2) AS Total_Sales
FROM [Sales Orders] so
INNER JOIN Customers c
    ON c.Customer_Index = so.Customer_Name_Index
GROUP BY c.Customer_Names
ORDER BY Order_Count DESC;

--------------------------------------------------
-- 3. High-Value Customers (Sales Threshold)
--------------------------------------------------
-- Business Question:
-- Who are the high-value customers?

SELECT
    c.Customer_Names,
    ROUND(SUM(so.Line_Total), 2) AS Total_Sales
FROM [Sales Orders] so
INNER JOIN Customers c
    ON c.Customer_Index = so.Customer_Name_Index
GROUP BY c.Customer_Names
HAVING SUM(so.Line_Total) > 10000000
ORDER BY Total_Sales DESC;

--------------------------------------------------
-- 4. Customers with High Orders but Low Profit
--------------------------------------------------
-- Business Question:
-- Which customers generate volume but weak profitability?

SELECT
    c.Customer_Names,
    COUNT(so.OrderNumber) AS Order_Count,
    ROUND(SUM(so.Line_Total), 2) AS Total_Sales,
    ROUND(SUM(so.Profit), 2) AS Total_Profit
FROM [Sales Orders] so
INNER JOIN Customers c
    ON c.Customer_Index = so.Customer_Name_Index
GROUP BY c.Customer_Names
HAVING COUNT(so.OrderNumber) > 350
   AND SUM(so.Profit) < 2000000
ORDER BY Total_Sales DESC;

--------------------------------------------------
-- 5. Average Order Value by Customer
--------------------------------------------------
-- Business Question:
-- Which customers place higher-value orders?

SELECT
    c.Customer_Names,
    ROUND(AVG(so.Line_Total), 2) AS Avg_Order_Value
FROM [Sales Orders] so
INNER JOIN Customers c
    ON c.Customer_Index = so.Customer_Name_Index
GROUP BY c.Customer_Names
ORDER BY Avg_Order_Value DESC;
