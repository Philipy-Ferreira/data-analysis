-- =========================================
-- MARKET CONCENTRATION (HHI)
-- Objective: measure concentration across dimensions
-- =========================================

-- Seller-level HHI
SELECT 
  SUM(POWER(market_share,2))*10000 AS hhi_per_seller
FROM `olist-490117.1.seller_market_share`;

-- State-level HHI
SELECT
  ROUND(SUM(POWER(market_share,2))*10000) AS hhi_per_state
FROM `olist-490117.1.market_share_per_state`;