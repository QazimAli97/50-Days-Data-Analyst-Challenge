# Day 34 – Business Classification using SQL (CASE WHEN)

## Project: Sales Analysis  
**Tool:** SQL Server (SSMS)  
**Author:** Mohammad Ali  

---

## Objective
Transform raw transactional sales data into **business-friendly categories** using SQL `CASE WHEN` logic, enabling clearer insights for decision-making around revenue, profit, and customer engagement.

Instead of analysing only numeric metrics, this analysis focuses on **classification**, which is critical for real-world business reporting and strategy.

---

## Business Questions Addressed

- How can orders be classified into High, Medium, and Low value?
- Which customers contribute the most profit?
- Which products are high-margin vs low-margin?
- Which orders are healthy vs low-profit?
- Which customers show high engagement based on order frequency?

---

## Key SQL Concepts Used

- `CASE WHEN` for business rule classification  
- `SUM()`, `COUNT()`, `AVG()`  
- `GROUP BY`  
- `INNER JOIN`  
- Conditional business logic in SQL  
- Customer and product segmentation  

---

## Analysis Performed

### 1. Order Value Classification
Orders were categorised into:
- **High Value Orders**
- **Medium Value Orders**
- **Low Value Orders**

This helps identify where revenue is truly coming from.

---

### 2. Customer Profit Classification
Customers were segmented based on total profit contribution:
- High Profit Customers
- Moderate Profit Customers
- Low Profit Customers

This highlights **customer quality**, not just volume.

---

### 3. Product Margin Classification
Products were labelled as:
- High Margin Products
- Low Margin Products

Supporting pricing, inventory, and promotion decisions.

---

### 4. Order Profit Status
Orders were flagged as:
- Healthy Profit Orders
- Low Profit Orders
- Loss-Making Orders

Critical for detecting margin leakage.

---

### 5. Customer Engagement Level
Customers were categorised based on order frequency:
- Highly Engaged
- Moderately Engaged
- Low Engagement

Useful for retention and loyalty strategies.

---

## Key Insights

- A small number of **High Value Orders** drive a large portion of revenue
- Most top customers fall into **Moderate Profit**, indicating scope for margin optimisation
- High-margin products are limited and should be prioritised
- Several orders generate revenue but contribute weak or negative profit
- Highly engaged customers place **500+ orders**, representing strong long-term value

---

## Business Impact & Recommendations

- Focus sales strategy on increasing **order value**, not just order volume
- Review pricing and discount policies for **low-profit orders**
- Protect and scale **high-margin products**
- Design loyalty programs for **highly engaged customers**
- Shift reporting from revenue-only to **profit-based segmentation**

---

## Outcome

This analysis demonstrates how SQL can be used not only for querying data but for **business classification and decision support**, bridging the gap between raw data and actionable insights.

---

## Next Steps

- Apply these classifications in dashboards (Power BI / Excel)
- Track customer movement between segments over time
- Combine with time-based analysis for trend monitoring

---

### 📌 Part of **50 Days Data Analyst Challenge**
