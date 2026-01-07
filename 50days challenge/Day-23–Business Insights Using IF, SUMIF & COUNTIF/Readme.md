## Day 23 – Business Insights Using IF, SUMIF & COUNTIF (Excel)

### Objective
To use **Excel logic functions** to analyze raw transactional data and uncover
**profitability risks and revenue impact**, without relying on Pivot Tables.

The goal was to demonstrate how simple formulas can answer
real **operational and pricing-related business questions**.

---

### Dataset
- Sales Orders (transaction-level data)
- Total Orders Analyzed: 64,104

---

### Analysis Performed
- Created **Profit Status** using IF logic to classify orders by margin
- Flagged **High Value vs Normal orders** using order value thresholds
- Used **COUNTIF / COUNTIFS** to quantify:
  - Low-margin orders
  - High-value orders
  - High-value + low-margin orders
- Used **SUMIF** to calculate revenue contribution from:
  - Low-margin orders
  - High-value orders
- Built a **no-pivot summary table** for decision-making

---

### Key Insights
- High order value does not always translate into high profitability
- A significant number of orders generate low margins, creating hidden risk
- High-value but low-margin orders represent the most critical segment
- Revenue concentration can mask profit leakage if margins are ignored
- Formula-based logic enables scalable and repeatable analysis

---

### Business Recommendations
- Review pricing and discounting strategies for low-margin orders
- Introduce margin thresholds for approving high-value deals
- Shift sales focus toward profitable orders, not just large orders
- Monitor order-level profitability using simple rule-based logic

---

### Tools Used
- Microsoft Excel
  - IF
  - SUMIF
  - COUNTIF / COUNTIFS
  - Structured Tables

---

### Key Learning
Advanced analysis is not about complex tools.
Clear business questions combined with simple Excel logic
can uncover insights that directly impact pricing, margin control,
and operational decision-making.
