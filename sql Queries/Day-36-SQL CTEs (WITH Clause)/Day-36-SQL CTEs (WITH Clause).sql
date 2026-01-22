/*
Day 36 – SQL CTEs (WITH Clause) | Clean, Scalable Business Analysis
Project: Sales Analysis
Tool: SQL Server (SSMS)
Author: Mohammad Ali

Objective:
Use Common Table Expressions (CTEs) to simplify complex SQL logic,
improve readability, and build scalable, reusable business analysis queries.

CTEs transform nested queries into clear analytical steps,
making SQL more maintainable and business-friendly.
*/

--------------------------------------------------
-- 1. Customer Sales & Profit Benchmarking
--------------------------------------------------
-- Business Question:
-- Which customers perform above the average customer?

WITH CustomerSales AS
(
    SELECT
        c.Customer_Names,
        SUM(so.Line_Total) AS Total_Sales,
        SUM(so.Profit) AS Total_Profit
    FROM [Sales Orders] so
    INNER JOIN Customers c
        ON c.Customer_Index = so.Customer_Name_Index
    GROUP BY c.Customer_Names
)
SELECT
    Customer_Names,
    ROUND(Total_Sales, 2) AS Total_Sales,
    ROUND(Total_Profit, 2) AS Total_Profit
FROM CustomerSales
WHERE Total_Sales >
(
    SELECT AVG(Total_Sales)
    FROM CustomerSales
)
ORDER BY Total_Sales DESC;


-- Insight:
-- Identifies customers who outperform the average customer benchmark.


--------------------------------------------------
-- 2. Product Profitability Classification
--------------------------------------------------
-- Business Question:
-- Which products are high-profit vs low-profit?

WITH ProductProfit AS
(
    SELECT
        p.Product_Name,
        SUM(so.Profit) AS Total_Profit
    FROM [Sales Orders] so
    INNER JOIN Products p
        ON p.Product_Description_Index = so.Product_Description_Index
    GROUP BY p.Product_Name
)
SELECT
    Product_Name,
    ROUND(Total_Profit, 2) AS Total_Profit,
    CASE
        WHEN Total_Profit >= 30000000 THEN 'High Profit Product'
        WHEN Total_Profit BETWEEN 10000000 AND 29999999 THEN 'Medium Profit Product'
        ELSE 'Low Profit Product'
    END AS Profit_Category
FROM ProductProfit
ORDER BY Total_Profit DESC;

-- Insight:
-- Supports pricing, cost control, and product portfolio decisions.


--------------------------------------------------
-- 3. Regional Performance Comparison
--------------------------------------------------
-- Business Question:
-- Which regions outperform the company average?

WITH RegionalPerformance AS
(
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
)
SELECT
    Region,
    ROUND(Regional_Sales, 2) AS Regional_Sales,
    ROUND(Regional_Profit, 2) AS Regional_Profit
FROM RegionalPerformance
WHERE Regional_Sales >
(
    SELECT AVG(Regional_Sales)
    FROM RegionalPerformance
)
ORDER BY Regional_Sales DESC;

-- Insight:
-- Enables region-wise investment and expansion prioritisation.


--------------------------------------------------
-- 4. Customer Engagement Segmentation
--------------------------------------------------
-- Business Question:
-- Which customers are highly engaged vs low engaged?

WITH CustomerOrders AS
(
    SELECT
        c.Customer_Names,
        COUNT(so.OrderNumber) AS Order_Count
    FROM [Sales Orders] so
    INNER JOIN Customers c
        ON c.Customer_Index = so.Customer_Name_Index
    GROUP BY c.Customer_Names
)
SELECT
    Customer_Names,
    Order_Count,
    CASE
        WHEN Order_Count >= 450 THEN 'Highly Engaged'
        WHEN Order_Count BETWEEN 350 AND 449 THEN 'Moderately Engaged'
        ELSE 'Low Engagement'
    END AS Engagement_Level
FROM CustomerOrders
ORDER BY Order_Count DESC;

-- Insight:
-- Supports customer retention, loyalty, and lifecycle strategies.


--------------------------------------------------
-- 5. Orders vs Customer Average (CTE-Based Benchmarking)
--------------------------------------------------
-- Business Question:
-- Is an order above or below the customer’s normal behaviour?

WITH CustomerAvg AS
(
    SELECT
        Customer_Name_Index,
        AVG(Line_Total) AS Avg_Order_Value
    FROM [Sales Orders]
    GROUP BY Customer_Name_Index
)
SELECT
    so.OrderNumber,
    c.Customer_Names,
    ROUND(so.Line_Total, 2) AS Order_Sales,
    ROUND(ca.Avg_Order_Value, 2) AS Avg_Order_Value,
    ROUND(so.Line_Total - ca.Avg_Order_Value, 2) AS Sales_Difference
FROM [Sales Orders] so
INNER JOIN CustomerAvg ca
    ON so.Customer_Name_Index = ca.Customer_Name_Index
INNER JOIN Customers c
    ON c.Customer_Index = so.Customer_Name_Index
ORDER BY Sales_Difference DESC;

-- Insight:
-- Useful for upselling, anomaly detection, and sales recovery.


--------------------------------------------------
-- Key Learning:
--------------------------------------------------
-- Complex SQL doesn’t have to be messy.
-- CTEs turn logic into layers,
-- and layers into clarity.
--------------------------------------------------
