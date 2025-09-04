# 🛠️ Query Optimization Report

## Task: Optimize Complex Queries
**Objective:** Retrieve all bookings with user, property, and payment details while improving performance.

---

## 🔍 Initial Query
- The initial query joined **bookings**, **users**, **properties**, and **payments**.
- Performance issue observed:
  - Full table scans on `bookings`, `users`, and `properties`.
  - JOINs slowed down due to lack of indexes on foreign key columns.

---

## 📊 Performance Analysis
Using `EXPLAIN`, MySQL showed:
- High row counts being scanned in `bookings` and `payments`.
- JOIN conditions not leveraging indexes.
- Increased query execution time on larger datasets.

---

## ⚡ Refactored Query
- Added indexes on:
  - `users(user_id)`
  - `bookings(user_id)`
  - `bookings(property_id)`
  - `properties(property_id)`
  - `payments(booking_id)`
- Reduced selected columns (removed redundant ones like `u.user_id` since `email` is unique).
- Optimized JOIN structure.

---

## ✅ Results
- Query execution time reduced significantly (observed improvement when tested on 100k+ rows).
- `EXPLAIN` now shows use of indexes (`ref` instead of `ALL` scans).
- Memory and CPU usage improved due to reduced intermediate result set.

---

## 📝 Conclusion
Indexing and selective column retrieval are key to optimizing JOIN-heavy queries in MySQL.  
The refactored query is more efficient, scalable, and production-ready.
