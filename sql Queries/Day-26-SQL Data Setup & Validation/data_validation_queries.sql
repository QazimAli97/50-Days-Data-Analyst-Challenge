/* 
Day 26 – SQL Data Setup & Validation
Project: Sales Analysis


Objective:
To create a clean, query-ready transactional sales table by
designing schema, importing data, and validating data quality
before starting SQL analysis.

Dataset:
- Source: Excel Sales Dataset
- Level: Order-line (transactional)
- Key fields: Order, Customer, Product, Region, Sales, Profit

Actions Performed:
1. Created database for sales analysis
2. Designed main fact table (sales_orders)
3. Load data into SQL Server
4. Validated row counts and date ranges
5. Performed basic data quality checks

Status:
Data successfully imported and validated.
Ready for SQL analysis (Day 27 onwards).
*/


-- Check total number of records imported
select count(*)[Total Rows] from [sales Orders]

-- Preview sample records
select top 10 * from [sales Orders] 


-- Validate date range
select min(orderDate)[Min_Date],
max(orderdate)[Max_Date]
from [sales Orders]


-- Check uniqueness of orders
select distinct(orderNumber)[Unique Orders] from [sales Orders]
order by orderNumber 



-- Data Quality Checks
select count(*)[Negative Sales] from [sales Orders]
where Line_Total < 0


select count(*)[Invalid Quantity] from [sales Orders]
where Order_Quantity <=0
