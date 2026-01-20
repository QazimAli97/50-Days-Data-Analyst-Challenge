/*  
Day 34 – SQL CASE WHEN | Business Rule Classification
Project: Sales Analysis
Tool: SQL Server (SSMS)
Author: Mohammad Ali

Objective:
Use CASE WHEN to convert numeric data into meaningful
business categories for decision-making and reporting.
*/

--------------------------------------------------
-- 1. Order Value Classification
--------------------------------------------------
-- Business Question:
-- Which orders are High, Medium, or Low value?

SELECT
    OrderNumber,
    ROUND(Line_Total, 2) AS Sales,
    CASE
        WHEN Line_Total >= 50000 THEN 'High Value Order'
        WHEN Line_Total BETWEEN 20000 AND 49999 THEN 'Medium Value Order'
        ELSE 'Low Value Order'
    END AS Order_Value_Category
FROM [Sales Orders]
n  

--------------------------------------------------
-- 2. Customer Profit Category
--------------------------------------------------
-- Business Question:
-- Which customers are high-profit vs low-profit contributors?

SELECT
    c.Customer_Names,
    ROUND(SUM(so.Profit), 2) AS Total_Profit,
    CASE
        WHEN SUM(so.Profit) >= 5000000 THEN 'High Profit Customer'
        WHEN SUM(so.Profit) BETWEEN 1000000 AND 4999999 THEN 'Moderate Profit Customer'
        ELSE 'Low Profit Customer'
    END AS Customer_Profit_Category
FROM [Sales Orders] so
INNER JOIN Customers c
    ON c.Customer_Index = so.Customer_Name_Index
GROUP BY c.Customer_Names
ORDER BY Total_Profit DESC;

--------------------------------------------------
-- 3. Product Margin Classification
--------------------------------------------------
-- Business Question:
-- Which products have strong vs weak profitability?

SELECT
    p.Product_Name,
    ROUND(SUM(so.Profit), 2) AS Total_Profit,
    CASE
        WHEN SUM(so.Profit) >= 20000000 THEN 'High Margin Product'
        WHEN SUM(so.Profit) BETWEEN 10000000 AND 19999999 THEN 'Medium Margin Product'
        ELSE 'Low Margin Product'
    END AS Product_Margin_Status
FROM [Sales Orders] so
INNER JOIN Products p
    ON p.Product_Description_Index = so.Product_Description_Index
GROUP BY p.Product_Name
ORDER BY Total_Profit DESC;

--------------------------------------------------
-- 4. Profit Status per Order
--------------------------------------------------
-- Business Question:
-- Which orders are loss-making or healthy?

SELECT
    OrderNumber,
    ROUND(Profit, 2) AS Profit,
    CASE
        WHEN Profit <= 0 THEN 'Loss Order'
        WHEN Profit BETWEEN 1 AND 5000 THEN 'Low Profit Order'
        ELSE 'Healthy Profit Order'
    END AS Profit_Status
FROM [Sales Orders];

--------------------------------------------------
-- 5. Customer Engagement Level
--------------------------------------------------
-- Business Question:
-- Who are highly engaged vs low-engagement customers?

SELECT
    c.Customer_Names,
    COUNT(so.OrderNumber) AS Order_Count,
    CASE
        WHEN COUNT(so.OrderNumber) >= 400 THEN 'Highly Engaged'
        WHEN COUNT(so.OrderNumber) BETWEEN 350 AND 450 THEN 'Moderately Engaged'
        ELSE 'Low Engagement'
    END AS Customer_Engagement_Level
FROM [Sales Orders] so
INNER JOIN Customers c
    ON c.Customer_Index = so.Customer_Name_Index
GROUP BY c.Customer_Names
ORDER BY Order_Count DESC;
