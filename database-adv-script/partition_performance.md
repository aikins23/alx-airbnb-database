# Performance Testing Report

This report documents the impact of partitioning on query performance in the `bookings` table.



## Test Query

SELECT booking_id, user_id, property_id, start_date
FROM bookings
WHERE start_date BETWEEN '2024-05-01' AND '2024-05-31';




## Results

### Before Partitioning

* Execution plan: **Sequential Scan**
* Scanned the entire `bookings` table
* Performance degraded as data volume grew

### After Partitioning

* Execution plan: **Partition Pruning**
* Scanned only relevant partition (`bookings_2024`)
* Query execution time improved on large datasets



## Observation

* Partitioning optimized date-based queries
* Reduced number of rows scanned
* Lowered memory usage and execution time



## Conclusion

Partitioning the `bookings` table by date range significantly improved query performance.
For large-scale systems with heavy date-range queries, partitioning is recommended alongside proper indexing.

