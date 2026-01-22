# Day 36 – SQL CTEs (WITH Clause) | Clean, Scalable Business Analysis

## 📌 Project: Sales Analysis  
**Tool:** SQL Server (SSMS)  
**Author:** Mohammad Ali  

---

## 🎯 Objective

To use **Common Table Expressions (CTEs)** to simplify complex SQL logic, improve readability, and create **scalable, reusable business analysis queries**.

CTEs allow SQL logic to be broken into logical layers, making queries easier to maintain, audit, and extend for production analytics.

---

## 🧠 Business Problem

Traditional nested queries become difficult to read and error-prone as complexity grows.

This project demonstrates how CTEs can be used to:
- Standardise business metrics  
- Improve query maintainability  
- Enable benchmark-driven analysis  
- Support production-level analytics and dashboards  

---

## 🔍 Business Questions Answered

### 1️⃣ Customer Sales & Profit Benchmarking
**Question:**  
Which customers perform above the average customer?

**Insight:**  
A small group of customers contributes disproportionately to total sales and profit.

---

### 2️⃣ Product Profitability Classification
**Question:**  
Which products are high-profit vs low-profit?

**Insight:**  
Only a limited number of products qualify as high-margin, making them critical to protect and scale.

---

### 3️⃣ Regional Performance Comparison
**Question:**  
Which regions outperform the company average?

**Insight:**  
Regional performance is uneven, with one region acting as the primary growth engine.

---

### 4️⃣ Customer Engagement Segmentation
**Question:**  
Which customers are highly engaged vs low engaged?

**Insight:**  
Highly engaged customers place 500+ orders and represent strong long-term value.

---

### 5️⃣ Orders vs Customer Average
**Question:**  
Is an order above or below a customer’s normal behaviour?

**Insight:**  
Customer-level benchmarking reveals upselling opportunities and early warning signals for disengagement.

---

## 🛠️ SQL Concepts Used

- Common Table Expressions (CTEs – `WITH`)
- `CASE WHEN`
- Aggregate functions (`SUM`, `AVG`, `COUNT`)
- `JOIN`
- Business segmentation & benchmarking logic
- Scalable SQL design patterns

---

## 📊 Key Business Insights

- Revenue and profit are concentrated among a small set of customers  
- High-margin products drive profitability more than sales volume  
- Regional benchmarking improves investment decisions  
- Engagement metrics strengthen customer retention strategies  
- CTEs make complex business logic easier to audit and scale  

---

## 💼 Business Impact & Recommendations

- Prioritise high-performing customers for retention and expansion  
- Protect and scale high-margin products  
- Allocate resources toward top-performing regions  
- Use engagement-based segmentation to reduce churn  
- Adopt CTE-based SQL for maintainable production analytics  

---

## 🎯 Key Learning

**Complex SQL doesn’t have to be complex to read.**

CTEs transform raw queries into **layered business logic**, enabling faster insights and better decisions.

---
