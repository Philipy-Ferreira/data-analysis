-- =========================================
-- RETENTION ANALYSIS
-- Objective: identify new vs returning customers and sellers
-- =========================================

-- First purchase per customer
SELECT
  c.customer_unique_id,
  DATE_TRUNC(MIN(DATE(o.order_purchase_timestamp)), MONTH) AS first_month
FROM `olist-490117.1.customers` c
JOIN `olist-490117.1.orders` o
  ON o.customer_id = c.customer_id
WHERE o.order_status = 'delivered'
GROUP BY customer_unique_id;

-- Monthly customer retention
WITH monthly_customers AS (
  SELECT DISTINCT
    c.customer_unique_id,
    DATE_TRUNC(DATE(o.order_purchase_timestamp), MONTH) AS month
  FROM `olist-490117.1.customers` c
  JOIN `olist-490117.1.orders` o
    ON o.customer_id = c.customer_id
  WHERE o.order_status = 'delivered'
),

first_customers AS (
  SELECT
    customer_unique_id,
    MIN(month) AS first_month
  FROM monthly_customers
  GROUP BY customer_unique_id
)

SELECT
  mc.month,
  COUNTIF(mc.month = fc.first_month) AS new_customers,
  COUNTIF(mc.month > fc.first_month) AS returning_customers
FROM monthly_customers mc
JOIN first_customers fc
  ON mc.customer_unique_id = fc.customer_unique_id
GROUP BY mc.month
ORDER BY mc.month;