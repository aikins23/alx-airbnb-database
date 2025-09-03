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



