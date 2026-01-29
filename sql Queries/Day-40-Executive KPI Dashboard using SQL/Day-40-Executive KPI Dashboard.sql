/*
Day 40 – Executive KPI Dashboard using SQL (Decision-Driven Analysis)
Project: Sales Analysis
Tool: SQL Server (SSMS)
Author: Mohammad Ali

Objective:
Create C-level KPIs directly in SQL to assess
business health, efficiency, concentration risk,
and relative profitability — not just raw totals.

This version uses DATA-DRIVEN benchmarks
instead of arbitrary thresholds.
*/

--------------------------------------------------
-- 1. Executive KPI Snapshot (Business Health)
--------------------------------------------------
-- Business Question:
-- How healthy is the business overall?

SELECT
    COUNT(DISTINCT OrderNumber) AS Total_Orders,
    ROUND(SUM(Line_Total), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(AVG(Line_Total), 2) AS Avg_Order_Value,
    CAST(
        (SUM(Profit) * 100.0) /
        NULLIF(SUM(Line_Total), 0)
        AS DECIMAL(10,2)
    ) AS Overall_Profit_Margin
FROM [Sales Orders];

-- Executive Insight:
-- One query gives leadership a full business snapshot.


--------------------------------------------------
-- 2. Revenue Concentration (Pareto 80/20 Analysis)
--------------------------------------------------
-- Business Question:
-- Where does revenue dependency exist?

WITH CustomerRevenue AS (
    SELECT
        c.Customer_Names,
        SUM(so.Line_Total) AS Total_Sales
    FROM [Sales Orders] so
    INNER JOIN Customers c
        ON c.Customer_Index = so.Customer_Name_Index
    GROUP BY c.Customer_Names
),
RankedCustomers AS (
    SELECT
        Customer_Names,
        Total_Sales,
        SUM(Total_Sales) OVER () AS Overall_Sales,
        SUM(Total_Sales) OVER (
            ORDER BY Total_Sales DESC
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS Running_Sales
    FROM CustomerRevenue
)
SELECT
    Customer_Names,
    ROUND(Total_Sales, 2) AS Total_Sales,
    CAST(
        (Running_Sales * 100.0) /
        NULLIF(Overall_Sales, 0)
        AS DECIMAL(10,2)
    ) AS Cumulative_Sales_Percent
FROM RankedCustomers
WHERE (Running_Sales * 100.0) / Overall_Sales <= 80
ORDER BY Total_Sales DESC;

-- Executive Insight:
-- Identifies customer concentration and dependency risk.


--------------------------------------------------
-- 3. High-Revenue Products with BELOW-AVERAGE Margin
--------------------------------------------------
-- Business Question:
-- Which big products underperform relative to peers?

WITH ProductMargins AS (
    SELECT
        p.Product_Name,
        SUM(so.Line_Total) AS Total_Sales,
        (SUM(so.Profit) * 100.0) /
        NULLIF(SUM(so.Line_Total), 0) AS Profit_Margin
    FROM [Sales Orders] so
    INNER JOIN Products p
        ON p.Product_Description_Index = so.Product_Description_Index
    GROUP BY p.Product_Name
)
SELECT
    Product_Name,
    ROUND(Total_Sales, 2) AS Total_Sales,
    CAST(Profit_Margin AS DECIMAL(10,2)) AS Profit_Margin
FROM ProductMargins
WHERE Total_Sales > 5000000
  AND Profit_Margin < (SELECT AVG(Profit_Margin) FROM ProductMargins)
ORDER BY Profit_Margin ASC;

-- Executive Insight:
-- High-volume products that silently dilute profitability.


--------------------------------------------------
-- 4. Bottom 20% Margin Products (Relative Risk)
--------------------------------------------------
-- Business Question:
-- Which products are weakest in profitability overall?

WITH ProductMargins AS (
    SELECT
        p.Product_Name,
        (SUM(so.Profit) * 100.0) /
        NULLIF(SUM(so.Line_Total), 0) AS Profit_Margin
    FROM [Sales Orders] so
    INNER JOIN Products p
        ON p.Product_Description_Index = so.Product_Description_Index
    GROUP BY p.Product_Name
),
MarginPercentile AS (
    SELECT
        *,
        PERCENTILE_CONT(0.2)
        WITHIN GROUP (ORDER BY Profit_Margin)
        OVER () AS Margin_20th_Percentile
    FROM ProductMargins
)
SELECT
    Product_Name,
    CAST(Profit_Margin AS DECIMAL(10,2)) AS Profit_Margin
FROM MarginPercentile
WHERE Profit_Margin <= Margin_20th_Percentile
ORDER BY Profit_Margin ASC;


-- Executive Insight:
-- Identifies relative underperformers using percentile logic.


--------------------------------------------------
-- 5. Region-wise Business Efficiency
--------------------------------------------------
-- Business Question:
-- Which regions generate better profit per ₹ of sales?

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
ORDER BY Regional_Profit_Margin DESC;

-- Executive Insight:
-- Compares performance quality, not just revenue volume.


--------------------------------------------------
-- Key Learning:
--------------------------------------------------
-- Executives don’t manage totals.
-- They manage efficiency, risk, and focus.
-- SQL becomes a decision engine when KPIs are designed correctly.
--------------------------------------------------
