-- =====================================================
-- E-COMMERCE FUNNEL ANALYSIS PROJECT - BEGINNER FRIENDLY
-- =====================================================
-- This project tracks how customers move through an online store
-- from their first visit to making a purchase
-- =====================================================

-- =====================================================
-- STEP 1: CREATE DATABASE
-- =====================================================
-- First, we create a new database to store all our data
CREATE DATABASE ecommerce_funnel;
USE ecommerce_funnel;

-- =====================================================
-- STEP 2: CREATE TABLES
-- =====================================================

-- Table 1: Users - stores basic customer information
CREATE TABLE users (
    user_id INT PRIMARY KEY,              -- Unique ID for each user
    signup_date DATE,                     -- When they signed up
    country VARCHAR(50),                  -- Where they're from
    device_type VARCHAR(20),              -- Mobile, Desktop, or Tablet
    channel VARCHAR(50)                   -- How they found us (Google, Facebook, etc.)
);

-- Table 2: Sessions - tracks each visit to the website
CREATE TABLE sessions (
    session_id INT PRIMARY KEY,           -- Unique ID for each visit
    user_id INT,                          -- Which user made this visit
    visit_date DATETIME,                  -- When they visited
    first_page VARCHAR(100),              -- First page they landed on
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Table 3: Product Views - records when someone looks at a product
CREATE TABLE product_views (
    view_id INT PRIMARY KEY,              -- Unique ID for each product view
    session_id INT,                       -- Which visit this happened in
    user_id INT,                          -- Which user viewed it
    product_id INT,                       -- Which product they viewed
    category VARCHAR(50),                 -- Product category (Electronics, Clothing, etc.)
    price DECIMAL(10,2),                  -- Product price
    view_time DATETIME,                   -- When they viewed it
    FOREIGN KEY (session_id) REFERENCES sessions(session_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Table 4: Cart - tracks when users add items to their shopping cart
CREATE TABLE cart_adds (
    cart_id INT PRIMARY KEY,              -- Unique ID for cart action
    session_id INT,                       -- Which visit this happened in
    user_id INT,                          -- Which user added to cart
    product_id INT,                       -- Which product they added
    quantity INT,                         -- How many items
    added_time DATETIME,                  -- When they added it
    FOREIGN KEY (session_id) REFERENCES sessions(session_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Table 5: Checkouts - records when someone starts the checkout process
CREATE TABLE checkouts (
    checkout_id INT PRIMARY KEY,          -- Unique ID for checkout
    session_id INT,                       -- Which visit this happened in
    user_id INT,                          -- Which user started checkout
    checkout_time DATETIME,               -- When they started checkout
    FOREIGN KEY (session_id) REFERENCES sessions(session_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Table 6: Orders - the final step! Records completed purchases
CREATE TABLE orders (
    order_id INT PRIMARY KEY,             -- Unique ID for each order
    session_id INT,                       -- Which visit resulted in this order
    user_id INT,                          -- Which user made the purchase
    order_time DATETIME,                  -- When they completed the purchase
    total_amount DECIMAL(10,2),           -- How much they spent
    status VARCHAR(50),                   -- Order status (completed, cancelled, etc.)
    FOREIGN KEY (session_id) REFERENCES sessions(session_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- =====================================================
-- STEP 3: INSERT SAMPLE DATA
-- =====================================================

-- Insert 20 sample users
INSERT INTO users VALUES
(1, '2024-01-10', 'USA', 'Mobile', 'Google'),
(2, '2024-01-11', 'UK', 'Desktop', 'Facebook'),
(3, '2024-01-12', 'Canada', 'Mobile', 'Instagram'),
(4, '2024-01-13', 'USA', 'Desktop', 'Email'),
(5, '2024-01-14', 'India', 'Mobile', 'Google'),
(6, '2024-01-15', 'USA', 'Desktop', 'Organic'),
(7, '2024-01-16', 'UK', 'Tablet', 'Facebook'),
(8, '2024-01-17', 'Germany', 'Desktop', 'Google'),
(9, '2024-01-18', 'USA', 'Mobile', 'Instagram'),
(10, '2024-01-19', 'Canada', 'Desktop', 'Email'),
(11, '2024-01-20', 'USA', 'Mobile', 'Google'),
(12, '2024-01-21', 'France', 'Desktop', 'Organic'),
(13, '2024-01-22', 'India', 'Mobile', 'Facebook'),
(14, '2024-01-23', 'UK', 'Desktop', 'Google'),
(15, '2024-01-24', 'USA', 'Tablet', 'Instagram'),
(16, '2024-01-25', 'Spain', 'Mobile', 'Email'),
(17, '2024-01-26', 'USA', 'Desktop', 'Organic'),
(18, '2024-01-27', 'Canada', 'Mobile', 'Google'),
(19, '2024-01-28', 'Germany', 'Desktop', 'Facebook'),
(20, '2024-01-29', 'USA', 'Mobile', 'Instagram');

-- Insert 20 sessions (website visits)
INSERT INTO sessions VALUES
(101, 1, '2024-02-01 10:30:00', '/home'),
(102, 2, '2024-02-01 11:15:00', '/products'),
(103, 3, '2024-02-01 14:20:00', '/sale'),
(104, 4, '2024-02-01 16:45:00', '/home'),
(105, 5, '2024-02-02 09:10:00', '/products'),
(106, 6, '2024-02-02 12:30:00', '/home'),
(107, 7, '2024-02-02 15:20:00', '/sale'),
(108, 8, '2024-02-03 10:00:00', '/products'),
(109, 9, '2024-02-03 13:45:00', '/home'),
(110, 10, '2024-02-03 17:30:00', '/products'),
(111, 11, '2024-02-04 08:15:00', '/home'),
(112, 12, '2024-02-04 11:00:00', '/sale'),
(113, 13, '2024-02-04 14:30:00', '/products'),
(114, 14, '2024-02-05 09:45:00', '/home'),
(115, 15, '2024-02-05 12:20:00', '/products'),
(116, 16, '2024-02-05 16:00:00', '/home'),
(117, 17, '2024-02-06 10:30:00', '/sale'),
(118, 18, '2024-02-06 13:15:00', '/products'),
(119, 19, '2024-02-06 15:45:00', '/home'),
(120, 20, '2024-02-07 11:30:00', '/products');

-- Insert 15 product views (not everyone views products)
INSERT INTO product_views VALUES
(201, 101, 1, 1001, 'Electronics', 299.99, '2024-02-01 10:35:00'),
(202, 102, 2, 1002, 'Clothing', 49.99, '2024-02-01 11:20:00'),
(203, 104, 4, 1003, 'Electronics', 599.99, '2024-02-01 16:50:00'),
(204, 105, 5, 1004, 'Home', 149.99, '2024-02-02 09:20:00'),
(205, 106, 6, 1005, 'Electronics', 399.99, '2024-02-02 12:40:00'),
(206, 108, 8, 1006, 'Clothing', 79.99, '2024-02-03 10:10:00'),
(207, 110, 10, 1007, 'Electronics', 899.99, '2024-02-03 17:40:00'),
(208, 112, 12, 1008, 'Home', 199.99, '2024-02-04 11:15:00'),
(209, 113, 13, 1009, 'Clothing', 39.99, '2024-02-04 14:40:00'),
(210, 114, 14, 1010, 'Electronics', 699.99, '2024-02-05 09:55:00'),
(211, 115, 15, 1001, 'Electronics', 299.99, '2024-02-05 12:30:00'),
(212, 117, 17, 1002, 'Clothing', 49.99, '2024-02-06 10:45:00'),
(213, 118, 18, 1003, 'Electronics', 599.99, '2024-02-06 13:25:00'),
(214, 119, 19, 1004, 'Home', 149.99, '2024-02-06 15:55:00'),
(215, 120, 20, 1005, 'Electronics', 399.99, '2024-02-07 11:40:00');

-- Insert 10 cart additions (not everyone who views adds to cart)
INSERT INTO cart_adds VALUES
(301, 101, 1, 1001, 1, '2024-02-01 10:37:00'),
(302, 102, 2, 1002, 2, '2024-02-01 11:22:00'),
(303, 104, 4, 1003, 1, '2024-02-01 16:52:00'),
(304, 106, 6, 1005, 1, '2024-02-02 12:42:00'),
(305, 110, 10, 1007, 1, '2024-02-03 17:42:00'),
(306, 112, 12, 1008, 1, '2024-02-04 11:17:00'),
(307, 114, 14, 1010, 1, '2024-02-05 09:57:00'),
(308, 117, 17, 1002, 3, '2024-02-06 10:47:00'),
(309, 118, 18, 1003, 1, '2024-02-06 13:27:00'),
(310, 120, 20, 1005, 2, '2024-02-07 11:42:00');

-- Insert 7 checkouts (some people abandon their cart)
INSERT INTO checkouts VALUES
(401, 101, 1, '2024-02-01 10:40:00'),
(402, 102, 2, '2024-02-01 11:25:00'),
(403, 104, 4, '2024-02-01 16:55:00'),
(404, 110, 10, '2024-02-03 17:45:00'),
(405, 114, 14, '2024-02-05 10:00:00'),
(406, 118, 18, '2024-02-06 13:30:00'),
(407, 120, 20, '2024-02-07 11:45:00');

-- Insert 5 completed orders (some people abandon at checkout)
INSERT INTO orders VALUES
(501, 101, 1, '2024-02-01 10:42:00', 299.99, 'completed'),
(502, 102, 2, '2024-02-01 11:27:00', 99.98, 'completed'),
(503, 104, 4, '2024-02-01 16:57:00', 599.99, 'completed'),
(504, 110, 10, '2024-02-03 17:47:00', 899.99, 'completed'),
(505, 118, 18, '2024-02-06 13:32:00', 599.99, 'completed');

-- =====================================================
-- STEP 4: SIMPLE FUNNEL ANALYSIS QUERIES
-- =====================================================

-- QUERY 1: Basic Funnel - See how many people at each step
-- This shows us the complete customer journey
SELECT 
    'Step 1: Website Visits' AS step_name,
    COUNT(*) AS number_of_people,
    '100%' AS percentage
FROM sessions

UNION ALL

SELECT 
    'Step 2: Viewed Products' AS step_name,
    COUNT(*) AS number_of_people,
    CONCAT(ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM sessions), 1), '%') AS percentage
FROM product_views

UNION ALL

SELECT 
    'Step 3: Added to Cart' AS step_name,
    COUNT(*) AS number_of_people,
    CONCAT(ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM sessions), 1), '%') AS percentage
FROM cart_adds

UNION ALL

SELECT 
    'Step 4: Started Checkout' AS step_name,
    COUNT(*) AS number_of_people,
    CONCAT(ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM sessions), 1), '%') AS percentage
FROM checkouts

UNION ALL

SELECT 
    'Step 5: Completed Purchase' AS step_name,
    COUNT(*) AS number_of_people,
    CONCAT(ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM sessions), 1), '%') AS percentage
FROM orders;

-- QUERY 2: Which device works best?
-- Let's see if Mobile, Desktop, or Tablet users buy more
SELECT 
    u.device_type AS device,
    COUNT(DISTINCT s.session_id) AS total_visits,
    COUNT(DISTINCT o.order_id) AS total_purchases,
    CONCAT(ROUND(COUNT(DISTINCT o.order_id) * 100.0 / COUNT(DISTINCT s.session_id), 1), '%') AS conversion_rate
FROM users u
JOIN sessions s ON u.user_id = s.user_id
LEFT JOIN orders o ON s.session_id = o.session_id
GROUP BY u.device_type
ORDER BY conversion_rate DESC;

-- QUERY 3: Which marketing channel brings the best customers?
-- Compare Google, Facebook, Instagram, Email, and Organic
SELECT 
    u.channel AS marketing_channel,
    COUNT(DISTINCT s.session_id) AS total_visits,
    COUNT(DISTINCT o.order_id) AS total_purchases,
    CONCAT(ROUND(COUNT(DISTINCT o.order_id) * 100.0 / COUNT(DISTINCT s.session_id), 1), '%') AS conversion_rate,
    CONCAT('$', ROUND(IFNULL(SUM(o.total_amount), 0), 2)) AS total_revenue
FROM users u
JOIN sessions s ON u.user_id = s.user_id
LEFT JOIN orders o ON s.session_id = o.session_id
GROUP BY u.channel
ORDER BY total_revenue DESC;

-- QUERY 4: Cart Abandonment - How many people leave items in cart?
SELECT 
    COUNT(DISTINCT ca.session_id) AS people_who_added_to_cart,
    COUNT(DISTINCT o.session_id) AS people_who_purchased,
    COUNT(DISTINCT ca.session_id) - COUNT(DISTINCT o.session_id) AS abandoned_carts,
    CONCAT(ROUND((COUNT(DISTINCT ca.session_id) - COUNT(DISTINCT o.session_id)) * 100.0 / 
        COUNT(DISTINCT ca.session_id), 1), '%') AS abandonment_rate
FROM cart_adds ca
LEFT JOIN orders o ON ca.session_id = o.session_id;

-- QUERY 5: Which product category sells best?
SELECT 
    pv.category AS product_category,
    COUNT(DISTINCT pv.session_id) AS people_who_viewed,
    COUNT(DISTINCT ca.session_id) AS people_who_added_to_cart,
    COUNT(DISTINCT o.session_id) AS people_who_purchased,
    CONCAT('$', ROUND(IFNULL(SUM(o.total_amount), 0), 2)) AS total_revenue
FROM product_views pv
LEFT JOIN cart_adds ca ON pv.session_id = ca.session_id AND pv.product_id = ca.product_id
LEFT JOIN orders o ON pv.session_id = o.session_id
GROUP BY pv.category
ORDER BY total_revenue DESC;

-- QUERY 6: Which landing page converts best?
-- Landing page = the first page someone sees when they visit
SELECT 
    s.first_page AS landing_page,
    COUNT(DISTINCT s.session_id) AS total_visits,
    COUNT(DISTINCT o.order_id) AS total_purchases,
    CONCAT(ROUND(COUNT(DISTINCT o.order_id) * 100.0 / COUNT(DISTINCT s.session_id), 1), '%') AS conversion_rate
FROM sessions s
LEFT JOIN orders o ON s.session_id = o.session_id
GROUP BY s.first_page
ORDER BY conversion_rate DESC;

-- QUERY 7: Revenue Summary - Overall business metrics
SELECT 
    COUNT(DISTINCT o.order_id) AS total_orders,
    CONCAT('$', ROUND(SUM(o.total_amount), 2)) AS total_revenue,
    CONCAT('$', ROUND(AVG(o.total_amount), 2)) AS average_order_value,
    CONCAT('$', ROUND(SUM(o.total_amount) / (SELECT COUNT(*) FROM sessions), 2)) AS revenue_per_visit
FROM orders o
WHERE o.status = 'completed';

-- QUERY 8: Day-by-Day Performance
-- See how sales vary by day
SELECT 
    DATE(s.visit_date) AS date,
    COUNT(DISTINCT s.session_id) AS visits,
    COUNT(DISTINCT o.order_id) AS orders,
    CONCAT('$', ROUND(IFNULL(SUM(o.total_amount), 0), 2)) AS revenue
FROM sessions s
LEFT JOIN orders o ON s.session_id = o.session_id
GROUP BY DATE(s.visit_date)
ORDER BY date;

-- QUERY 9: How long does it take people to buy?
-- Time from first view to purchase
SELECT 
    s.session_id,
    s.user_id,
    pv.view_time AS first_product_view,
    o.order_time AS purchase_time,
    TIMESTAMPDIFF(MINUTE, pv.view_time, o.order_time) AS minutes_to_purchase
FROM sessions s
JOIN product_views pv ON s.session_id = pv.session_id
JOIN orders o ON s.session_id = o.session_id
WHERE o.status = 'completed'
ORDER BY minutes_to_purchase;

-- QUERY 10: Success Rate Summary
-- Quick overview of how well the funnel is working
SELECT 
    (SELECT COUNT(*) FROM sessions) AS total_visits,
    (SELECT COUNT(*) FROM orders) AS total_purchases,
    CONCAT(ROUND((SELECT COUNT(*) FROM orders) * 100.0 / (SELECT COUNT(*) FROM sessions), 1), '%') AS overall_success_rate,
    CONCAT('We convert ', ROUND((SELECT COUNT(*) FROM orders) * 100.0 / (SELECT COUNT(*) FROM sessions), 1), 
           '% of visitors into customers') AS summary;

-- =====================================================
-- BONUS: Simple Recommendations Query
-- =====================================================

-- This query gives you actionable insights
SELECT 
    'Recommendation' AS insight_type,
    recommendation
FROM (
    SELECT 1 AS sort_order, CONCAT('Focus on ', device_type, ' users - they have the highest conversion rate') AS recommendation
    FROM (
        SELECT u.device_type, COUNT(DISTINCT o.order_id) * 100.0 / COUNT(DISTINCT s.session_id) AS conv_rate
        FROM users u
        JOIN sessions s ON u.user_id = s.user_id
        LEFT JOIN orders o ON s.session_id = o.session_id
        GROUP BY u.device_type
        ORDER BY conv_rate DESC
        LIMIT 1
    ) AS best_device
    
    UNION ALL
    
    SELECT 2, CONCAT('Invest more in ', channel, ' - it generates the most revenue') AS recommendation
    FROM (
        SELECT u.channel, SUM(o.total_amount) AS revenue
        FROM users u
        JOIN sessions s ON u.user_id = s.user_id
        LEFT JOIN orders o ON s.session_id = o.session_id
        GROUP BY u.channel
        ORDER BY revenue DESC
        LIMIT 1
    ) AS best_channel
    
    UNION ALL
    
    SELECT 3, CONCAT('Reduce cart abandonment - you\'re losing ', 
        ROUND((COUNT(DISTINCT ca.session_id) - COUNT(DISTINCT o.session_id)) * 100.0 / COUNT(DISTINCT ca.session_id), 1),
        '% of potential sales') AS recommendation
    FROM cart_adds ca
    LEFT JOIN orders o ON ca.session_id = o.session_id
) AS insights
ORDER BY sort_order;

-- =====================================================
-- END OF BEGINNER-FRIENDLY SQL PROJECT
-- =====================================================
-- You now have everything you need!
-- Run these queries one by one to see your analysis
-- =====================================================