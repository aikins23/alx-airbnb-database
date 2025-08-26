-- Airbnb Database Sample Data (Task 3)

-- ==========================
-- USERS TABLE
-- ==========================
INSERT INTO users (first_name, last_name, email, password_hash, phone_number, role)
VALUES
('Michael', 'Owusu', 'michael@example.com', 'hashed_password_1', '+233201111111', 'guest'),
('Sarah', 'Johnson', 'sarah@example.com', 'hashed_password_2', '+233202222222', 'host'),
('Emmanuel', 'Buabeng', 'emmanuel@example.com', 'hashed_password_3', '+233203333333', 'host'),
('Linda', 'Adams', 'linda@example.com', 'hashed_password_4', '+233204444444', 'guest'),
('David', 'Mensah', 'david@example.com', 'hashed_password_5', '+233205555555', 'admin');

-- ==========================
-- PROPERTIES TABLE
-- ==========================
INSERT INTO properties (host_id, name, description, location, price_per_night)
VALUES
((SELECT user_id FROM users WHERE email='sarah@example.com'), 'Beachfront Villa', 'Luxury villa near the beach with private pool', 'Accra, Ghana', 350.00),
((SELECT user_id FROM users WHERE email='emmanuel@example.com'), 'Mountain Cabin', 'Peaceful cabin in the mountains with stunning views', 'Aburi, Ghana', 180.00),
((SELECT user_id FROM users WHERE email='emmanuel@example.com'), 'City Apartment', 'Modern apartment in the heart of the city', 'Kumasi, Ghana', 120.00);

-- ==========================
-- BOOKINGS TABLE
-- ==========================
INSERT INTO bookings (property_id, user_id, start_date, end_date, total_price, status)
VALUES
((SELECT property_id FROM properties WHERE name='Beachfront Villa'), (SELECT user_id FROM users WHERE email='michael@example.com'), '2025-09-01', '2025-09-05', 1400.00, 'confirmed'),
((SELECT property_id FROM properties WHERE name='Mountain Cabin'), (SELECT user_id FROM users WHERE email='linda@example.com'), '2025-09-10', '2025-09-12', 360.00, 'pending'),
((SELECT property_id FROM properties WHERE name='City Apartment'), (SELECT user_id FROM users WHERE email='michael@example.com'), '2025-09-15', '2025-09-18', 360.00, 'canceled');

-- ==========================
-- PAYMENTS TABLE
-- ==========================
INSERT INTO payments (booking_id, amount, payment_method)
VALUES
((SELECT booking_id FROM bookings WHERE total_price=1400.00), 1400.00, 'credit_card'),
((SELECT booking_id FROM bookings WHERE total_price=360.00 AND status='pending'), 360.00, 'paypal');

-- ==========================
-- REVIEWS TABLE
-- ==========================
INSERT INTO reviews (property_id, user_id, rating, comment)
VALUES
((SELECT property_id FROM properties WHERE name='Beachfront Villa'), (SELECT user_id FROM users WHERE email='michael@example.com'), 5, 'Absolutely amazing! Perfect stay.'),
((SELECT property_id FROM properties WHERE name='Mountain Cabin'), (SELECT user_id FROM users WHERE email='linda@example.com'), 4, 'Very cozy and quiet, loved it!'),
((SELECT property_id FROM properties WHERE name='City Apartment'), (SELECT user_id FROM users WHERE email='michael@example.com'), 3, 'Good location but a bit noisy.');

-- ==========================
-- MESSAGES TABLE
-- ==========================
INSERT INTO messages (sender_id, recipient_id, message_body)
VALUES
((SELECT user_id FROM users WHERE email='michael@example.com'), (SELECT user_id FROM users WHERE email='sarah@example.com'), 'Hi Sarah, is the villa available next month?'),
((SELECT user_id FROM users WHERE email='sarah@example.com'), (SELECT user_id FROM users WHERE email='michael@example.com'), 'Hi Michael, yes, the villa is available!'),
((SELECT user_id FROM users WHERE email='emmanuel@example.com'), (SELECT user_id FROM users WHERE email='linda@example.com'), 'Hi Linda, we have a special discount on the cabin this weekend.');
