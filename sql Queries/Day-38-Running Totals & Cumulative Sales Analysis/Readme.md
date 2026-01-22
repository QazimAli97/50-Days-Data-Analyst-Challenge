# Day 38 – Running Totals & Cumulative Sales Analysis using SQL

## 📌 Project: Sales Analysis  
**Tool:** SQL Server (SSMS)  
**Author:** Mohammad Ali  

---

## 🎯 Objective

To analyse **cumulative (running) sales and profit over time** using SQL window functions in order to understand:

- Growth momentum  
- Trend direction  
- Business stability  
- Long-term value accumulation  

Running totals help move beyond daily fluctuations and reveal the **true growth trajectory** of the business.

---

## 🧠 Why Cumulative Analysis Matters

Daily transactional data shows activity.  
**Cumulative metrics show direction and momentum.**

This analysis helps businesses answer:
- Are we growing steadily or unevenly?  
- When did growth accelerate or slow down?  
- How much value has accumulated up to any point in time?  

---

## 🔍 Business Questions Answered

### 1️⃣ Cumulative Sales Over Time
**Question:**  
How does total sales accumulate over time?

**Insight:**  
Cumulative sales show a steady upward trend despite daily volatility, revealing consistent business growth.

---

### 2️⃣ Cumulative Profit Over Time
**Question:**  
How does profit accumulate alongside sales?

**Insight:**  
Profit grows with sales but at varying rates, helping identify periods of margin pressure or improved efficiency.

---

### 3️⃣ Monthly Cumulative Sales
**Question:**  
How does cumulative performance look at a monthly level?

**Insight:**  
Monthly aggregation smooths daily noise and provides a clearer executive-level view of growth trends.

---

### 4️⃣ Cumulative Sales by Customer
**Question:**  
How does sales accumulate for each customer over time?

**Insight:**  
Customer-level cumulative analysis highlights loyalty, repeat purchases, and long-term customer value.

---

## 🛠️ SQL Concepts Used

- Window functions (`SUM() OVER()`)
- `ORDER BY` within window frames
- `PARTITION BY` for customer-level analysis
- Running totals & cumulative metrics
- Time-based financial analysis

---

## 📊 Key Business Insights

- Revenue growth is cumulative rather than linear  
- Daily volatility can mask long-term trends  
- Monthly cumulative metrics improve decision clarity  
- Customer-level running totals reveal long-term value patterns  
- Growth momentum is clearer through cumulative views than raw totals  

---

## 💼 Business Impact & Recommendations

- Track **business momentum**, not just daily performance  
- Monitor profit accumulation alongside revenue growth  
- Identify growth slowdowns early using trend analysis  
- Prioritise retention for customers with rising cumulative value  
- Use cumulative metrics to support forecasting and strategic planning  

---

## 🎯 Key Learning

**Daily numbers show activity.  
Cumulative numbers show direction.**

Running totals convert transactional data into **growth intelligence**.
