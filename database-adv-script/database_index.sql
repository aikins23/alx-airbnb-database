-- Indexes for User table
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_created_at ON users(created_at);

-- Indexes for Booking table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_booking_date ON bookings(booking_date);
CREATE INDEX idx_bookings_status ON bookings(status);

-- Indexes for Property table
CREATE INDEX idx_properties_location ON properties(location);
CREATE INDEX idx_properties_price ON properties(price);
CREATE INDEX idx_properties_created_at ON properties(created_at);

-- Composite indexes for common query patterns
CREATE INDEX idx_bookings_user_date ON bookings(user_id, booking_date);
CREATE INDEX idx_properties_location_price ON properties(location, price);

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

