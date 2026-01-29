# Day 40 – Executive KPI Dashboard using SQL (Decision-Driven Analysis)

---

## 🎯 Objective

To design **executive-level KPIs directly in SQL** that support strategic decision-making rather than simple reporting.

This project focuses on converting raw transactional data into:
- Business health indicators  
- Profit efficiency metrics  
- Concentration and risk signals  
- Action-oriented insights  

---

## 🧠 Why This Matters

Most dashboards show **what happened**.  
Executives care about **what needs attention**.

This analysis answers:
- Is the business growing efficiently or just growing bigger?  
- Where does profit quality differ from revenue volume?  
- Is revenue overly dependent on a small set of customers or products?  
- Which areas offer the highest leverage for improvement?  

---

## 🔍 Business Questions Answered

### 1️⃣ Executive KPI Snapshot
**Purpose:**  
Provide a one-query overview of business health.

**Metrics Included:**
- Total orders  
- Total sales  
- Total profit  
- Average order value  
- Overall profit margin  

**Insight:**  
Establishes a baseline for profitability and operational health.

---

### 2️⃣ Revenue Concentration (Pareto Analysis)
**Purpose:**  
Identify customer dependency and concentration risk.

**Insight:**  
Revenue is distributed across customers, reducing reliance on a small number of accounts.

---

### 3️⃣ High-Revenue Products with Below-Average Margin
**Purpose:**  
Find products that drive scale but slightly dilute efficiency.

**Insight:**  
These products are optimisation targets where small improvements can yield large profit impact.

---

### 4️⃣ Bottom 20% Margin Products (Relative Risk)
**Purpose:**  
Identify the weakest performers using percentile-based benchmarks.

**Insight:**  
Even the lowest-margin products remain profitable, indicating strong pricing discipline and mature operations.

---

### 5️⃣ Region-wise Business Efficiency
**Purpose:**  
Compare profit quality across regions.

**Insight:**  
Regional margins are closely aligned, with incremental efficiency differences that can scale meaningfully.

---

## 🧮 SQL Concepts Used

- Common Table Expressions (CTEs)  
- Window Functions  
- Running totals  
- Pareto (80/20) analysis  
- Percentile-based benchmarking  
- Profit margin calculations  
- Executive KPI design  

---

## 📊 Key Business Insights

- The business operates with strong overall profitability  
- Revenue concentration risk is controlled  
- Efficiency varies more than volume  
- High-volume areas offer the greatest optimisation leverage  
- Relative benchmarks are more actionable than fixed thresholds  

---

## 💼 Business Impact & Recommendations

- Prioritise **margin-quality growth** over volume growth  
- Optimise pricing and cost structures for high-impact products  
- Monitor efficiency trends continuously  
- Use SQL-generated KPIs to support leadership decisions  
- Treat SQL as a strategic analytics layer, not just a query tool  

---

## 🎯 Key Learning

**Executives don’t manage totals.  
They manage efficiency, risk, and focus.**

Well-designed SQL transforms data into decisions.

---
