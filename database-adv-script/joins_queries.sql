_ _inner Join 
SELECT 
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    b.created_at AS booking_created_at,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    u.phone_number
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id;

__Outer Join 

SELECT 
    p.property_id,
    p.name AS property_name,
    p.description,
    p.location,
    p.price_per_night,
    r.review_id,
    r.user_id AS reviewer_id,
    r.rating,
    r.comment,
    r.created_at AS review_date
FROM properties p
LEFT JOIN reviews r ON p.property_id = r.property_id;


__combination of   LEFT JOIN and aRIGHT JOIN with UNION to stimulate Full Joins.

SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status
FROM users u
LEFT JOIN bookings b ON u.user_id = b.user_id

UNION

SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    b.booking_id,
    b.property_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status
FROM users u
RIGHT JOIN bookings b ON u.user_id = b.user_id;
