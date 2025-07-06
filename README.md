# Smart City Analytics: SQL Project

## 🌟 Project Overview
This SQL-based project provides deep insights into urban city data using advanced SQL techniques. The goal is to analyze multiple aspects of a smart city like citizen details, electricity usage, healthcare visits, public feedback, and transport usage. The project is structured into levels, covering from basic to advanced SQL topics including:

- Joins and aggregations  
- Grouping and filtering  
- Subqueries  
- Common Table Expressions (CTEs)  
- Window functions  

---

## 📊 Datasets and Tables
The project involves **6 normalized tables** representing key smart city domains:

1. **city_area** – Master data for city zones and areas  
2. **citizens** – Citizen demographics and area linkage  
3. **electricity_usage** – Monthly electricity consumption and bills  
4. **healthcare_visits** – Healthcare department-wise visit tracking  
5. **public_feedback** – Ratings and feedback for public services  
6. **transport_usage** – Transport mode and fare history  

Entity-Relationship Diagram (ERD) is included in the repo for better understanding of schema relations.

---

## 🔹 Features and Concepts Covered

### 1 - Basic SELECT & JOINs
- Merging tables using inner joins  
- Simple filters using `WHERE`  
- Sorting and aliases  

### 2 – Aggregation & GROUP BY
- `COUNT`, `SUM`, `AVG`, `MAX`, `MIN`  
- `GROUP BY` with `HAVING`  
- Multi-level grouping  

### 3 – Subqueries
- Nested subqueries for comparisons  
- Correlated subqueries  
- Filtering with `NOT IN`, `EXISTS`  

### 4 – CTEs (Common Table Expressions)
- Modular queries using `WITH`  
- Layered analytics  
- Summary and detail breakouts  

### 5 – Window Functions
- `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()`  
- `LAG()` and `LEAD()`  
- Running totals with `SUM() OVER`  
- Combined use of CTE + window functions  

---

## 💰 Sample High-Impact Insights
Some of the valuable business insights derived include:

- Citizens with highest healthcare expenses  
- Feedback sentiment trends by department  
- Areas with above-average electricity bills  
- Weekly electricity consumption trends  
- Transport cost ranking per citizen  
- Running total of electricity usage per area  

📸 *Screenshots and sample outputs are included in the `sample_output/` folder.*

---

## 📂 Project Structure
smart-city-sql-analytics/
├── SQL/schema_and_queries.sql # CREATE + INSERT scripts
├── ERD/erd_diagram.png # Entity-Relationship Diagram
├── OUTPUT/sample_output/ # Screenshots & query results
├── README.md # Project guide and overview

---

## 💡 Tools Used
- **PostgreSQL** with **pgAdmin**  
- **DrawSQL** for ERD diagram  
- **VS Code / Notepad++** for scripting  
- **Git** and **GitHub** for version control  

---

## 🎨 How to Use
1. Clone the repo:
   ```bash
   git clone https://github.com/Pujagithub2006/Smart-City-Analytics-SQL-Project

2. Import SQL schema and data from schema_and_data.sql

3. Run queries level-wise from the queries/ folder

4. Refer to ERD and output screenshots to understand schema and 

## 🚀 What’s Next?
1. Build a Power BI or Tableau dashboard

2. Integrate Python + SQL pipeline

## 👉 Connect
Feel free to connect with me on LinkedIn to explore, collaborate, or share feedback!

Thank you for visiting!
This project reflects hands-on practice and a passion for SQL development through a meaningful smart city use case. 🚀