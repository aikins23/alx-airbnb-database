-- Step 1: Rename old bookings table
ALTER TABLE bookings RENAME TO bookings_old;

-- Step 2: Create a new parent table with partitioning
CREATE TABLE bookings (
    booking_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    status VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- Step 3: Create partitions (example: yearly partitions)
CREATE TABLE bookings_2023 PARTITION OF bookings
FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings
FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings
FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Step 4: Insert data from old table into partitioned table
INSERT INTO bookings (booking_id, user_id, property_id, start_date, end_date, status, created_at)
SELECT booking_id, user_id, property_id, start_date, end_date, status, created_at
FROM bookings_old;

-- Step 5: Drop old table if no longer needed
-- DROP TABLE bookings_old;

-- Step 6: Test performance with EXPLAIN ANALYZE
-- Example query before/after partitioning
EXPLAIN ANALYZE
SELECT booking_id, user_id, property_id, start_date
FROM bookings
WHERE start_date BETWEEN '2024-05-01' AND '2024-05-31';
