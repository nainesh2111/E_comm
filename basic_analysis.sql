
-- =========================================
-- BASIC SQL ANALYSIS
-- =========================================

-- =====================================================
-- Business Problem 1:
-- Management wants to know total revenue generated
-- by the platform.
-- =====================================================

SELECT
SUM(quantity * selling_price) AS total_revenue
FROM order_items;

-- =====================================================
-- Business Problem 2:
-- Find top 10 selling products based on quantity sold.
-- =====================================================

SELECT
p.product_name,
SUM(oi.quantity) AS total_quantity
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity DESC
LIMIT 10;

-- =====================================================
-- Business Problem 3:
-- Identify products generating highest revenue.
-- =====================================================

SELECT
p.product_name,
SUM(oi.quantity * oi.selling_price) AS revenue
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC
LIMIT 10;

-- =====================================================
-- Business Problem 4:
-- Analyze the most preferred payment methods.
-- =====================================================

SELECT
payment_method,
COUNT(*) AS total_orders
FROM orders
GROUP BY payment_method
ORDER BY total_orders DESC;

-- =====================================================
-- Business Problem 5:
-- Find cities contributing highest customers.
-- =====================================================

SELECT
city,
COUNT(*) AS total_customers
FROM customers
GROUP BY city
ORDER BY total_customers DESC
LIMIT 10;

-- =====================================================
-- Business Problem 6:
-- Analyze order status distribution to understand
-- delivery and cancellation performance.
-- =====================================================

SELECT
order_status,
COUNT(*) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;

-- =====================================================
-- Business Problem 7:
-- Track monthly order growth trend.
-- =====================================================

SELECT
DATE_FORMAT(order_date,'%Y-%m') AS month,
COUNT(*) AS total_orders
FROM orders
GROUP BY month
ORDER BY month;

-- =====================================================
-- Business Problem 8:
-- Find categories contributing highest revenue.
-- =====================================================

SELECT
p.category,
SUM(oi.quantity * oi.selling_price) AS revenue
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id
GROUP BY p.category
ORDER BY revenue DESC;

-- =====================================================
-- Business Problem 9:
-- Identify customers placing highest number of orders.
-- =====================================================

SELECT
c.customer_name,
COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_name
ORDER BY total_orders DESC
LIMIT 10;

-- =========================================
-- INDEXES FOR QUERY OPTIMIZATION
-- =========================================

CREATE INDEX idx_orders_customer
ON orders(customer_id);

CREATE INDEX idx_orderitems_product
ON order_items(product_id);
