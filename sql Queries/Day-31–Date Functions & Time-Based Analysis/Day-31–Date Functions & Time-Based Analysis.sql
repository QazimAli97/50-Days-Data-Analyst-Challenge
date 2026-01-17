/* 
Day 31 – Date Functions & Time-Based Analysis
Project: Sales Analysis
Tool: SQL Server (SSMS)
Author: Mohammad Ali

Objective:
Analyse business performance over time using SQL date functions
without relying on shipping or delivery columns.
*/

--------------------------------------------------
-- 1. Year-wise Sales & Profit Performance
--------------------------------------------------
-- Business Question:
-- How is the business performing year over year?

SELECT
    YEAR(OrderDate) AS Order_Year,
    ROUND(SUM(Line_Total), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit
FROM [Sales Orders]
GROUP BY YEAR(OrderDate)
ORDER BY Order_Year;

--------------------------------------------------
-- 2. Month-wise Sales & Profit Trend
--------------------------------------------------
-- Business Question:
-- Which months generate the highest sales and profit?

SELECT
    MONTH(OrderDate) AS Order_Month,
    ROUND(SUM(Line_Total), 2) AS Monthly_Sales,
    ROUND(SUM(Profit), 2) AS Monthly_Profit
FROM [Sales Orders]
GROUP BY MONTH(OrderDate)
ORDER BY Monthly_Sales DESC;

--------------------------------------------------
-- 3. Year-Month Sales Trend (Seasonality)
--------------------------------------------------
-- Business Question:
-- How do sales change across months for each year?

SELECT
    YEAR(OrderDate) AS Order_Year,
    MONTH(OrderDate) AS Order_Month,
    ROUND(SUM(Line_Total), 2) AS Total_Sales
FROM [Sales Orders]
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY Order_Year, Order_Month;

--------------------------------------------------
-- 4. Monthly Order Volume
--------------------------------------------------
-- Business Question:
-- In which months do customers place the most orders?

SELECT
    YEAR(OrderDate) AS Order_Year,
    MONTH(OrderDate) AS Order_Month,
    COUNT(OrderNumber) AS Total_Orders
FROM [Sales Orders]
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY Total_Orders DESC;

--------------------------------------------------
-- 5. Average Order Value by Month
--------------------------------------------------
-- Business Question:
-- How does average order value change over time?

SELECT
    YEAR(OrderDate) AS Order_Year,
    MONTH(OrderDate) AS Order_Month,
    ROUND(AVG(Line_Total), 2) AS Avg_Order_Value
FROM [Sales Orders]
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY Avg_Order_Value DESC;
