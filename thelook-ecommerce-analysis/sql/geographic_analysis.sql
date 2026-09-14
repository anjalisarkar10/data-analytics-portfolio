-- ==========================================================
-- E-COMMERCE SALES ANALYSIS USING SQL
-- Dataset : bigquery-public-data.thelook_ecommerce
-------------------------------------------------------------
--     GEOGRAPHIC ANALYSIS
-- ==========================================================

-- Q1. Revenue by Country

SELECT
  u.country,
  SUM(oi.sale_price) AS revenue,
  ROUND(
    100 * SUM(oi.sale_price) / SUM(SUM(oi.sale_price)) OVER (),
    2) AS revenue_percentage
FROM `bigquery-public-data.thelook_ecommerce.order_items` AS oi
JOIN `bigquery-public-data.thelook_ecommerce.users` AS u
  ON oi.user_id = u.id
GROUP BY u.country
ORDER BY revenue DESC;

-- Q2. Revenue by State

SELECT
  u.state,
  u.country,
  SUM(oi.sale_price) AS revenue
FROM `bigquery-public-data.thelook_ecommerce.order_items` AS oi
JOIN `bigquery-public-data.thelook_ecommerce.users` AS u
  ON oi.user_id = u.id
GROUP BY u.state, u.country
ORDER BY revenue DESC;

-- Q3. States with Highest Number of Inactive Customers

SELECT
  u.state,
  u.country,
  COUNT(*) AS inactive_customers
FROM `bigquery-public-data.thelook_ecommerce.users` AS u
LEFT JOIN `bigquery-public-data.thelook_ecommerce.orders` AS o
  ON u.id = o.user_id
WHERE o.order_id IS NULL
GROUP BY 1, 2
ORDER BY inactive_customers DESC;
