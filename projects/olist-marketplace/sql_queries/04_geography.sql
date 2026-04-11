-- =========================================
-- GEOGRAPHIC ANALYSIS
-- Objective: market share and regional imbalance
-- =========================================

-- Revenue per city
SELECT
  s.seller_city,
  ROUND(SUM(oi.price),2) AS revenue
FROM `olist-490117.1.order_items` oi
JOIN `olist-490117.1.sellers` s
  ON oi.seller_id = s.seller_id
JOIN `olist-490117.1.orders` o
  ON oi.order_id = o.order_id
WHERE o.order_status = 'delivered'
GROUP BY seller_city;

-- Market share vs GDP and population
SELECT
  pp.acronym,
  m.market_share,
  pp.population_share,
  pp.pib_share,
  (m.market_share / pp.pib_share) AS ratio_gdp
FROM `olist-490117.1.states_pib_population` pp
LEFT JOIN `olist-490117.1.market_share_per_state` m
  ON m.seller_state = pp.acronym;