/*
Day 39 – Profitability Ratios & Contribution Analysis using SQL
Project: Sales Analysis
Tool: SQL Server (SSMS)
Author: Mohammad Ali

Objective:
Analyse profitability ratios instead of absolute numbers
to identify margin leakage, inefficiencies, and
value-destroying entities across products, customers, and regions.

Revenue shows scale.
Margins show business health.
*/

--------------------------------------------------
-- 1. Product Profit Margin Analysis
--------------------------------------------------
-- Business Question:
-- Which products have low profit margins despite high sales?

SELECT
    p.Product_Name,
    ROUND(SUM(so.Line_Total), 2) AS Total_Sales,
    ROUND(SUM(so.Profit), 2) AS Total_Profit,
    CAST(
        (SUM(so.Profit) * 100.0) /
        NULLIF(SUM(so.Line_Total), 0)
        AS DECIMAL(10,2)
    ) AS Profit_Margin_Percent
FROM [Sales Orders] so
INNER JOIN Products p
    ON p.Product_Description_Index = so.Product_Description_Index
GROUP BY p.Product_Name
ORDER BY Profit_Margin_Percent ASC;

-- Insight:
-- Identifies margin killers, not just low-profit products.


--------------------------------------------------
-- 2. Customer Profitability Efficiency
--------------------------------------------------
-- Business Question:
-- Which customers generate revenue but dilute profitability?

SELECT
    c.Customer_Names,
    ROUND(SUM(so.Line_Total), 2) AS Total_Sales,
    ROUND(SUM(so.Profit), 2) AS Total_Profit,
    CAST(
        (SUM(so.Profit) * 100.0) /
        NULLIF(SUM(so.Line_Total), 0)
        AS DECIMAL(10,2)
    ) AS Customer_Profit_Margin
FROM [Sales Orders] so
INNER JOIN Customers c
    ON c.Customer_Index = so.Customer_Name_Index
GROUP BY c.Customer_Names
ORDER BY Customer_Profit_Margin ASC;

-- Insight:
-- Highlights high-maintenance or over-discounted customers.


--------------------------------------------------
-- 3. Regional Efficiency Analysis
--------------------------------------------------
-- Business Question:
-- Which regions are efficient vs inefficient in profitability?

SELECT
    sr.Region,
    ROUND(SUM(so.Line_Total), 2) AS Regional_Sales,
    ROUND(SUM(so.Profit), 2) AS Regional_Profit,
    CAST(
        (SUM(so.Profit) * 100.0) /
        NULLIF(SUM(so.Line_Total), 0)
        AS DECIMAL(10,2)
    ) AS Regional_Profit_Margin
FROM [Sales Orders] so
INNER JOIN Regions r
    ON so.Delivery_Region_Index = r.ID
INNER JOIN [State Regions] sr
    ON r.State_Code = sr.State_Code
GROUP BY sr.Region
ORDER BY Regional_Profit_Margin ASC;

-- Insight:
-- Reveals pricing, logistics, or cost inefficiencies by geography.


--------------------------------------------------
-- Key Learning:
--------------------------------------------------
-- Revenue tells how big the business is.
-- Margins tell how healthy the business is.
-- Profitability ratios drive executive decisions.
--------------------------------------------------
