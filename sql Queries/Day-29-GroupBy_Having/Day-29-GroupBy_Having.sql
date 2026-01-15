/* 
Day 29 – GROUP BY & HAVING (Filtering Aggregated Data)
Project: Sales Analysis
Tool: SQL Server (SSMS)
Author: Mohammad Ali

Objective:
Use GROUP BY and HAVING to analyse aggregated data
and identify performance gaps, risks, and opportunities.
*/

--------------------------------------------------
-- 1. Products with Low Profit Contribution
--------------------------------------------------
-- Business Question:
-- Which products generate sales but low total profit?

SELECT
    Product_Name,
    SUM(Line_Total) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM [Sales Orders]
INNER JOIN Products
    ON [Sales Orders].Product_Description_Index = Products.Product_Description_Index
GROUP BY Product_Name
HAVING SUM(Profit) < 50000000
ORDER BY Total_Profit ASC;



--------------------------------------------------
-- 2. Customers with High Sales but Low Profit
--------------------------------------------------
-- Business Question:
-- Which customers generate high revenue but weak profitability?

SELECT
    c.Customer_Names,
    SUM(so.Line_Total) AS Total_Sales,
    SUM(so.Profit) AS Total_Profit
FROM [Sales Orders] so
INNER JOIN Customers c
    ON c.Customer_Index = so.Customer_Name_Index
GROUP BY c.Customer_Names
HAVING SUM(so.Line_Total) > 100000
   AND SUM(so.Profit) < 20000
ORDER BY Total_Sales DESC;

--------------------------------------------------
-- 3. Regions with Weak Profit Performance
--------------------------------------------------
-- Business Question:
-- Which regions have low profitability?

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
HAVING SUM(so.Profit) < 10000
ORDER BY Regional_Profit ASC;

--------------------------------------------------
-- 4. Products with High Average Sales but Low Average Profit
--------------------------------------------------
-- Business Question:
-- Which products sell well but have weak margins?

SELECT
    p.Product_Name,
    AVG(so.Line_Total) AS Avg_Sales_Per_Order,
    AVG(so.Profit) AS Avg_Profit_Per_Order
FROM [Sales Orders] so
INNER JOIN Products p
    ON p.Product_Description_Index = so.Product_Description_Index
GROUP BY p.Product_Name
HAVING AVG(so.Line_Total) > 20000
   AND AVG(so.Profit) < 2000
ORDER BY Avg_Sales_Per_Order DESC;

--------------------------------------------------
-- 5. Customers with Minimum Order Volume
--------------------------------------------------
-- Business Question:
-- Which customers place very few orders?

SELECT
    c.Customer_Names,
    COUNT(so.OrderNumber) AS Order_Count,
    SUM(so.Line_Total) AS Total_Sales
FROM [Sales Orders] so
INNER JOIN Customers c
    ON c.Customer_Index = so.Customer_Name_Index
GROUP BY c.Customer_Names
HAVING COUNT(so.OrderNumber) <= 2
ORDER BY Order_Count ASC;
