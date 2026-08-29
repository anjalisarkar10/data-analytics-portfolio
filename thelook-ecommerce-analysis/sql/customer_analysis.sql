-- ==========================================================
-- E-COMMERCE SALES ANALYSIS USING SQL
-- Dataset : bigquery-public-data.thelook_ecommerce
-------------------------------------------------------------
--          CUSTOMER ANALYSIS
-- ==========================================================


-- Q1. Top Spending Customers

SELECT
  u.id,
  u.first_name,
  u.last_name,
  ROUND(SUM(oi.sale_price), 2) AS spend
FROM `bigquery-public-data.thelook_ecommerce.users` AS u
JOIN `bigquery-public-data.thelook_ecommerce.order_items` AS oi
  ON u.id = oi.user_id
GROUP BY 1,2,3
ORDER BY spend DESC
LIMIT 10;


-- Q2. Customers by Age Group

SELECT
  CASE
    WHEN age < 25 THEN "Under 25"
    WHEN age BETWEEN 25 AND 34 THEN "25-34"
    WHEN age BETWEEN 35 AND 44 THEN "35-44"
    ELSE "45+"
    END AS age_group,
  COUNT(*) AS customers
FROM `bigquery-public-data.thelook_ecommerce.users`
GROUP BY age_group;


-- Q3. Customers who placed more than one order.

SELECT user_id,
       COUNT(order_id) AS total_orders,
FROM `bigquery-public-data.thelook_ecommerce.orders`
GROUP BY user_id
HAVING COUNT(order_id) > 1
ORDER BY total_orders DESC;
