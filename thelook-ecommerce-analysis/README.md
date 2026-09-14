# TheLook Ecommerce Sales & Customer Analytics

## Overview

This project analyzes ecommerce sales, customer behavior, product performance, and geographic trends using **TheLook Ecommerce** dataset from Google BigQuery Public Datasets.

The objective was to perform end-to-end business analysis using SQL and transform the findings into an interactive Tableau dashboard that enables stakeholders to monitor key business metrics and identify growth opportunities.

---

## Dataset

**Source:** Google BigQuery Public Dataset – TheLook Ecommerce

The dataset contains information on:

* Customers
* Orders
* Orders Items
* Products

The analysis focuses on sales performance, customer purchasing patterns, product profitability, and regional revenue distribution.

Tools Used: Google BigQuery, SQL, Tableau Public

---

## Analysis Performed

### [Data Exploration](./sql/data_exploration.sql)

I reviewed the dataset for missing values, duplicate primary keys, unusual age entries, pricing inconsistencies, order status distribution, and table relationships. No significant data quality issues were identified, and the data was suitable for sales, customer, and product analysis. Users were distributed across 14 countries. During the review, I found a few cases where country names were recorded in both English and local formats, such as Spain/España (1 user) and Germany/Deutschland (4 users).

### [KPI Analysis](./sql/combined_kpi_query.sql)

Calculated core business metrics:

| Metric              | Value  |
| ------------------- | ------ |
| Total Revenue       | $10.7M |
| Total Orders        | 124K   |
| Total Customers     | 100K   |
| Average Order Value | $86.30 |
| Total Profit        | $5.5M  |
| Profit Margin       | 52%    |

### [Sales Analysis](./sql/sales_analysis.sql)

* Monthly Revenue Trend
* Month-over-Month Revenue Growth
* Revenue Contribution by Customer Age Group

Monthly revenue showed a generally upward trend over time. Month over month (MoM) growth remained relatively stable, with occasional declines but no recurring negative pattern. Customers aged 45 and above contributed the largest share of revenue, accounting for approximately 44% of the total.


### [Customer Analysis](./sql/customer_analysis.sql)

* Customer Distribution by Age Group
* Customers with Multiple Purchases
* Repeat Customers

Customers aged 45 and above make up the largest segment of the customer base. Approximately 79% of all customers are active users, and around 35% of those active users are repeat customers.


### [Product Analysis](./sql/product_analysis.sql)

* Revenue by Product Category
* Profit by Product Category
* Profit Margin by Product Category
* Highest Profit Products
* Products Priced Above Average Retail Price

Profit margins across all product categories remained consistently strong, ranging between 40% and 60%. Among all categories, "Outerwear & Coats" generated the highest revenue.


### [Geographic Analysis](./sql/geographic_analysis.sql)

* Revenue by State and Country
* States with Highest Revenue
* States with Highest Number of Inactive Customers

China generated the largest share of revenue (33%), followed by the United States (22%) and Brazil (14%). At the regional level, Guangdong (China), England (UK), and California (US) were the top revenue-contributing regions.

---

## Tableau Dashboard

**Interactive Dashboard:** [TheLook Ecommerce Analytics Dashboard](https://public.tableau.com/views/Dashboard_17847458891130/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

![Dashboard](./screenshots/dashboard_overview.png)

**Last Updated:** 21 July 2026

---
## Reccomendations

- Creating targeted campaign for customers aged 45+
- Investigating lower performing categories
- Expanding successful marketing strategies from high performing regions to other markets.

---

## Conclusion

This project demonstrates a complete analytics workflow using SQL and Tableau, transforming raw ecommerce data into actionable business insights.
