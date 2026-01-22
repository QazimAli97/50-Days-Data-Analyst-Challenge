/*
Day 38 – Running Totals & Cumulative Sales Analysis using SQL
Project: Sales Analysis
Tool: SQL Server (SSMS)
Author: Mohammad Ali

Objective:
Analyse cumulative (running) sales and profit over time
to understand growth momentum, trend direction, and
overall business stability using window functions.
*/

--------------------------------------------------
-- 1. Cumulative Sales Over Time
--------------------------------------------------
-- Business Question:
-- How does total sales accumulate over time?

SELECT
    OrderDate,
    ROUND(Line_Total, 2) AS Daily_Sales,
    CAST(
        SUM(Line_Total) OVER (
            ORDER BY OrderDate
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS DECIMAL(18,2)
    ) AS Cumulative_Sales
FROM [Sales Orders]
ORDER BY OrderDate;

-- Insight:
-- Shows overall revenue growth trajectory and momentum.


--------------------------------------------------
-- 2. Cumulative Profit Over Time
--------------------------------------------------
-- Business Question:
-- How does profit accumulate alongside sales?

SELECT
    OrderDate,
    ROUND(Profit, 2) AS Daily_Profit,
    CAST(
        SUM(Profit) OVER (
            ORDER BY OrderDate
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS DECIMAL(18,2)
    ) AS Cumulative_Profit
FROM [Sales Orders]
ORDER BY OrderDate;

-- Insight:
-- Helps detect profit acceleration or margin pressure.


--------------------------------------------------
-- 3. Monthly Cumulative Sales
--------------------------------------------------
-- Business Question:
-- How does cumulative performance look at a monthly level?

SELECT
    YEAR(OrderDate) AS Order_Year,
    MONTH(OrderDate) AS Order_Month,
    ROUND(SUM(Line_Total), 2) AS Monthly_Sales,
    CAST(
        SUM(SUM(Line_Total)) OVER (
            ORDER BY YEAR(OrderDate), MONTH(OrderDate)
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS DECIMAL(18,2)
    ) AS Cumulative_Monthly_Sales
FROM [Sales Orders]
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY Order_Year, Order_Month;

-- Insight:
-- Smooths daily volatility and supports executive trend reporting.


--------------------------------------------------
-- 4. Cumulative Sales by Customer
--------------------------------------------------
-- Business Question:
-- How does sales accumulate for each customer over time?

SELECT
    c.Customer_Names,
    so.OrderDate,
    ROUND(so.Line_Total, 2) AS Order_Sales,
    CAST(
        SUM(so.Line_Total) OVER (
            PARTITION BY c.Customer_Names
            ORDER BY so.OrderDate
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS DECIMAL(18,2)
    ) AS Customer_Cumulative_Sales
FROM [Sales Orders] so
INNER JOIN Customers c
    ON c.Customer_Index = so.Customer_Name_Index
ORDER BY c.Customer_Names, so.OrderDate;

-- Insight:
-- Highlights customer growth patterns, loyalty, and long-term value.


--------------------------------------------------
-- Key Learning:
--------------------------------------------------
-- Daily numbers show activity.
-- Cumulative numbers show direction.
-- Running totals convert transactions into growth intelligence.
--------------------------------------------------
