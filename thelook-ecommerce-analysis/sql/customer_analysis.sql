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
GROUP BY 1, 2, 3
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

SELECT
  user_id,
  COUNT(order_id) AS total_orders,
FROM `bigquery-public-data.thelook_ecommerce.orders`
GROUP BY user_id
HAVING COUNT(order_id) > 1
ORDER BY total_orders DESC;

-- Q4. Repeat Customer distribution

WITH
  t1 AS (
    SELECT
      u.id AS user_id,
      COUNT(o.order_id) AS count_orders
    FROM `bigquery-public-data.thelook_ecommerce.users` u
    LEFT JOIN `bigquery-public-data.thelook_ecommerce.orders` o
      ON o.user_id = u.id
    GROUP BY u.id
  )
SELECT count_orders, COUNT(user_id) AS num_users
FROM t1
GROUP BY count_orders
ORDER BY 1;

-- 1	0	20265
-- 2	1	49756
-- 3	2	19903
-- 4	3	5003
-- 5	4	5073

-- Q5. Percentage of Active Users
----(count of users who have placed an order/total number of users)*100

SELECT
  (
    (
      SELECT COUNT(DISTINCT (user_id)) AS distinct_user_count
      FROM `bigquery-public-data.thelook_ecommerce.orders`
    )
    / (SELECT COUNT(*) FROM `bigquery-public-data.thelook_ecommerce.users`))
  * 100;

-- Q6. Percentage of Repeat Users
-- (count of users who have more than one order / total number of active users) * 100

WITH
  repeated_customers AS (
    SELECT
      user_id,
      COUNT(order_id) AS total_orders,
    FROM `bigquery-public-data.thelook_ecommerce.orders`
    GROUP BY user_id
    HAVING COUNT(order_id) > 1
    ORDER BY total_orders DESC
  ),
  total_active_users AS (
    SELECT COUNT(DISTINCT (user_id)) AS distinct_user_count
    FROM `bigquery-public-data.thelook_ecommerce.orders`
  )
SELECT
  (
    (SELECT COUNT(*) FROM repeated_customers)
    / (SELECT distinct_user_count FROM total_active_users)
    * 100);
