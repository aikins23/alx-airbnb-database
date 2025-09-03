# Airbnb Database Advanced SQL Project

## Project Overview
This project is part of the **ALX Airbnb Database** exercises.  
The goal is to master advanced SQL operations such as **joins**, **subqueries**, **aggregations**, and **window functions**.  
All queries are written for a MySQL-based Airbnb-like database schema.  

---

## 0. Write Complex Queries with Joins (mandatory)

### Objective
Master SQL joins by writing complex queries using different types of joins.

### Instructions
- Write a query using an **INNER JOIN** to retrieve all bookings and the respective users who made those bookings.  
- Write a query using a **LEFT JOIN** to retrieve all properties and their reviews, including properties that have no reviews.  
- Write a query using a **FULL OUTER JOIN** to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.  

### Queries

#### INNER JOIN
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

#### LEFT JOIN
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

#### FULL OUTER JOIN (simulated with UNION in MySQL)
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

**Repo**

* GitHub repository: `alx-airbnb-database`
* Directory: `database-adv-script`
* File: `joins_queries.sql`, `README.md`

---

## 1. Practice Subqueries (mandatory)

### Objective
Write both correlated and non-correlated subqueries.

### Instructions
* Write a query to find all properties where the average rating is greater than 4.0 using a subquery.
* Write a correlated subquery to find users who have made more than 3 bookings.

### Queries

#### Non-Correlated Subquery
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

#### Correlated Subquery
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

**Repo**

* GitHub repository: `alx-airbnb-database`
* Directory: `database-adv-script`
* File: `subqueries.sql`, `README.md`

---

## 2. Apply Aggregations and Window Functions (mandatory)

### Objective
Use SQL aggregation and window functions to analyze data.

### Instructions
* Write a query to find the total number of bookings made by each user, using the `COUNT` function and `GROUP BY` clause.
* Use a window function (`ROW_NUMBER`, `RANK`) to rank properties based on the total number of bookings they have received.

### Queries

#### COUNT + GROUP BY
```sql
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    COUNT(b.booking_id) AS total_bookings
FROM users u
LEFT JOIN bookings b ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name, u.last_name;
```

#### RANK with Window Function
```sql
SELECT 
    p.property_id,
    p.name AS property_name,
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM properties p
LEFT JOIN bookings b ON p.property_id = b.property_id
GROUP BY p.property_id, p.name;
```

**Repo**

* GitHub repository: `alx-airbnb-database`
* Directory: `database-adv-script`
* File: `aggregations_and_window_functions.sql`, `README.md`

---

## Author
Buabeng Emmanuel Aikins
