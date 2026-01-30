# Day 41 – Power BI | Data Loading & Power Query (Analytics Foundation)

## 📌 Project: Sales Analysis
**Tool:** Power BI Desktop  
**Author:** Mohammad Ali  
**Level:** Analytics Foundations (BI Preparation)

---

## 🎯 Objective

To prepare clean, reliable, and analysis-ready data in **Power BI** by importing SQL data and transforming it using **Power Query**.

This phase focuses on building a **strong data foundation** before:
- Data modeling
- DAX calculations
- KPI dashboards
- Executive reporting

Because dashboards are only as good as the data behind them.

---

## 🧠 Why This Matters

Most BI issues do **not** come from bad visuals or DAX.

They come from:
- Incorrect data types  
- Dirty or inconsistent data  
- Poor table structure  
- Unvalidated transformations  

Power Query acts as a **data validation and standardisation layer**, ensuring that downstream insights are accurate and trustworthy.

This step answers:
- Is the data clean enough to support decisions?
- Are tables structured for scalable analysis?
- Can KPIs be trusted before reaching leadership?

---

## 🔍 Business Questions Addressed

### 1️⃣ Is the data ready for analysis?
**Purpose:**  
Ensure raw SQL data is usable for analytics.

**Insight:**  
Cleaning, typing, and validation eliminate hidden data risks before modeling begins.

---

### 2️⃣ Are tables structured for business analysis?
**Purpose:**  
Separate transactional data from descriptive attributes.

**Insight:**  
Fact and dimension tables are prepared for star-schema modeling.

---

### 3️⃣ Can downstream KPIs be trusted?
**Purpose:**  
Prevent incorrect calculations caused by poor data preparation.

**Insight:**  
Validated data ensures accurate DAX measures and reliable dashboards.

---

## 🛠️ Work Performed in Power Query

### 🔹 Data Loading
- Connected SQL Server database to Power BI
- Loaded required business tables using **Import mode**

### 🔹 Table Structuring
- Organised data into:
  - Fact tables (Sales / Orders)
  - Dimension tables (Customer, Product, Region, Date, Shipping)
- Renamed tables for clarity and analytical usability

### 🔹 Data Cleaning & Transformation
- Renamed columns using business-friendly naming
- Removed unnecessary and duplicate columns
- Corrected data types (Date, Decimal, Whole Number, Text)
- Handled null values and missing data
- Removed error rows and invalid records
- Filtered inconsistent or non-usable data

### 🔹 Data Validation
- Verified numeric fields for calculations
- Validated date fields for time-intelligence readiness
- Ensured model readiness for relationship creation

---

## 📊 Output of Day 41

- Cleaned and validated datasets
- Business-ready fact and dimension tables
- Data model prepared for star schema design
- No visuals or KPIs yet (by design)

---

## 💼 Business Impact

- Prevents inaccurate KPIs and misleading dashboards
- Improves model performance and scalability
- Increases executive trust in analytics
- Reduces rework in later BI stages
- Establishes a professional analytics workflow

---

## 🎯 Key Learning

Dashboards don’t fail because of visuals.  
They fail because of weak data foundations.

Power BI analysis starts **before** charts and DAX —  
it starts with **clean, structured, validated data**.

---

