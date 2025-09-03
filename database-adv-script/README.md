<div align="center">
  <img src="https://upload.wikimedia.org/wikipedia/commons/6/69/Airbnb_Logo_Bélo.svg" alt="Airbnb Logo" height="80">
  <img src="https://www.mysql.com/common/logos/logo-mysql-170x115.png" alt="MySQL Logo" height="80" style="margin-left:20px;">
</div>

# 🏡 ALX Airbnb Database Project
**Module:** Advanced SQL Querying and Optimization  
**System Used:** MySQL  

---

## 🚀 Unleashing Advanced Querying Power
**Level:** Novice  
**Weight:** 1  

- **Project Start:** Sep 1, 2025 12:00 AM  
- **Project Deadline:** Sep 8, 2025 12:00 AM  
- **Checker Release:** Sep 1, 2025 12:00 AM  
- **Review:** Manual QA review (auto-checks at deadline)  

---

## 📌 About the Project
This project is part of the **ALX Airbnb Database Module**, where you will work on **advanced SQL querying and performance optimization** with MySQL.  

You will practice real-world techniques including:  
- 🧩 Writing complex SQL joins and subqueries  
- 📊 Applying aggregations and window functions  
- ⚡ Creating indexes for performance optimization  
- 🗂️ Partitioning large tables for scalability  
- 🔍 Monitoring and refining database performance  

The aim is to prepare you for **high-performance applications** where efficiency and scalability are critical.

---

## 🎯 Learning Objectives
By completing this project, you will:  
- 🧠 **Master Advanced SQL**: Joins, subqueries, aggregations, and window functions.  
- ⚡ **Optimize Query Performance**: Use `EXPLAIN` and `ANALYZE` to evaluate and improve queries.  
- 📌 **Implement Indexing & Partitioning**: Speed up queries on large datasets.  
- 🛠️ **Think Like a DBA**: Make schema and indexing decisions for efficiency.  
- 🔍 **Monitor & Refine**: Continuously check and improve performance.  

---

## ✅ Requirements
- 🟢 Solid understanding of SQL basics (`SELECT`, `WHERE`, `GROUP BY`).  
- 🟢 Familiarity with relational database concepts (PK, FK, normalization).  
- 🟢 Knowledge of performance monitoring tools (`EXPLAIN`, `SHOW PROFILE`, `ANALYZE`).  
- 🟢 GitHub repository setup for submission.  

---

## 📂 Repository Structure

**GitHub repository:** `alx-airbnb-database`  
**Directory:** `database-adv-script`  

```bash
database-adv-script/
│── joins_queries.sql
│── subqueries.sql
│── aggregations_and_window_functions.sql
│── database_index.sql
│── index_performance.md
│── perfomance.sql
│── optimization_report.md
│── partitioning.sql
│── partition_performance.md
│── performance_monitoring.md
│── README.md
```

---

## 📝 Tasks

### **0. Write Complex Queries with Joins**  
**File:** `joins_queries.sql`, `README.md`  
- 🔹 **INNER JOIN** → Retrieve all bookings with respective users.  
- 🔹 **LEFT JOIN** → Retrieve all properties and their reviews (including properties with no reviews).  
- 🔹 **FULL OUTER JOIN** → Retrieve all users and bookings, even if not linked.  

---

### **1. Practice Subqueries**  
**File:** `subqueries.sql`, `README.md`  
- 🔹 **Non-correlated subquery** → Find all properties with average rating > 4.0.  
- 🔹 **Correlated subquery** → Find users with more than 3 bookings.  

---

### **2. Apply Aggregations and Window Functions**  
**File:** `aggregations_and_window_functions.sql`, `README.md`  
- 🔹 **Aggregation** → Find total number of bookings per user.  
- 🔹 **Window Functions** → Use `ROW_NUMBER()` and `RANK()` to rank properties based on bookings.  

---

### **3. Implement Indexes for Optimization**  
**File:** `database_index.sql`, `index_performance.md`  
- 📌 Identify high-usage columns in `users`, `bookings`, and `properties`.  
- ⚡ Create indexes to improve queries on `WHERE`, `JOIN`, `ORDER BY`.  
- 📊 Measure performance before and after using `EXPLAIN` or `ANALYZE`.  

---

### **4. Optimize Complex Queries**  
**File:** `perfomance.sql`, `optimization_report.md`  
- 🧩 Write initial query retrieving bookings with user, property, and payment details.  
- 🔍 Analyze execution with `EXPLAIN`.  
- ⚡ Refactor query to improve performance (indexes, fewer joins).  

---

### **5. Partitioning Large Tables**  
**File:** `partitioning.sql`, `partition_performance.md`  
- 🗂️ Partition `bookings` table by `start_date`.  
- 📊 Test queries by date range before and after partitioning.  
- ✅ Report observed improvements.  

---

### **6. Monitor and Refine Database Performance**  
**File:** `performance_monitoring.md`  
- 🔍 Use `SHOW PROFILE` or `EXPLAIN ANALYZE` to monitor query performance.  
- 📌 Identify bottlenecks.  
- 🛠️ Suggest and implement schema/index adjustments.  
- 📈 Report improvements.  

---

## 📊 Project Flow
1. 🗺️ Build ER diagram and schema.  
2. 🧩 Write and test advanced queries.  
3. ⚡ Add indexing and measure improvements.  
4. 🛠️ Optimize queries for performance.  
5. 🗂️ Apply partitioning on large datasets.  
6. 🔍 Monitor performance and refine schema.  

---

## 📝 Project Assessment
- 🧾 Manual QA review required.  
- ✅ Auto-check validates presence of required files.  
- ⏳ Submit **before deadline** to generate review link.  

---

## ✨ Author
**Buabeng Emmanuel Aikins**  
*ALX Airbnb Database Module - Advanced SQL Project*  
System: **MySQL**  

---
