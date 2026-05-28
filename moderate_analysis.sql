-- =========================================
-- MODERATE SQL ANALYSIS
-- =========================================

-- =====================================================
-- Business Problem 1:
-- Find customers who placed more than 5 orders.
-- =====================================================

SELECT
c.customer_name,
COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING total_orders > 5
ORDER BY total_orders DESC;

-- =====================================================
-- Business Problem 2:
-- Calculate monthly revenue trend to identify
-- business growth over time.
-- =====================================================

SELECT
DATE_FORMAT(o.order_date,'%Y-%m') AS month,
SUM(oi.quantity * oi.selling_price) AS revenue
FROM orders o
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY month
ORDER BY month;

-- =====================================================
-- Business Problem 3:
-- Find products priced above average product price.
-- =====================================================

SELECT
product_name,
category,
price
FROM products
WHERE price >
(
SELECT AVG(price)
FROM products
)
ORDER BY price DESC;

-- =====================================================
-- Business Problem 4:
-- Identify repeat customers who made multiple purchases.
-- =====================================================

SELECT
c.customer_name,
COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
HAVING total_orders > 1
ORDER BY total_orders DESC;

-- =====================================================
-- Business Problem 5:
-- Find cancellation percentage for each order status.
-- =====================================================

SELECT
order_status,
COUNT(*) AS total_orders,
ROUND(
COUNT(*) * 100.0 /
(SELECT COUNT(*) FROM orders),
2
) AS percentage
FROM orders
GROUP BY order_status
ORDER BY percentage DESC;

-- =====================================================
-- Business Problem 6:
-- Find top customers based on total amount spent.
-- =====================================================

SELECT
c.customer_name,
SUM(oi.quantity * oi.selling_price) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
JOIN order_items oi
ON o.order_id = oi.order_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 10;

-- =====================================================
-- Business Problem 7:
-- Find average revenue generated per order.
-- =====================================================

SELECT
ROUND(
SUM(quantity * selling_price)
/
COUNT(DISTINCT order_id),
2
) AS avg_order_value
FROM order_items;
