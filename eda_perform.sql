
 -- =========================================

-- EDA (Exploratory Data Analysis)

-- =========================================
-- Disable Safe Update Mode
-- =========================================

SET SQL_SAFE_UPDATES = 0;

-- =========================================
-- Convert order_date to DATE format
-- =========================================

UPDATE orders
SET order_date =
STR_TO_DATE(order_date, '%d-%m-%Y');

-- =========================================
-- Change datatype of order_date
-- =========================================

ALTER TABLE orders
MODIFY order_date DATE;

-- Total customers

SELECT
COUNT(*) AS total_customers
FROM customers;

-- Total orders

SELECT
COUNT(*) AS total_orders
FROM orders;

-- Total products

SELECT
COUNT(*) AS total_products
FROM products;

-- Total order items

SELECT
COUNT(*) AS total_order_items
FROM order_items;

-- Missing values in customers table

SELECT *
FROM customers
WHERE customer_name IS NULL
OR city IS NULL;

-- Missing values in products table

SELECT *
FROM products
WHERE product_name IS NULL
OR category IS NULL;

-- Duplicate customer IDs

SELECT
customer_id,
COUNT(*) AS duplicate_count
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- =========================================
-- Product Category Distribution
-- =========================================

SELECT
category,
COUNT(*) AS total_products
FROM products
GROUP BY category
ORDER BY total_products DESC;

-- =========================================
-- Order Status Analysis
-- =========================================

SELECT
order_status,
COUNT(*) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;

-- =========================================
-- Payment Method Analysis
-- =========================================

SELECT
payment_method,
COUNT(*) AS total_orders
FROM orders
GROUP BY payment_method
ORDER BY total_orders DESC;

-- =========================================
-- Monthly Order Trend
-- =========================================

SELECT
DATE_FORMAT(order_date,'%Y-%m') AS month,
COUNT(*) AS total_orders
FROM orders
GROUP BY month
ORDER BY month;


-- =========================================
-- EDA Summary / Insights
-- =========================================

-- 1. Identify most used payment method
-- 2. Analyze order status distribution
-- 3. Understand category-wise product distribution
-- 4. Observe monthly order growth trend
-- 5. Detect missing or duplicate records
