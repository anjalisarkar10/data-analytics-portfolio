-- ==========================================================
-- E-COMMERCE SALES ANALYSIS USING SQL
-- Dataset : bigquery-public-data.thelook_ecommerce
------------------------------------------------------------- 
--           KPI ANALYSIS
-- ==========================================================


WITH
  total_rev_query AS (
    SELECT
      ROUND(SUM(sale_price), 2) AS total_revenue,
    FROM `bigquery-public-data.thelook_ecommerce.order_items`
  ),
  total_orders_query AS (
    SELECT COUNT(*) AS total_orders
    FROM `bigquery-public-data.thelook_ecommerce.orders`
  ),
  total_cust_query AS (
    SELECT
      COUNT(DISTINCT id) AS total_customers
    FROM `bigquery-public-data.thelook_ecommerce.users`
  ),
  avg_order_value_query AS (
    SELECT
      ROUND(SUM(sale_price) / COUNT(DISTINCT order_id), 2) AS avg_order_value
    FROM `bigquery-public-data.thelook_ecommerce.order_items`
  ),
  total_profit_query AS (
    SELECT
      ROUND(SUM(oi.sale_price - p.cost), 2) AS total_profit
    FROM `bigquery-public-data.thelook_ecommerce.order_items` oi
    JOIN `bigquery-public-data.thelook_ecommerce.products` p
      ON oi.product_id = p.id
  ),
  profit_margin_query AS (
    SELECT
      ROUND(
        SUM(oi.sale_price - p.cost) * 100.0 / SUM(oi.sale_price), 2)
        AS profit_margin_pct
    FROM `bigquery-public-data.thelook_ecommerce.order_items` oi
    JOIN `bigquery-public-data.thelook_ecommerce.products` p
      ON oi.product_id = p.id
  )
SELECT
  (SELECT total_revenue FROM total_rev_query) AS totalRevenue,
  (SELECT total_orders FROM total_orders_query) AS totalOrders,
  (SELECT total_customers FROM total_cust_query) AS totalCustomers,
  (SELECT avg_order_value FROM avg_order_value_query) AS avgOrderValue,
  (SELECT total_profit FROM total_profit_query) AS totalProfit,
  (SELECT profit_margin_pct FROM profit_margin_query) AS overallProfitMargin;
