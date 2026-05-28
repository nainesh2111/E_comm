# E-Commerce Sales Analysis using MySQL

## Project Overview

This project focuses on analyzing an e-commerce dataset using MySQL to solve real-world business problems. The analysis helps understand customer behavior, sales performance, product trends, and business growth patterns.

The project includes:

* Data Cleaning
* Exploratory Data Analysis (EDA)
* Basic SQL Analysis
* Moderate SQL Analysis
* Advanced SQL Analysis

## Dataset Used

The dataset contains the following tables:

* customers
* orders
* order_items
* products

## Tools & Technologies

* MySQL
* MySQL Workbench
* SQL

## Database Schema

The project is based on the following relationships:

customers → orders → order_items → products

## Data Cleaning

The following cleaning steps were performed:

* Converted date columns into DATE format
* Checked NULL values
* Identified duplicate records
* Verified data consistency

## Exploratory Data Analysis (EDA)

EDA was performed to understand the dataset and identify trends.

Analysis performed:

* Total records analysis
* Product category distribution
* Order status analysis
* Payment method analysis
* Monthly order trends
* Duplicate and NULL value checks

## Basic SQL Analysis

Business problems solved:

* Total revenue generated
* Top-selling products
* Highest revenue generating products
* Most used payment methods
* Top customer cities
* Revenue by category
* Customers with highest orders

## Moderate SQL Analysis

Business problems solved:

* Repeat customer analysis
* Monthly revenue trend
* Average order value
* Products priced above average
* Customer spending analysis
* Cancellation percentage analysis

## Advanced SQL Analysis

Advanced SQL concepts used:

* Window Functions
* RANK()
* DENSE_RANK()
* Running Revenue Analysis

Business problems solved:

* Product revenue ranking
* Running monthly revenue
* Customer ranking based on spending

## SQL Concepts Used

* SELECT
* GROUP BY
* ORDER BY
* HAVING
* JOIN
* Subqueries
* Aggregate Functions
* Window Functions
* Date Functions

## Key Business Insights

* Certain categories generate higher revenue.
* A small group of customers contributes major sales.
* Online payment methods are highly preferred.
* Monthly sales show business growth trends.
* Repeat customers contribute significantly to revenue.

## Project Structure

```text
Ecommerce-SQL-Project/
│
├── datasets/
├── 01_database_setup.sql
├── 02_data_cleaning.sql
├── 03_eda.sql
├── 04_basic_analysis.sql
├── 05_moderate_analysis.sql
├── 06_advanced_analysis.sql
└── README.md
```

## Conclusion

This project demonstrates how SQL can be used to solve real-world e-commerce business problems through data analysis and business insights generation.
