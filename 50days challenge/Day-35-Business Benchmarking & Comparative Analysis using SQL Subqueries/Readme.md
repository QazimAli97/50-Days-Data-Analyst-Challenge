# Day 35 – SQL Subqueries | Business Benchmarking & Comparative Analysis

## 📌 Project: Sales Analysis  
**Tool:** SQL Server (SSMS)  
**Author:** Mohammad Ali  

---

## 🎯 Objective

To use **SQL Subqueries** to evaluate business performance **relative to benchmarks**, not just absolute values.

While aggregate functions show *what happened*,  
**subqueries answer the critical business question: _“Compared to what?”_**

This project focuses on comparing:
- Orders
- Customers
- Products
- Regions  

against company-wide and entity-level averages to support **strategic decision-making**.

---

## 🧠 Business Problem Statement

Many dashboards report totals and averages, but leadership decisions require **contextual comparison**.

This analysis demonstrates how SQL subqueries enable:
- Performance benchmarking  
- Underperformance detection  
- Strategic prioritisation  

instead of static reporting.

---

## 🔍 Business Questions Answered

### 1️⃣ Orders Above Average Order Value
**Question:**  
Which orders perform better than the company’s average order value?

**Business Value:**  
Identifies premium transactions worth prioritising.

---

### 2️⃣ Customers Performing Above Average Sales
**Question:**  
Which customers contribute more than the average customer?

**Business Value:**  
Separates high-impact customers from average contributors.

---

### 3️⃣ Products with Below-Average Profit
**Question:**  
Which products are underperforming in profitability?

**Business Value:**  
Highlights pricing, cost, or product strategy issues.

---

### 4️⃣ Regions Performing Better Than Average
**Question:**  
Which regions outperform the company’s average regional sales?

**Business Value:**  
Supports region-wise investment and expansion decisions.

---

### 5️⃣ Orders Below Customer’s Own Average
**Question:**  
Which orders underperform compared to a customer’s usual behaviour?

**Business Value:**  
Useful for detecting sales drop-offs and upselling opportunities.

---

## 🛠️ SQL Concepts Used

- Subqueries (scalar & derived tables)
- Aggregate functions: `AVG()`, `SUM()`
- `GROUP BY`
- `HAVING`
- `JOIN`
- Business benchmarking logic
- Comparative analysis techniques

---

## 📊 Key Insights

- A small percentage of orders outperform the average and drive major revenue
- Only a limited set of customers exceed the average customer contribution
- Several products fall below profitability benchmarks despite generating sales
- Regional sales performance varies significantly across the business
- Order-level benchmarking helps identify early signs of customer disengagement

---

## 💼 Business Impact & Recommendations

- Prioritise retention and expansion of above-average customers
- Review pricing and cost structures for underperforming products
- Allocate resources toward high-performing regions
- Train sales teams to recognise and recover below-average customer orders
- Shift from static KPIs to **benchmark-driven performance evaluation**

---

## 🎯 Key Learning

**Totals show activity.  
Benchmarks reveal performance.**

SQL becomes a strategic tool when it provides **context**, not just calculations.  
Subqueries enable analysts to move from reporting to **decision intelligence**.
