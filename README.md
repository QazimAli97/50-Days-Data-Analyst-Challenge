# 🚀 50 DAYS OF DATA ANALYST CHALLENGE: E-commerce Sales Analytics

This repository documents my **50-Day Data Analyst Challenge**, a project designed to simulate the complete end-to-end analytical workflow using the three core tools: **Excel, SQL, and Power BI**.

The project uses a real-world E-commerce Sales dataset (`train.csv`) to transform raw transaction data into actionable business intelligence, demonstrating proficiency in the full data analysis stack.

---

## 🎯 Project Goals

The primary objective is to answer the core business question: **"How can we optimize sales strategy and improve customer retention based on historical data?"**

The project focuses on calculating and analyzing the following Key Performance Indicators (KPIs):
* Total Revenue, Profitability, and Average Order Value (AOV).
* Year-over-Year (YoY) Sales Growth and Month-over-Month (MoM) trends.
* Shipping Efficiency and Customer Segmentation.

---

## 🛠️ Tool Stack & Core Skills Demonstrated

| Tool | Primary Focus | Key Skills Applied |
| :--- | :--- | :--- |
| **Microsoft Excel** | **Data Cleaning & Initial Prep** | `TRIM()`, `PROPER()`, **Text-to-Columns** (Date Conversion), **VLOOKUP**, **Nested IFs**, Pivot Tables. |
| **SQL (T-SQL)** | **Data Modeling & Aggregation** | **Star Schema** creation (`SELECT DISTINCT`), Complex **JOINs**, **CTEs**, **Window Functions** (`RANK()`, Running Total), **HAVING** for group filtering. |
| **Power BI** | **Visualization & Storytelling** | **Data Modeling** (Relationships), **Advanced DAX** (Time Intelligence, Ratios), **Power Query (M)** transformations, Interactive Dashboard Design. |

---

## 📂 Repository Structure

The project is organized to mirror a professional data pipeline:

* `/data/train.csv`: Contains the original, unprocessed `train.csv` file.
* `/data/clean`: Contains the cleaned CSV used for SQL import (`cleaned_data_day1.csv`).
* `/sql/`: Contains all daily SQL scripts (including Fact/Dimension creation, KPI calculations, and the final optimized **VIEW** for Power BI).
* `/power_bi/`: Contains the final **`.pbix`** Power BI data model file.

---

## 📉 Data Modeling Approach

The initial flat file was separated into a **Star Schema** to ensure proper filtering and accurate DAX calculations in Power BI. The structure involves three core tables linked via unique IDs:

* **Fact Table:** `Fact_Orders` (contains Order ID, Sales, Quantity, and the Foreign Keys to dimensions).
* **Dimension Tables:** `Dim_Customer`, `Dim_Product`, and a generated `Dim_Date` table.



---

## 🔗 Follow the Journey & Final Deliverables

All 50 daily posts detailing the methodology, challenges, and insights are shared on LinkedIn. Check out the final deliverables below:

| Deliverable | Description |
| :--- | :--- | :--- |
| **LinkedIn Progress** | Daily posts sharing code snippets and key insights. |
| **Live Interactive Dashboard** | The final Power BI Report published to Power BI Service. |
| **Final Data Model** | The complete Power BI `.pbix` file. |

---

---

## Connect with Me

Thank you for viewing the **50-Days Data Analyst Challenge** project! I am actively seeking roles in Data Analysis and Business Intelligence.

| Contact Detail | Link |
| :--- | :--- |
| **LinkedIn (Progress & Network)** | **[linkedin.com/in/mohammad-ali-41bba6208]** |
| **Email** | **[mohdali1996ehs@gmail.com]** |

Best regards,

**[Mohammad Ali]**
Aspiring Data Analyst
