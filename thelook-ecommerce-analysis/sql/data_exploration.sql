-- ==========================================================
--  E-COMMERCE SALES ANALYSIS USING SQL
--  Dataset : bigquery-public-data.thelook_ecommerce
-- ----------------------------------------------------------
--                  DATA EXPLORATION
-- ==========================================================

-- ----------------------------------------------------------
--  Cleaning Users Table
-- ----------------------------------------------------------

-- Q1. Check Total Records 

SELECT COUNT(*)
FROM `bigquery-public-data.thelook_ecommerce.users`;

-- Insight:The total number of rows is 100000.


-- Q2. Check Missing Values 

SELECT
COUNTIF(id IS NULL) AS null_id,
COUNTIF(first_name IS NULL) AS null_first_name,
COUNTIF(last_name IS NULL) AS null_last_name,
COUNTIF(email IS NULL) AS null_email,
COUNTIF(age IS NULL) AS null_age
FROM `bigquery-public-data.thelook_ecommerce.users`;

-- Insight:No missing values were found in key user fields,indicating good data quality for customer analysis.


-- Q3. Check Duplicate User IDs

SELECT
id,
COUNT(*)
FROM `bigquery-public-data.thelook_ecommerce.users`
GROUP BY id
HAVING COUNT(*) > 1;

-- Insight:No duplicate user IDs were detected, each customer is uniquely identified.


-- Q4. Check Age Outliers 

SELECT
MIN(age) AS minimum_age,
MAX(age) AS maximum_age,
AVG(age) AS average_age
FROM `bigquery-public-data.thelook_ecommerce.users`;

-- Insight:Customer ages fall within a reasonable range.No extreme age outliers were identified.


-- ----------------------------------------------------------
--  Cleaning Products Table
-- ----------------------------------------------------------

-- Q5. Check Missing Values 

SELECT
COUNTIF(id IS NULL) AS null_id,
COUNTIF(name IS NULL) AS null_name,
COUNTIF(category IS NULL) AS null_category,
COUNTIF(retail_price IS NULL) AS null_price,
COUNTIF(cost IS NULL) AS null_cost,
COUNTIF(sku IS NULL) AS null_sku
FROM `bigquery-public-data.thelook_ecommerce.products`;

SELECT * 
FROM `bigquery-public-data.thelook_ecommerce.products`
WHERE name IS NULL;

-- Insight: Found out 2 null names,other than that there is no null values


-- Q6. Check Duplicate Products 

SELECT
id,
COUNT(*)
FROM `bigquery-public-data.thelook_ecommerce.products`
GROUP BY id
HAVING COUNT(*) > 1;

-- Insight: There is no duplicate product id found. Each product is uniquely identified.


-- Q7. Check Invalid Prices 

SELECT *
FROM `bigquery-public-data.thelook_ecommerce.products`
WHERE retail_price <= 0
OR cost <= 0;

-- Insight: No products were found with zero or negative prices; pricing data appears valid.


-- Q8. Check Cost Greater Than Retail Price 

SELECT *
FROM `bigquery-public-data.thelook_ecommerce.products`
WHERE cost > retail_price;

-- Insight: No products were found where cost exceeds retail price,this indicates that all products are priced above their cost.


-- ----------------------------------------------------------
--  Cleaning Orders Table
-- ----------------------------------------------------------

-- Q9. Check Missing Values

SELECT
COUNTIF(order_id IS NULL) AS null_order_id,
COUNTIF(user_id IS NULL) AS null_user_id,
COUNTIF(status IS NULL) AS null_status,
COUNTIF(created_at IS NULL) AS null_created_at
FROM `bigquery-public-data.thelook_ecommerce.orders`;

-- Insight: No missing value found.


-- Q10. Check Duplicate Orders

SELECT 
order_id,
COUNT(*)
FROM `bigquery-public-data.thelook_ecommerce.orders`
GROUP BY order_id
HAVING COUNT(*)>1;

-- Insight:No duplicate order IDs were identified,ensuring accurate order counts and revenue calculations.


-- Q11. Check order status

SELECT 
status,
COUNT (*) AS total_orders
FROM `bigquery-public-data.thelook_ecommerce.orders`
GROUP BY status;

-- Insight: Multiple order statuses were observed such as Complete, Cancelled, Processing and Returned.


----------------------------------------------------------
--  Cleaning Order Items Table
----------------------------------------------------------

-- Q12. Check Missing Values.

SELECT
COUNTIF(order_id IS NULL) AS null_order_id,
COUNTIF(product_id IS NULL) AS null_product_id,
COUNTIF(user_id IS NULL) AS null_user_id,
COUNTIF(sale_price IS NULL) AS null_sale_price
FROM `bigquery-public-data.thelook_ecommerce.order_items`;

-- Insight: No major missing values were detected.


-- Q13. Check Duplicate Records

SELECT
id,
COUNT(*)
FROM `bigquery-public-data.thelook_ecommerce.order_items`
GROUP BY id
HAVING COUNT(*) > 1;

-- Insight: There is no duplicate records found.


-- Q14. Check Invalid Sale Price

SELECT *
FROM `bigquery-public-data.thelook_ecommerce.order_items`
WHERE sale_price<=0;

-- Insight: All sales transactions contain valid positive sale prices.


-- Q15.Check Orphan Records

SELECT *
FROM `bigquery-public-data.thelook_ecommerce.order_items` oi
LEFT JOIN `bigquery-public-data.thelook_ecommerce.orders` o
ON oi.order_id = o.order_id
WHERE o.order_id IS NULL;

-- Insight: No orphan records were detected,all order items are linked to valid orders.

-- ==========================================================
--             DATA CLEANING SUMMARY
-- ==========================================================

-- 1. Checked missing values across all tables.
-- 2. Verified uniqueness of primary keys.
-- 3. Validated customer age values.
-- 4. Validated product and sales prices.
-- 5. Reviewed order status distribution.
-- 6. Confirmed referential integrity between tables.

-- Result:
-- The dataset is clean, consistent, and suitable for
-- sales, customer, and product performance analysis.

-- ==========================================================



