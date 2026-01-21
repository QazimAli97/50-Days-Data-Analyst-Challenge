/*  
Day 35 – SQL Subqueries | Business Benchmarking & Comparative Analysis
Project: Sales Analysis
Tool: SQL Server (SSMS)
Author: Mohammad Ali

Objective:
Use SQL Subqueries to compare individual entities (orders, customers,
products, regions) against business benchmarks such as averages,
totals, and thresholds.

Subqueries help answer:
"Compared to what?" — which is critical for strategic decisions.
*/

--------------------------------------------------
-- 1. Orders Above Average Order Value
--------------------------------------------------
-- Business Question:
-- Which orders perform better than the company’s average order value?

SELECT
    OrderNumber,
    ROUND(Line_Total, 2) AS Order_Sales
FROM [Sales Orders]
WHERE Line_Total >
(
    SELECT AVG(Line_Total)
    FROM [Sales Orders]
)
ORDER BY Order_Sales DESC;

-- Insight:
-- Identifies premium orders worth prioritising.


--------------------------------------------------
-- 2. Customers Performing Above Average Sales
--------------------------------------------------
-- Business Question:
-- Which customers contribute more than the average customer?

SELECT
    c.Customer_Names,
    ROUND(SUM(so.Line_Total), 2) AS Total_Sales
FROM [Sales Orders] so
INNER JOIN Customers c
    ON c.Customer_Index = so.Customer_Name_Index
GROUP BY c.Customer_Names
HAVING SUM(so.Line_Total) >
(
    SELECT AVG(Customer_Sales)
    FROM
    (
        SELECT SUM(Line_Total) AS Customer_Sales
        FROM [Sales Orders]
        GROUP BY Customer_Name_Index
    ) AS AvgCustomerSales
)
ORDER BY Total_Sales DESC;

-- Insight:
-- Separates high-performing customers from average contributors.


--------------------------------------------------
-- 3. Products with Below-Average Profit
--------------------------------------------------
-- Business Question:
-- Which products are underperforming in profitability?

SELECT
    p.Product_Name,
    ROUND(SUM(so.Profit), 2) AS Total_Profit
FROM [Sales Orders] so
INNER JOIN Products p
    ON p.Product_Description_Index = so.Product_Description_Index
GROUP BY p.Product_Name
HAVING SUM(so.Profit) <
(
    SELECT AVG(Product_Profit)
    FROM
    (
        SELECT SUM(Profit) AS Product_Profit
        FROM [Sales Orders]
        GROUP BY Product_Description_Index
    ) AS AvgProductProfit
)
ORDER BY Total_Profit ASC;

-- Insight:
-- Highlights products needing cost optimisation or pricing review.


--------------------------------------------------
-- 4. Regions Performing Better Than Average
--------------------------------------------------
-- Business Question:
-- Which regions outperform the company’s average regional sales?

SELECT
    sr.Region,
    ROUND(SUM(so.Line_Total), 2) AS Regional_Sales
FROM [Sales Orders] so
INNER JOIN Regions r
    ON so.Delivery_Region_Index = r.ID
INNER JOIN [State Regions] sr
    ON r.State_Code = sr.State_Code
GROUP BY sr.Region
HAVING SUM(so.Line_Total) >
(
    SELECT AVG(Region_Sales)
    FROM
    (
        SELECT SUM(so.Line_Total) AS Region_Sales
        FROM [Sales Orders] so
        INNER JOIN Regions r
            ON so.Delivery_Region_Index = r.ID
        INNER JOIN [State Regions] sr
            ON r.State_Code = sr.State_Code
        GROUP BY sr.Region
    ) AS AvgRegionSales
)
ORDER BY Regional_Sales DESC;

-- Insight:
-- Supports region-wise investment and expansion decisions.


--------------------------------------------------
-- 5. Orders Below Customer’s Own Average
--------------------------------------------------
-- Business Question:
-- Which orders underperform compared to a customer’s usual behaviour?

SELECT
    so.OrderNumber,
    c.Customer_Names,
    ROUND(so.Line_Total, 2) AS Order_Sales
FROM [Sales Orders] so
INNER JOIN Customers c
    ON c.Customer_Index = so.Customer_Name_Index
WHERE so.Line_Total <
(
    SELECT AVG(Line_Total)
    FROM [Sales Orders] so2
    WHERE so2.Customer_Name_Index = so.Customer_Name_Index
)
ORDER BY Order_Sales ASC;

-- Insight:
-- Useful for detecting sales drop-offs and upselling opportunities.


--------------------------------------------------
-- Key Learning:
--------------------------------------------------
-- Totals show performance.
-- Benchmarks reveal reality.
-- Subqueries enable context-aware decision-making.
--------------------------------------------------
