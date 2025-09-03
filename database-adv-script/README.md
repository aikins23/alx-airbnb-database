# Airbnb Database Advanced SQL Project

## 📌 Project Overview
This project focuses on writing **advanced SQL queries** for an Airbnb-like database system.  
The goal is to practice and master **SQL joins**, **subqueries**, and **correlated subqueries** for efficient data analysis.

---

## 🎯 Objectives
- Design a **relational database schema** for an Airbnb system using **MySQL**.
- Write queries using:
  - **INNER JOIN**
  - **LEFT JOIN**
  - **FULL OUTER JOIN** (simulated in MySQL).
- Use **subqueries** and **correlated subqueries** for advanced filtering and analytics.

---

## 📂 Repository Structure
- **Repository:** `alx-airbnb-database`
- **Directory:** `database-adv-script`
- **Files:**
  - `joins_queries.sql` → contains all join queries.
  - `subqueries.sql` → contains subqueries and correlated subqueries.
  - `README.md` → project documentation.

---

## 🗂 Database Schema
The main tables in the database are:

- **`users`** → stores user details (guest, host, admin).
- **`properties`** → stores property listings.
- **`bookings`** → stores booking details.
- **`payments`** → stores payment records.
- **`reviews`** → stores user reviews of properties.
- **`messages`** → stores messages between users.

---

## 🧩 SQL Queries

### 1️⃣ INNER JOIN — Retrieve all bookings with respective user details
```sql
SELECT 
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id;
```

---

### 2️⃣ LEFT JOIN — Retrieve all properties with reviews (including properties without reviews)
```sql
SELECT 
    p.property_id,
    p.name AS property_name,
    r.review_id,
    r.rating,
    r.comment
FROM properties p
LEFT JOIN reviews r ON p.property_id = r.property_id;
```

---

### 3️⃣ FULL OUTER JOIN (Simulated in MySQL) — Retrieve all users and bookings
```sql
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.start_date,
    b.end_date
FROM users u
LEFT JOIN bookings b ON u.user_id = b.user_id

UNION

SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.start_date,
    b.end_date
FROM users u
RIGHT JOIN bookings b ON u.user_id = b.user_id;
```

---

### 4️⃣ Subquery — Find all properties with an average rating greater than 4.0
```sql
SELECT 
    p.property_id,
    p.name AS property_name,
    p.location,
    p.price_per_night
FROM properties p
WHERE p.property_id IN (
    SELECT r.property_id
    FROM reviews r
    GROUP BY r.property_id
    HAVING AVG(r.rating) > 4.0
);
```

---

### 5️⃣ Correlated Subquery — Find users who have made more than 3 bookings
```sql
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM users u
WHERE (
    SELECT COUNT(*)
    FROM bookings b
    WHERE b.user_id = u.user_id
) > 3;
```

---

## 🚀 How to Run

### 1. Create the database:
```sql
CREATE DATABASE airbnb_db;
USE airbnb_db;
```

### 2. Create all tables:
- Use the schema files to create the database tables.

### 3. Insert sample data:
- Populate the database with mock data.

### 4. Run SQL scripts:
```bash
mysql -u root -p airbnb_db < joins_queries.sql
mysql -u root -p airbnb_db < subqueries.sql
```

---

## 👨‍💻 Author
**Buabeng Emmanuel Aikins**  

---

## 🏷️ License
This project is for educational purposes under the **MIT License**.
