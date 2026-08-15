-- ==========================================================
-- E-COMMERCE SALES ANALYSIS USING SQL
-- Dataset : bigquery-public-data.thelook_ecommerce
-------------------------------------------------------------
--     GEOGRAPHIC ANALYSIS
-- ==========================================================


-- Q1. Revenue by State

SELECT
  u.state,
  u.country,
  SUM(oi.sale_price) AS revenue
FROM `bigquery-public-data.thelook_ecommerce.order_items` AS oi
JOIN `bigquery-public-data.thelook_ecommerce.users` AS u
  ON oi.user_id = u.id
GROUP BY u.state, u.country
ORDER BY revenue DESC;


-- Q2. States with Highest Number of Inactive Customers

SELECT
  u.state,
  COUNT(*) AS inactive_customers
FROM `bigquery-public-data.thelook_ecommerce.users` AS u
LEFT JOIN `bigquery-public-data.thelook_ecommerce.orders` AS o
  ON u.id = o.user_id
WHERE o.order_id IS NULL
GROUP BY state
ORDER BY inactive_customers DESC;
