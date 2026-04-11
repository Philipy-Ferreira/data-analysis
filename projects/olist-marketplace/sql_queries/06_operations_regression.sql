-- =========================================
-- OPERATIONS & REGRESSION DATASET
-- Objective: build dataset for delivery performance analysis
-- =========================================

SELECT
  o.order_id,
  sg.seller_id,
  sg.seller_state,
  cg.customer_state,

  ROUND(
    ST_DISTANCE(
      ST_GEOGPOINT(seller_lng, seller_lat),
      ST_GEOGPOINT(customer_lng, customer_lat)
    ) / 1000,2
  ) AS distance_km,

  DATE_DIFF(
    DATE(order_delivered_customer_date),
    DATE(order_purchase_timestamp),
    DAY
  ) AS delivery_time_days,

  oi.freight_value,
  p.product_weight_g,
  review_score

FROM `olist-490117.1.sellers_geo` sg
JOIN `olist-490117.1.order_items` oi
  ON oi.seller_id = sg.seller_id
JOIN `olist-490117.1.orders` o
  ON oi.order_id = o.order_id
JOIN `olist-490117.1.customers` c
  ON o.customer_id = c.customer_id
JOIN `olist-490117.1.customers_geo` cg
  ON cg.customer_id = c.customer_id
JOIN `olist-490117.1.products` p
  ON oi.product_id = p.product_id
JOIN `olist-490117.1.order_reviews` r
  ON r.order_id = o.order_id
WHERE o.order_status = "delivered";