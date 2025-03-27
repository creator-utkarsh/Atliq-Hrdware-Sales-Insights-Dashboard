# Atliq Hardware Sales Insights Dashboard
![image](https://github.com/user-attachments/assets/82248d87-830c-4873-b9fd-dd3533d662c6)
## Table of contents :
- [Problem Statement](#problem-statement-)
- [Data Analysis using MySQL](#data-analysis-using-mysql-)
- [Data Cleaning and Transformation](#data-cleaning-and-transformation-)
- [Data Modelling and DAX](#data-modelling-and-dax-)
- [Dashboard](#dashboard-)
- [Insights and Findings](#insights-and-findings-)

## Problem Statement :
AtliQ Hardware is a company that supplies computer hardware and peripherals to many clients across India.
At Atliq Hardware sales were dropping, and sales directors weren’t getting enough insights from regional sales managers. 
The Sales Director needed a clear view of our sales data to make better decisions and save time on manual data collection.
- Stakeholders :
  - Sales Director
  - Marketing Team
  - Customer Service Team
  - Data and Analytics Team
  - IT

## Data Analysis using MySQL :
Analysis of data by looking into different tables and reflecting garbage values.
 
We can see that there are some garbage value in the table 'market'.
```SQL
SELECT * FROM market;
```
Then we can check the transaction table where we saw that there are some negative values in sales_amount which is not possible. Also, we can see that some transactions are in USD. Hence, filtration of that is also needed by converting it to INR.
So I created a new column named 'norm_sales_amount', using these queries, where all the transactions are in INR only.
```SQL
alter table transactions
add column norm_sales_amount double ;
update transactions 
set norm_sales_amount= case when currency ='USD' then sales_amount*75 else sales_amount end;
```
Analysis of different SQL statements on the database. [SQL](https://github.com/creator-utkarsh/Atliq-Hrdware-Sales-Insights-Dashboard/blob/main/Sales%20Analysis.sql)


## Data Cleaning and Transformation :

In this process, we work on data cleaning and ETL.
- Removed blank and unnecessary rows from the zone column in the markets table.
- Cleaned and trimmed all the tables as required.
- Created a new table for the missing product code data which was available in transactions table but not in product table.
- Joined the new table data with 'Product' table using the 'Append Queries' function.
## Data modelling and DAX :

The dataset was cleaned, transformed and modeled as per STAR Schema.

![DataModel](https://github.com/user-attachments/assets/7ee657b8-3275-45a7-b9ec-f3d87336c232)

Key Measure created for visualization and proper information :
- Profit Margin % = ``` DIVIDE([Total Profit Margin],[Revenue],0) ```
- Profit Margin Contribution % = ``` DIVIDE([Total Profit Margin],CALCULATE([Total Profit Margin],ALL('sales products'),ALL('sales 
  customers'),ALL('sales markets'))) ```
- Revenue = ``` SUM('sales transactions'[sales_amount]) ```
- Revenue Contribution % = ``` DIVIDE([Revenue],CALCULATE([Revenue],ALL('sales products'),ALL('sales customers'),ALL('sales markets'))) ```
- Revenue LY = ``` CALCULATE([Revenue],SAMEPERIODLASTYEAR('sales date'[date])) ```
- Sales quantity = ``` SUM('sales transactions'[sales_qty]) ```
- Total Profit Margin = ``` SUM('Sales transactions'[Profit_Margin]) ```

## Dashboard :
**Key Executive Insights :**
![image](https://github.com/user-attachments/assets/bd292530-a4f9-446a-9da1-278585192d50)

**Profit Analysis :**
![image](https://github.com/user-attachments/assets/e006de45-3e42-44d5-80b9-a9228f0b6d70)

**Performance Insights :**
![image](https://github.com/user-attachments/assets/6b435046-4200-47f6-9a9b-a7147dc1ba5a)

## Insights and Findings :
- Total Revenue and Sales Quantity in 2020: Atliq Hardware made INR 142.22M in revenue and sold 350K units. The Delhi market generated the highest revenue at INR 77.73M.
- Brick and Mortar is the main stronghold of this business, so expansion should be in plan.
- Bhubaneswar has been the highest ROI-generating market in the last 1 year with a profit margin of 10.5%
- South Zone is the highest profit margin generating market and should be more focused upon.
- Prod318 is the top performing product.
- Electricalsara stores is the top customer with the highest revenue of 413.3 M in all four years.
- There is some data integrity issue with the product table, many product codes are missing from it, so it must be taken care of from the source.

## Thank You
