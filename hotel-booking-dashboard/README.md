# Hotel Booking Analysis Dashboard (Excel)

## About the Project

This project explores hotel booking data to understand booking trends, cancellations, revenue, and customer behavior. The dashboard was built in Microsoft Excel using Pivot Tables, Pivot Charts, KPI cards, and Slicers.

## Data Source

The dataset used in this project is the **Hotel Booking Demand** dataset from Kaggle.

**Source:** [Hotel Booking Demand Dataset (Kaggle)](https://www.kaggle.com/datasets/jessemostipak/hotel-booking-demand)

The dataset contains booking information for both a City Hotel and a Resort Hotel, including details such as booking dates, stay duration, guest information, cancellations, ADR, market segments, and distribution channels. It includes over 119,000 hotel booking records from 2015 to 2017.


## Data Enrichment

The original dataset stores countries using ISO 3166 alpha-3 country codes instead of full country names. To make the data easier to analyze and visualize, I added a country mapping sheet based on the [ISO 3166 country reference dataset](https://github.com/lukes/ISO-3166-Countries-with-Regional-Codes) maintained by Luke Duncalfe.

I used Excel's XLOOKUP function to match each country code with its country name, which made country-level analysis and visualizations much more readable.

While creating the mapping, I found 3 records with the country code TMP, which is the former ISO code for East Timor (now Timor-Leste, code: TLS). Since TMP was not present in the reference dataset, I added it manually to ensure those records could be mapped correctly.


## Tools Used

* Microsoft Excel
* Pivot Tables
* Pivot Charts
* Slicers


## Methodology
1. Performed Exploratory Data Analysis on the dataset to understand the available fields and identify useful metrics and dimensions.
2. Performed basic data cleaning and checked for unusual or missing values.
3. Created additional columns where needed to support analysis.
4. Analyzed relationships between key variables such as cancellations, ADR, lead time, and customer type.
5. Built Pivot Tables and Pivot Charts for different business questions.
6. Added Slicers and connected them across multiple Pivot Tables for interactive filtering.
7. Organized the final output into two dashboards:
    - Booking Analysis
    - Customer Insights


## Data Cleanup and Pecularities
- Blank values in the `children` column were replaced with 0.
- There are 180 records where the number of adults, children, and babies are all 0. These appear to be data entry issues, but the rest of the booking information is complete, so the records were retained.
- Some bookings show 0 weekday nights and 0 weekend nights while not being marked as cancelled. In these cases, the reservation status is typically recorded as "Check-Out" on the same day as the arrival date.
- There are 488 records where the country value is missing and stored as "NULL".


## Key Findings
- Total Bookings: 119,390
- Realized Revenue: $25M
- Potential Revenue Lost to Cancellations: $16.7M
- Average Cancellation Rate: 37%
- Average ADR: $101
- Average Stay Duration: 3.39 nights
- Repeat Booking Rate: 3.19%
- Total Unique Guests Stayed (Non-Cancelled Bookings): 229,562
- Average Lead Time: 104 days


## Key Insights
- August records the highest revenue across all years.
- City Hotel have a higher cancellation rate compared to Resort Hotel.
- Portugal and United Kingdom generate the most revenue.
- No strong correlation between cancellation rate and ADR.
- Potential revenue lost due to cancellations equals nearly 64% of realized revenue.
- Resort Hotel has higher repeat bookings than City Hotel.
- A longer lead time correlates with higher cancellation rate.
- Contract customers have the longest stay duration on average.
- Guests who were alloted their preferred booking room had higher cancellation rate than guests who were alloted a different room.
- More than half of Realized Revenue came from Online TA (Travel Agent) bookings.


## Dashboard Preview

(Add screenshots here)
