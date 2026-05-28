-- =========================================
-- ADVANCED SQL ANALYSIS
-- =========================================

-- =====================================================
-- Business Problem 1:
-- Rank top products based on revenue.
-- =====================================================

SELECT
    p.product_name,

    SUM(oi.quantity * oi.selling_price) AS revenue,

    RANK() OVER(
        ORDER BY SUM(oi.quantity * oi.selling_price) DESC
    ) AS product_rank

FROM order_items oi

JOIN products p
ON oi.product_id = p.product_id

GROUP BY p.product_name;

-- =====================================================
-- Business Problem 2:
-- Calculate running monthly revenue.
-- =====================================================

SELECT
    DATE_FORMAT(o.order_date,'%Y-%m') AS month,

    SUM(oi.quantity * oi.selling_price) AS revenue,

    SUM(SUM(oi.quantity * oi.selling_price))
    OVER(
        ORDER BY DATE_FORMAT(o.order_date,'%Y-%m')
    ) AS running_revenue

FROM orders o

JOIN order_items oi
ON o.order_id = oi.order_id

GROUP BY month;

-- =====================================================
-- Business Problem 3:
-- Find top customers using dense ranking.
-- =====================================================

SELECT
    c.customer_name,

    SUM(oi.quantity * oi.selling_price) AS total_spent,

    DENSE_RANK() OVER(
        ORDER BY SUM(oi.quantity * oi.selling_price) DESC
    ) AS customer_rank

FROM customers c

JOIN orders o
ON c.customer_id = o.customer_id

JOIN order_items oi
ON o.order_id = oi.order_id

GROUP BY c.customer_name;
