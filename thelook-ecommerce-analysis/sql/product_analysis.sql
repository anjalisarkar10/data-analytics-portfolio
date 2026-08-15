-- ==========================================================
-- E-COMMERCE SALES ANALYSIS USING SQL
-- Dataset : bigquery-public-data.thelook_ecommerce
-------------------------------------------------------------
--         PRODUCT ANALYSIS
-- ==========================================================

-- Q1. Top 10 Products

SELECT
  p.name,
  SUM(oi.sale_price) AS revenue
FROM `bigquery-public-data.thelook_ecommerce.products` AS p
JOIN `bigquery-public-data.thelook_ecommerce.order_items` AS oi
  ON p.id = oi.product_id
GROUP BY name
ORDER BY revenue DESC
LIMIT 10;

-- Q2. -- Find  revenue,profit and profit margin by category

SELECT
  p.category,
  SUM(oi.sale_price-p.cost) AS profit,
  ROUND(SUM(oi.sale_price), 2) AS revenue,
  ROUND((SUM(oi.sale_price-p.cost))/(SUM(oi.sale_price)) * 100, 2)
    AS profit_margin_pct
FROM `bigquery-public-data.thelook_ecommerce.products` AS p
JOIN `bigquery-public-data.thelook_ecommerce.order_items` AS oi
  ON p.id = oi.product_id
GROUP BY p.category;

-- Q3. Highest Profit Products

SELECT
  name,
  SUM(oi.sale_price-p.cost) AS profit
FROM `bigquery-public-data.thelook_ecommerce.products` AS p
JOIN `bigquery-public-data.thelook_ecommerce.order_items` AS oi
  ON p.id = oi.product_id
GROUP BY name
ORDER BY profit DESC;

-- Q4. Find products priced above the average product price

SELECT
  id,
  name,
  retail_price
FROM `bigquery-public-data.thelook_ecommerce.products`
WHERE
  retail_price > (
    SELECT
      avg(retail_price)
    FROM `bigquery-public-data.thelook_ecommerce.products`
  );
