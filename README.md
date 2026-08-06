markdown


# SQL Data Analytics & Database Management
This repository contains my SQL scripts covering relational database design, data cleaning, DDL/DML operations, window functions, and business analytics queries. The queries are written for MySQL and focus on solving practical data analysis problems.
---
## SQL Scripts Included
### 1. HR Employee Attrition Analytics (`hr_attrition_analysis.sql`)
Queries focused on analyzing employee turnover patterns within an HR dataset.
* Calculated attrition rates (%) grouped by age brackets and ranked age groups by turnover.
* Identified the most common education fields and marital status groups among employees who left.
* Breakdown of turnover metrics by gender to evaluate demographic retention trends.
### 2. Store Sales & Window Functions (`store_sales_window_functions.sql`)
Analytical SQL queries for retail sales using window functions and conditional statements.
* Categorized sales volume into low, mid, and high tiers using `CASE WHEN` logic.
* Replaced missing postal code values with city names using `COALESCE()`.
* Applied ranking window functions (`RANK()`, `DENSE_RANK()`, and `ROW_NUMBER()`) across sales and quantity data.
* Used `PARTITION BY` to rank cities and store performance within each region.
### 3. Database Schema & Query Reference (`sql_master_reference_queries.sql`)
A reference script covering fundamental DDL/DML commands and table constraints.
* Table creation (`CREATE TABLE`), column modifications (`ALTER TABLE`), additions, and drop column syntax.
* Data insertion, updates (`UPDATE`), and record deletions (`DELETE`).
* Enforced constraints such as `UNIQUE`, `NOT NULL`, `DEFAULT`, and `PRIMARY KEY`.
---
## How to Run
1. Open your SQL environment (MySQL Workbench, DBeaver, or command line).
2. Create and select a database:
   CREATE DATABASE sales_analytics;
   USE sales_analytics;
3. Open and execute any of the `.sql` files in the repository.
