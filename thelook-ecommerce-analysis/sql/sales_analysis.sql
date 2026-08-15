-- ==========================================================
-- E-COMMERCE SALES ANALYSIS USING SQL
-- Dataset : bigquery-public-data.thelook_ecommerce
-------------------------------------------------------------
--          SALES ANALYSIS
-- ==========================================================


-- Q1. Monthly Revenue Trend.

SELECT
  DATE_TRUNC(DATE(created_at), MONTH) AS month,
  ROUND(SUM(sale_price), 2) AS revenue
FROM `bigquery-public-data.thelook_ecommerce.order_items`
GROUP BY month
ORDER BY month;


-- Q2. Month-over-Month Growth

WITH
  monthly_sales AS (
    SELECT
      DATE_TRUNC(DATE(created_at), MONTH) AS month,
      ROUND(SUM(sale_price), 2) AS revenue
    FROM `bigquery-public-data.thelook_ecommerce.order_items`
    GROUP BY month
  )
SELECT
  month,
  revenue,
  ROUND(
    100
      * (revenue - LAG(revenue) OVER (ORDER BY month))
      / LAG(revenue) OVER (ORDER BY month),
    2) AS grwth_pct
FROM `monthly_sales`;

-- Q3.Find revenue by customer's age group

SELECT
  CASE
    WHEN age < 25 THEN "Under 25"
    WHEN age BETWEEN 25 AND 34 THEN "25-34"
    WHEN age BETWEEN 35 AND 44 THEN "35-44"
    ELSE "45+"
    END AS age_group,
    ROUND(SUM(oi.sale_price),2) AS revenue
  FROM `bigquery-public-data.thelook_ecommerce.users` AS u
  JOIN `bigquery-public-data.thelook_ecommerce.order_items` AS oi
  ON oi.user_id=u.id 
GROUP BY age_group;
