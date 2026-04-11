-- =========================================
-- DATA PREPARATION
-- Objective: build base tables for analysis
-- =========================================

-- Clean geolocation data (remove outliers)
SELECT
  geolocation_zip_code_prefix,
  AVG(geolocation_lat) AS geolocation_lat,
  AVG(geolocation_lng) AS geolocation_lng
FROM `olist-490117.1.geolocation`
WHERE geolocation_lat BETWEEN -35 AND 6
  AND geolocation_lng BETWEEN -75 AND -35
GROUP BY geolocation_zip_code_prefix;

-- Seller geolocation
SELECT
  s.seller_id,
  seller_state,
  g.geolocation_lat AS seller_lat,
  g.geolocation_lng AS seller_lng
FROM `olist-490117.1.geolocation_adj` g
JOIN `olist-490117.1.sellers` s
  ON s.seller_zip_code_prefix = g.geolocation_zip_code_prefix;

-- Customer geolocation
SELECT
  c.customer_id,
  c.customer_state,
  g.geolocation_lat AS customer_lat,
  g.geolocation_lng AS customer_lng
FROM `olist-490117.1.geolocation_adj` g
JOIN `olist-490117.1.customers` c
  ON c.customer_zip_code_prefix = g.geolocation_zip_code_prefix;