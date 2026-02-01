# Day 42 – Power BI Data Modeling & Star Schema Design

## 📌 Project: Sales Analysis  
**Tool:** Power BI Desktop  
**Author:** Mohammad Ali  
**Level:** Data Modeling & Analytics Engineering  

---

## 🎯 Objective

To design a **clean, scalable, and analytics-ready data model** in Power BI by creating correct relationships and applying **star schema principles**.

This step focuses on structuring data so that:
- KPIs remain accurate
- DAX stays simple and maintainable
- Dashboards perform efficiently
- The model can scale with business growth

Because **great dashboards are built on great data models**.

---

## 🧠 Why Data Modeling Matters

Most Power BI issues are not caused by visuals or DAX.  
They are caused by:

- Incorrect relationships  
- Snowflake schemas (dimension → dimension chains)  
- Multiple filter paths  
- Fact tables mixed with descriptive attributes  

A strong data model ensures:
- Reliable business metrics  
- Better performance  
- Cleaner DAX logic  
- Long-term maintainability  

This phase answers:
- Is the model designed for analysis or just data storage?
- Can KPIs scale without breaking?
- Will future dashboards remain reliable?

---

## 🔍 Business Problems Addressed

### 1️⃣ Incorrect Geography Modeling
**Problem:**  
State → Region → Sales chains caused snowflake relationships and ambiguity.

**Solution:**  
Merged geography into a **single Region dimension**.

---

### 2️⃣ Relationship Accuracy
**Problem:**  
Incorrect or unnecessary table connections can lead to double counting.

**Solution:**  
Implemented **one-to-many relationships** from dimensions to the fact table.

---

### 3️⃣ Scalability & Performance
**Problem:**  
Poor models slow down reports and complicate DAX.

**Solution:**  
Applied **star schema design**, optimised for analytics performance.

---

## 🛠️ Modeling Work Performed

### 🔹 Fact Table
- **Sales Orders**
  - Contains transactional data (sales, quantity, profit, dates)

### 🔹 Dimension Tables
- **dim_customer**
- **dim_product**
- **dim_region**

Each dimension:
- Contains descriptive attributes only
- Connects directly to the fact table
- Does not connect to other dimensions

---

### 🔹 Relationship Design
- One-to-many (1 → *) relationships
- Single-direction filtering
- No dimension-to-dimension relationships
- No circular or ambiguous paths

---

## 📊 Final Data Model Structure

