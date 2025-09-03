# Complex Queries with Joins

This project focuses on mastering SQL joins by writing complex queries using different types of joins.

---

## Objective
- Learn how to use `INNER JOIN`, `LEFT JOIN`, and `FULL OUTER JOIN`.
- Practice writing queries that handle linked and unlinked records between tables.

---

## Instructions

1. **Write a query using an INNER JOIN**  
   Retrieve all bookings and the respective users who made those bookings.

   ```sql
   SELECT 
       b.booking_id,
       b.property_id,
       b.booking_date,
       u.user_id,
       u.name,
       u.email
   FROM Bookings b
   INNER JOIN Users u 
       ON b.user_id = u.user_id;
Write a query using a LEFT JOIN
Retrieve all properties and their reviews, including properties that have no reviews.

sql
Copy code
SELECT 
    p.property_id,
    p.property_name,
    r.review_id,
    r.rating,
    r.comment
FROM Properties p
LEFT JOIN Reviews r 
    ON p.property_id = r.property_id;
Write a query using a FULL OUTER JOIN
Retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.

sql
Copy code
SELECT 
    u.user_id,
    u.name,
    b.booking_id,
    b.property_id,
    b.booking_date
FROM Users u
FULL OUTER JOIN Bookings b 
    ON u.user_id = b.user_id;
Repository
GitHub repository: alx-airbnb-database

Directory: database-adv-script

Files:

joins_queries.sql

README.md

Notes
Use sample data to test queries.

Ensure schema includes Users, Properties, Bookings, and Reviews tables.

Queries should work in standard SQL environments (PostgreSQL recommended).