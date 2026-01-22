# Day 37 – Percentage Contribution Analysis using SQL OVER()

## 📌 Project: Sales Analysis  
**Tool:** SQL Server (SSMS)  
**Author:** Mohammad Ali  

---

## 🎯 Objective

To analyse **percentage contribution of customers, products, regions, and orders** to total sales and profit using SQL **window functions (`OVER()`)**.

This analysis helps businesses understand:
- Revenue concentration risk  
- Key account dependency  
- Product and regional dominance  
- Sustainability of revenue sources  

---

## 🧠 Why Contribution Analysis Matters

Absolute numbers show *how much* revenue is generated.  
**Percentage contribution shows how dependent the business is on specific entities.**

This perspective is critical for:
- Risk management  
- Strategic planning  
- Portfolio diversification  

---

## 🔍 Business Questions Answered

### 1️⃣ Customer Sales Contribution (%)
**Question:**  
Which customers contribute the highest percentage of total sales?

**Insight:**  
Top customers contribute approximately **~1% each**.  
Revenue is distributed across many customers, indicating **low single-customer risk** but **tier-based concentration**.

---

### 2️⃣ Product Profit Contribution (%)
**Question:**  
Which products drive the most profit?

**Insight:**  
A small set of products contributes a **significant share of total profit**, with the top product contributing **~9.6%** alone.  
Profit concentration is higher than revenue concentration.

---

### 3️⃣ Region-wise Sales Contribution (%)
**Question:**  
How much does each region contribute to total sales?

**Insight:**  
The **West region contributes ~30%** of total sales, followed by **South (~27%)** and **Mid (~26%)**.  
There is clear geographic dependency.

---

### 4️⃣ Order-level Revenue Contribution (%)
**Question:**  
How much does each order contribute to total sales?

**Insight:**  
Individual orders contribute very small percentages.  
This highlights the importance of **high-precision or cumulative analysis** rather than isolated order-level percentages.

---

## 🛠️ SQL Concepts Used

- Window functions (`OVER()`)
- Aggregate functions (`SUM`)
- Percentage calculations
- `ROUND()` and `CAST()` for financial precision
- Business concentration analysis

---

## 📊 Key Business Insights

- Revenue is diversified across many customers but concentrated within top segments  
- Profit dependency is higher than revenue dependency  
- Regional performance drives overall business stability  
- Order-level contribution requires cumulative analysis for meaningful insights  
- Percentage metrics reveal risk hidden by absolute values  

---

## 💼 Business Impact & Recommendations

- Monitor **top customer tiers**, not just individual customers  
- Strengthen **mid-tier customers** to reduce concentration risk  
- Protect and scale **high profit–contributing products**  
- Diversify regional revenue sources  
- Use contribution percentages as early warning indicators  

---

## 🎯 Key Learning

**Totals show performance.  
Percentages show risk.**

Understanding contribution patterns is essential for **sustainable, long-term business growth**.

