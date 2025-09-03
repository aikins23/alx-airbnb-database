# Database Indexing Guide

This guide outlines high-usage columns in the **User**, **Booking**, and **Property** tables, and recommends indexing strategies to improve query performance.

## Why Indexing?
Indexes speed up lookups, filtering, and sorting operations. Focus on columns used frequently in:
- `WHERE` clauses  
- `JOIN` conditions  
- `ORDER BY` clauses  

---

## User Table
- **user_id**  
  Primary key. Used in joins with `bookings.user_id`.  
- **email**  
  Often used in login or lookups (`WHERE email = '...'`).  
- **created_at**  
  Used for sorting (`ORDER BY created_at DESC`) or filtering by registration date.  

---

## Booking Table
- **booking_id**  
  Primary key. Used to identify a booking.  
- **user_id**  
  Foreign key. Joins with `users.user_id`.  
- **property_id**  
  Foreign key. Joins with `properties.property_id`.  
- **booking_date**  
  Common for filtering and sorting (`WHERE booking_date BETWEEN ...`, `ORDER BY booking_date`).  
- **status**  
  Frequently filtered (`WHERE status = 'confirmed'`).  

---

## Property Table
- **property_id**  
  Primary key. Used in joins with `bookings.property_id`.  
- **location**  
  Common for filtering (`WHERE location = 'Accra'`).  
- **price**  
  Used for filtering (`WHERE price BETWEEN ...`) and sorting (`ORDER BY price ASC`).  
- **created_at**  
  Used for filtering and sorting by listing date.  

---

## Recommendations
- Add indexes to:  
  - Foreign keys (`user_id`, `property_id`)  
  - Lookup fields (`email`, `status`, `location`)  
  - Date fields (`booking_date`, `created_at`)  
- Consider **composite indexes** for commonly used column combinations, such as:  
  - `(user_id, booking_date)`  
  - `(location, price)`  

Indexes improve query performance but also add overhead on inserts and updates. Only index columns that are frequently queried.


--Measure the query performance before and after adding indexes using EXPLAIN or ANALYZE.

--Find a user by email:
EXPLAIN ANALYZE
SELECT user_id, name
FROM users
WHERE email = 'example@mail.com';

--Search properties by location and price:
EXPLAIN ANALYZE
SELECT property_id, name, price
FROM properties
WHERE location = 'Accra' AND price BETWEEN 100 AND 500
ORDER BY price ASC;


--Find all bookings for a user in a date range:
EXPLAIN ANALYZE
SELECT booking_id, booking_date, status
FROM bookings
WHERE user_id = 123 AND booking_date BETWEEN '2025-01-01' AND '2025-03-01';

