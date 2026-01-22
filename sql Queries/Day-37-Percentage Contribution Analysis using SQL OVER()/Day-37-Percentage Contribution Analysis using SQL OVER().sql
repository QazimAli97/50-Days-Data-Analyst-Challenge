/*
Day 37 – Percentage Contribution Analysis using SQL OVER()
Project: Sales Analysis
Tool: SQL Server (SSMS)
Author: Mohammad Ali

Objective:
Analyse percentage contribution of customers, products, regions,
and orders to total sales and profit using window functions (OVER()).

This analysis helps identify revenue concentration risk,
key account dependency, and business exposure.
*/

--------------------------------------------------
-- 1. Customer Sales Contribution Percentage
--------------------------------------------------
-- Business Question:
-- Which customers contribute the highest % of total sales?

SELECT
    c.Customer_Names,
    ROUND(SUM(so.Line_Total), 2) AS Customer_Sales,
    ROUND(
        SUM(so.Line_Total) * 100.0 /
        SUM(SUM(so.Line_Total)) OVER (),
        2
    ) AS Sales_Contribution_Percentage
FROM [Sales Orders] so
INNER JOIN Customers c
    ON c.Customer_Index = so.Customer_Name_Index
GROUP BY c.Customer_Names
ORDER BY Sales_Contribution_Percentage DESC;

-- Insight:
-- Identifies key accounts and revenue dependency.


--------------------------------------------------
-- 2. Product Profit Contribution Percentage
--------------------------------------------------
-- Business Question:
-- Which products drive the most profit?

SELECT
    p.Product_Name,
    ROUND(SUM(so.Profit), 2) AS Product_Profit,
    CAST(
    ROUND(
        SUM(so.Profit) * 100.0 /
        SUM(SUM(so.Profit)) OVER (),
        2
    ) AS DECIMAL(10,2)
) AS Profit_Contribution_Percentage
FROM [Sales Orders] so
INNER JOIN Products p
    ON p.Product_Description_Index = so.Product_Description_Index
GROUP BY p.Product_Name
ORDER BY Profit_Contribution_Percentage DESC;

-- Insight:
-- Highlights products with the highest impact on profitability.


--------------------------------------------------
-- 3. Region-wise Sales Contribution Percentage
--------------------------------------------------
-- Business Question:
-- How much does each region contribute to total sales?

SELECT
    sr.Region,
    ROUND(SUM(so.Line_Total), 2) AS Regional_Sales,
    ROUND(
        SUM(so.Line_Total) * 100.0 /
        SUM(SUM(so.Line_Total)) OVER (),
        2
    ) AS Sales_Contribution_Percentage
FROM [Sales Orders] so
INNER JOIN Regions r
    ON so.Delivery_Region_Index = r.ID
INNER JOIN [State Regions] sr
    ON r.State_Code = sr.State_Code
GROUP BY sr.Region
ORDER BY Sales_Contribution_Percentage DESC;

-- Insight:
-- Reveals geographic concentration and regional dependency.


--------------------------------------------------
-- 4. Order-level Revenue Contribution Percentage
--------------------------------------------------
-- Business Question:
-- How much do the biggest orders contribute to total sales?

SELECT
    OrderNumber,
    ROUND(Line_Total, 2) AS Order_Sales,
    ROUND(
        Line_Total * 100.0 /
        SUM(Line_Total) OVER (),
        2
    ) AS Order_Contribution_Percentage
FROM [Sales Orders]
ORDER BY Order_Contribution_Percentage DESC;

-- Insight:
-- Highlights revenue concentration at the individual order level.


--------------------------------------------------
-- Key Learning:
--------------------------------------------------
-- Totals show performance.
-- Percentages show risk.
-- Contribution analysis reveals business dependency.
--------------------------------------------------
