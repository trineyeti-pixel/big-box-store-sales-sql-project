# big-box-store-sales-sql-project

## Project Overview 
This project analyzes transaction data regarding sales using SQL in SQLiteStudio. The goal was to clean raw sales data, standardize formatting, and extract business insights related to revenue performance, department categories, and discount impacts.
The project demonstrates SQL skills including data cleaning, transformation, validation, and exploratory analysis.

---

## Objectives
- Clean and structure raw transactional data
- Ensure data consistency and accuracy
- Analyze revenue trends across brands and departments
- Evaluate the impact of discounts on total sales
- Generate insights for business decision-making

---

## Data Cleaning Process
The following cleaning steps were performed using SQL:
- Standardized data types(INTEGER, NUMERICAL, TEXT)
- Missing categorical values were standardized using COALESCE and TRIM functions, replacing NULL and empty values with 'Unknown' to ensure consistent grouping and   prevent analytical errors in aggregation queries
- Removed duplicate transaction records
- Handled missing or blank values in key fields
- Trimmed whitespace from categorical variables
- Validated financial calculations for accuracy
- Filtered out invalid or unrealistic values

---

## Dataset Structure
The final dataset used for the analysis included:
- transaction_id
- retailer
- store_location
- project_type
- sku
- brand
- unit_price
- quantity
- bulk_discount_%
- subtotal_before_discount
- total_after_discount
- pro_program
- purchase_date

---

## Key Insights
- Samsung is the clear top-revenue driver, significantly outperforming the other brands in the dataset. This may suggest that their products deserve priority in     inventory planning, promotions and forecasting.
- Doors & Windows is the highest traffic department, with more transactions than any other department, suggesting high customer demands for those products.
- Customers are saving a lot of money per transaction. With an average discount of 6.6 percent and average savings being 1096 dollars, it is safe to assume that     the average transaction value is very high.

---
## Final Dashboard Visualization

[Project.pdf](https://github.com/user-attachments/files/28068557/Project.pdf)

---

## Tools Used
- SQLiteStudio
- SQL (SQLite dialect)

---

## Files in This Repository
- 'queries.sql' --> All SQL queries used for cleaning and analysis
- 'transactions_final.csv' --> Cleaned dataset used for analysis
- 'README.md' --> Project documentation

---

## What This Project Demonstrates
This project demonstrates the ability to:
- Work with raw, messy datasets
- Clean and transform data using SQL
- Perform exploratory data analysis
- Extract meaningful business insights
- Communicate findings clearly and professionally
