-- =========================================
-- CORE METRICS
-- Objective: revenue, categories, price distribution
-- =========================================

-- Average price by category
SELECT
  ROUND(AVG(oi.price),2) AS average_price,
  ct.product_category_name_english
FROM `olist-490117.1.order_items` oi
JOIN `olist-490117.1.products` p
  ON oi.product_id = p.product_id
JOIN `olist-490117.1.categories_translation` ct
  ON p.product_category_name = ct.product_category_name
GROUP BY ct.product_category_name_english;

-- Revenue per seller
SELECT
  oi.seller_id,
  ROUND(SUM(oi.price),2) AS revenue
FROM `olist-490117.1.order_items` oi
JOIN `olist-490117.1.orders` o
  ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
GROUP BY seller_id;

-- Revenue per state
SELECT
  s.seller_state,
  ROUND(SUM(oi.price),2) AS revenue
FROM `olist-490117.1.order_items` oi
JOIN `olist-490117.1.sellers` s
  ON oi.seller_id = s.seller_id
JOIN `olist-490117.1.orders` o
  ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY seller_state;

-- Top categories
SELECT
  ct.product_category_name_english AS category,
  ROUND(SUM(oi.price),2) AS revenue
FROM `olist-490117.1.order_items` oi
JOIN `olist-490117.1.products` p
  ON oi.product_id = p.product_id
JOIN `olist-490117.1.categories_translation` ct
  ON p.product_category_name = ct.product_category_name
JOIN `olist-490117.1.orders` o
  ON o.order_id = oi.order_id
WHERE o.order_status = 'delivered'
GROUP BY category
ORDER BY revenue DESC
LIMIT 10;