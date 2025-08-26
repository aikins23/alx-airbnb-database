# Task 1: Database Normalization (3NF)

This document explains how the **ALX Airbnb Database** schema was normalized up to the **Third Normal Form (3NF)** to eliminate redundancy and maintain data integrity.

---

## **Step 1 — First Normal Form (1NF)**
**Definition:**  
A table is in **1NF** if:
- Each column contains atomic (indivisible) values.
- Each record is unique.
- No repeating groups or arrays.

**Implementation in Our Schema:**
- All tables use **atomic columns** (e.g., `first_name`, `last_name`, `email`).
- No multi-valued attributes like `phone_numbers[]`.
- Each table has a **primary key** (`user_id`, `property_id`, `booking_id`, etc.).

✅ **Our schema satisfies 1NF.**

---

## **Step 2 — Second Normal Form (2NF)**
**Definition:**  
A table is in **2NF** if:
- It is already in 1NF.
- All **non-key columns** depend on the **entire primary key** (no partial dependency).

**Implementation in Our Schema:**
- We don’t have any composite primary keys.
- For example:
  - In **Bookings**, all attributes (`start_date`, `end_date`, `status`) depend on `booking_id`.
  - In **Payments**, `amount` and `payment_date` depend on `payment_id`.

✅ **Our schema satisfies 2NF.**

---

## **Step 3 — Third Normal Form (3NF)**
**Definition:**  
A table is in **3NF** if:
- It is already in 2NF.
- There are **no transitive dependencies** (non-key columns should not depend on other non-key columns).

**Implementation in Our Schema:**
- No column depends on another non-key column.
- Examples:
  - In **Bookings**, `total_price` depends only on `booking_id` — it’s not derived from another table but stored for performance.
  - In **Properties**, `price_per_night` belongs only to that property.
  - In **Payments**, `payment_method` belongs only to the payment.

✅ **Our schema satisfies 3NF.**

---

## **Summary Table**

| **Table**   | **Primary Key** | **Dependent Attributes**                                    | **Normalization** |
|------------|----------------|------------------------------------------------------------|-------------------|
| **Users**      | user_id       | first_name, last_name, email, password_hash, phone_number, role, created_at | 3NF |
| **Properties** | property_id   | host_id, name, description, location, price_per_night, created_at, updated_at | 3NF |
| **Bookings**   | booking_id    | property_id, user_id, start_date, end_date, total_price, status, created_at | 3NF |
| **Payments**   | payment_id    | booking_id, amount, payment_date, payment_method          | 3NF |
| **Reviews**    | review_id     | property_id, user_id, rating, comment, created_at         | 3NF |
| **Messages**   | message_id    | sender_id, recipient_id, message_body, sent_at            | 3NF |

---

## **Conclusion**
The database schema is fully normalized up to **Third Normal Form (3NF)**:
- No data redundancy ✅
- No partial dependencies ✅
- No transitive dependencies ✅
- Ensures data integrity and efficient queries ✅
