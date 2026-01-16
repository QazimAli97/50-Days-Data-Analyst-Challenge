/* 
Day 30 – Top vs Bottom Performance Analysis
Project: Sales Analysis
Tool: SQL Server (SSMS)
Author: Mohammad Ali

Objective:
Identify top-performing and bottom-performing products and regions
based on aggregated sales and profit to support prioritisation and
resource allocation decisions.
*/

--------------------------------------------------
-- 1. Top 10 Products by Total Sales
--------------------------------------------------
-- Business Question:
-- Which products contribute the most to revenue?

SELECT TOP 10
    p.Product_Name[Top 10 Products],
    round(SUM(so.Line_Total),2) AS Total_Sales,
    SUM(so.Profit) AS Total_Profit
FROM [Sales Orders] so
INNER JOIN Products p
    ON p.Product_Description_Index = so.Product_Description_Index
GROUP BY p.Product_Name
ORDER BY Total_Sales DESC;

--------------------------------------------------
-- 2. Bottom 10 Products by Total Sales
--------------------------------------------------
-- Business Question:
-- Which products contribute the least to revenue?

SELECT TOP 10
    p.Product_Name[Bottom 10 Products],
    round(SUM(so.Line_Total),2) AS Total_Sales,
    SUM(so.Profit) AS Total_Profit
FROM [Sales Orders] so
INNER JOIN Products p
    ON p.Product_Description_Index = so.Product_Description_Index
GROUP BY p.Product_Name
ORDER BY Total_Sales ASC;

--------------------------------------------------
-- 3. Top Regions by Sales & Profit
--------------------------------------------------
-- Business Question:
-- Which regions perform best overall?

SELECT
    sr.Region,
    round(SUM(so.Line_Total),2) AS Regional_Sales,
    SUM(so.Profit) AS Regional_Profit
FROM [Sales Orders] so
INNER JOIN Regions r
    ON so.Delivery_Region_Index = r.ID
INNER JOIN [State Regions] sr
    ON r.State_Code = sr.State_Code
GROUP BY sr.Region
ORDER BY Regional_Sales DESC;

--------------------------------------------------
-- 4. Bottom Regions by Profit
--------------------------------------------------
-- Business Question:
-- Which regions underperform in profitability?

SELECT
    sr.Region,
    round(SUM(so.Line_Total),2) AS Regional_Sales,
    SUM(so.Profit) AS Regional_Profit
FROM [Sales Orders] so
INNER JOIN Regions r
    ON so.Delivery_Region_Index = r.ID
INNER JOIN [State Regions] sr
    ON r.State_Code = sr.State_Code
GROUP BY sr.Region
ORDER BY Regional_Profit ASC;

--------------------------------------------------
-- 5. Products Ranked by Profit (Overall)
--------------------------------------------------
-- Business Question:
-- Which products contribute least and most to profit?

SELECT
    p.Product_Name,
    round(SUM(so.Line_Total),2) AS Total_Sales,
    SUM(so.Profit) AS Total_Profit
FROM [Sales Orders] so
INNER JOIN Products p
    ON p.Product_Description_Index = so.Product_Description_Index
GROUP BY p.Product_Name
ORDER BY Total_Profit DESC;
