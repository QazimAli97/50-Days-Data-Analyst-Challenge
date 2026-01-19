/* 
Day 33 – SQL Window Functions
Project: Sales Analysis
Tool: SQL Server (SSMS)
Author: Mohammad Ali

Objective:
Use SQL Window Functions to perform ranking, comparisons,
and running analysis without collapsing data using GROUP BY.
*/

--------------------------------------------------
-- 1. Rank Customers by Total Sales
--------------------------------------------------
-- Business Question:
-- Who are the top customers by revenue?

SELECT
    c.Customer_Names,
    ROUND(SUM(so.Line_Total), 2) AS Total_Sales,
    RANK() OVER (ORDER BY SUM(so.Line_Total) DESC) AS Sales_Rank
FROM [Sales Orders] so
INNER JOIN Customers c
    ON c.Customer_Index = so.Customer_Name_Index
GROUP BY c.Customer_Names
ORDER BY Sales_Rank;

--------------------------------------------------
-- 2. Dense Rank Products by Profit
--------------------------------------------------
-- Business Question:
-- Which products generate the highest profit?

SELECT
    p.Product_Name,
    ROUND(SUM(so.Profit), 2) AS Total_Profit,
    DENSE_RANK() OVER (ORDER BY SUM(so.Profit) DESC) AS Profit_Rank
FROM [Sales Orders] so
INNER JOIN Products p
    ON p.Product_Description_Index = so.Product_Description_Index
GROUP BY p.Product_Name
ORDER BY Profit_Rank;

--------------------------------------------------
-- 3. Row Number for Orders per Customer
--------------------------------------------------
-- Business Question:
-- Number each order per customer (order sequence)

SELECT
    so.OrderNumber,
    c.Customer_Names,
    so.OrderDate,
    ROW_NUMBER() OVER (
        PARTITION BY c.Customer_Names
        ORDER BY so.OrderDate
    ) AS Order_Sequence
FROM [Sales Orders] so
INNER JOIN Customers c
    ON c.Customer_Index = so.Customer_Name_Index;

--------------------------------------------------
-- 4. Running Total of Sales (Time-Based)
--------------------------------------------------
-- Business Question:
-- How does cumulative sales grow over time?

SELECT
    so.OrderDate,
    ROUND(so.Line_Total, 2) AS Sales,
    ROUND(
        SUM(so.Line_Total) OVER (
            ORDER BY so.OrderDate
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ), 2
    ) AS Running_Total_Sales
FROM [Sales Orders] so
ORDER BY so.OrderDate;

--------------------------------------------------
-- 5. Compare Order Value vs Customer Average
--------------------------------------------------
-- Business Question:
-- Is this order above or below customer’s average order value?

SELECT
    so.OrderNumber,
    c.Customer_Names,
    ROUND(so.Line_Total, 2) AS Order_Sales,
    ROUND(
        AVG(so.Line_Total) OVER (PARTITION BY c.Customer_Names),
        2
    ) AS Avg_Customer_Sales,
    ROUND(
        so.Line_Total -
        AVG(so.Line_Total) OVER (PARTITION BY c.Customer_Names),
        2
    ) AS Sales_Difference
FROM [Sales Orders] so
INNER JOIN Customers c
    ON c.Customer_Index = so.Customer_Name_Index;
