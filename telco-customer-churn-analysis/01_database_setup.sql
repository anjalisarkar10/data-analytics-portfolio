CREATE DATABASE telco_customer_churn;
USE telco_customer_churn;
-- Used the table data import wizard to import tables

-- Converting Column Names from Title Case to snake_case

ALTER TABLE telco_customer_churn_services
RENAME COLUMN `Customer ID` TO customer_id;

ALTER TABLE telco_customer_churn_services
RENAME COLUMN `Count` TO count_records,
RENAME COLUMN `Quarter` TO quarter,
RENAME COLUMN `Referred a Friend` TO referred_a_friend,
RENAME COLUMN `Number of Referrals` TO number_of_referrals,
RENAME COLUMN `Tenure in Months` TO tenure_in_months,
RENAME COLUMN `Phone Service` TO phone_service,
RENAME COLUMN `Avg Monthly Long Distance Charges` TO avg_monthly_long_distance_charges,
RENAME COLUMN `Multiple Lines` TO multiple_lines,
RENAME COLUMN `Internet Service` TO internet_service,
RENAME COLUMN `Internet Type` TO internet_type,
RENAME COLUMN `Avg Monthly GB Download` TO avg_monthly_gb_download,
RENAME COLUMN `Online Security` TO online_security,
RENAME COLUMN `Online Backup` TO online_backup,
RENAME COLUMN `Device Protection Plan` TO device_protection_plan,
RENAME COLUMN `Premium Tech Support` TO premium_tech_support,
RENAME COLUMN `Streaming TV` TO streaming_tv,
RENAME COLUMN `Streaming Movies` TO streaming_movies,
RENAME COLUMN `Streaming Music` TO streaming_music,
RENAME COLUMN `Unlimited Data` TO unlimited_data,
RENAME COLUMN `Paperless Billing` TO paperless_billing,
RENAME COLUMN `Contract` TO contract,
RENAME COLUMN `Payment Method` TO payment_method,
RENAME COLUMN `Monthly Charge` TO monthly_charge,
RENAME COLUMN `Total Charges` TO total_charges,
RENAME COLUMN `Total Refunds` TO total_refunds,
RENAME COLUMN `Total Extra Data Charges` TO total_extra_data_charges,
RENAME COLUMN `Total Long Distance Charges` TO total_long_distance_charges,
RENAME COLUMN `Total Revenue` TO total_revenue;

ALTER TABLE telco_customer_churn_status
RENAME COLUMN `Customer ID` TO customer_id,
RENAME COLUMN `Count` TO count_records,
RENAME COLUMN `Quarter` TO quarter,
RENAME COLUMN `Satisfaction Score` TO satisfaction_score,
RENAME COLUMN `Customer Status` TO customer_status,
RENAME COLUMN `Churn Label` TO churn_label,
RENAME COLUMN `Churn Value` TO churn_value,
RENAME COLUMN `Churn Score` TO churn_score,
RENAME COLUMN `CLTV` TO cltv,
RENAME COLUMN `Churn Category` TO churn_category,
RENAME COLUMN `Churn Reason` TO churn_reason;

ALTER TABLE telco_customer_churn_demographics
RENAME COLUMN `Customer ID` TO customer_id,
RENAME COLUMN `Count` TO count_records,
RENAME COLUMN `Gender` TO gender,
RENAME COLUMN `Age` TO age,
RENAME COLUMN `Under 30` TO under_30,
RENAME COLUMN `Senior Citizen` TO senior_citizen,
RENAME COLUMN `Married` TO married,
RENAME COLUMN `Dependents` TO dependents,
RENAME COLUMN `Number of Dependents` TO number_of_dependents;

ALTER TABLE telco_customer_churn_location
RENAME COLUMN `Customer ID` TO customer_id,
RENAME COLUMN `Count` TO count_records,
RENAME COLUMN `Country` TO country,
RENAME COLUMN `State` TO state,
RENAME COLUMN `City` TO city,
RENAME COLUMN `Zip Code` TO zip_code,
RENAME COLUMN `Lat Long` TO lat_long,
RENAME COLUMN `Latitude` TO latitude,
RENAME COLUMN `Longitude` TO longitude;

ALTER TABLE telco_customer_churn_population
RENAME COLUMN `ID` TO id,
RENAME COLUMN `Zip Code` TO zip_code,
RENAME COLUMN `Population` TO population;


-- Check Row Counts & Duplicate CustomerId

SELECT COUNT(*) AS total_rows,
       COUNT(DISTINCT customer_id) AS unique_customers FROM telco_customer_churn_status;
SELECT COUNT(*) AS total_rows,
       COUNT(DISTINCT customer_id) AS unique_customers FROM telco_customer_churn_services;
SELECT COUNT(*) AS total_rows,
       COUNT(DISTINCT customer_id) AS unique_customers FROM telco_customer_churn_demographics;
SELECT COUNT(*) AS total_rows,
       COUNT(DISTINCT customer_id) AS unique_customers FROM telco_customer_churn_location;
SELECT COUNT(*) FROM telco_customer_churn_population;

-- Check null values 

SELECT COUNT(*) AS null_rows
FROM telco_customer_churn_demographics
WHERE customer_id IS NULL OR gender IS NULL OR age IS NULL;
    
SELECT COUNT(*) AS null_rows
FROM telco_customer_churn_location
WHERE customer_id IS NULL OR state IS NULL OR zip_code IS NULL;

SELECT * 
FROM telco_customer_churn_demographics AS d
JOIN telco_customer_churn_location AS l
ON l.customer_id=d.customer_id
JOIN telco_customer_churn_services AS s
ON s.customer_id=l.customer_id
JOIN telco_customer_churn_status AS st
ON st.customer_id=s.customer_id;
 