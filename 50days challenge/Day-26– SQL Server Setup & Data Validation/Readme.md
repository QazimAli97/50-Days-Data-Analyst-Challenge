# Day 26 – SQL Server Setup & Data Validation

## Overview
Day 26 begins the SQL phase of my **50 Days Data Analyst Challenge**.

The objective was to prepare a clean, query-ready dataset by
designing the database schema, importing data, and validating data quality
before performing any analytical queries.

This step ensures all future SQL analysis is built on reliable data.

---

## Tools Used
- SQL Server
- SQL Server Management Studio (SSMS)

---

## Work Performed

### 1. Database & Table Design
- Created a dedicated database for sales analysis
- Designed a main transactional table (`sales_orders`)
- Chose appropriate data types for dates, numeric values, and text fields

### 2. Data Import
- Imported Excel data into SQL Server
- Verified successful data load into the target table

### 3. Data Validation
- Verified total row count
- Checked date ranges for order dates
- Validated uniqueness of order identifiers
- Performed sanity checks on:
  - Negative sales
  - Invalid quantities

### 4. Documentation
- Added structured SQL comments explaining:
  - Objective
  - Dataset details
  - Validation steps
  - Analysis readiness

---

## Key Learning
Effective SQL analysis begins with **proper data preparation**.

Validating schema, data types, and data quality before writing analytical queries
ensures that insights generated later are accurate, reliable, and trusted by stakeholders.

---

## Author
Mohammad Ali  
Aspiring Data Analyst | Excel • SQL • Power BI  
50 Days of Data Analytics Challenge
