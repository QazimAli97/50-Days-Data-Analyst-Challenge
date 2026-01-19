# Day 33 – SQL Window Functions | Advanced Business Analysis

## 📌 Project Overview
This project explores **SQL Window Functions** to perform advanced
business analysis without losing row-level detail.

Window functions enable ranking, comparison, and cumulative analysis
that traditional GROUP BY queries cannot support.

---

## 🎯 Objectives
- Rank customers and products based on performance
- Analyse order sequences without aggregating data
- Track cumulative sales growth over time
- Compare individual orders against customer averages
- Support prioritisation and performance benchmarking

---

## 📊 Business Questions Answered
- Who are the top customers by revenue?
- Which products generate the highest profit?
- How do customer orders progress over time?
- How does cumulative sales evolve?
- Which orders outperform customer averages?

---

## 🧠 Key Insights
- Revenue and profit distribution is highly concentrated
- Ranking helps identify priority customers and products instantly
- Running totals reveal growth trends and momentum shifts
- Not every large order is strong relative to customer behaviour
- Contextual comparison adds deeper decision-making power

---

## 💼 Business Impact & Recommendations
- Use rankings to prioritise key accounts and products
- Monitor running totals to track business momentum
- Identify underperforming orders relative to customer norms
- Support sales strategy using relative performance metrics
- Enable smarter targeting and forecasting decisions

---

## 🛠 SQL Concepts Used
- `RANK()`
- `DENSE_RANK()`
- `ROW_NUMBER()`
- `OVER()`
- `PARTITION BY`
- Running totals with window frames
- `ROUND()` for financial precision

---

## 🧰 Tools Used
- SQL Server
- SQL Server Management Studio (SSMS)

---

## 🚀 Outcome
Window functions transform raw transactional data into **context-rich insights**,
enabling better prioritisation, trend analysis, and business decision-making.

---

## 👤 Author
**Mohammad Ali**  
Aspiring Data Analyst  
50 Days Data Analyst Challenge
