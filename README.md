# Sales_Data_Insights

<div align="center">

# 🛍️ Sales Data Analytics Project

## 📈 From Raw Data to Actionable Business Insights

![SQL](https://img.shields.io/badge/SQL-PostgreSQL-4169E1?style=for-the-badge&logo=postgresql&logoColor=white)
![Data Cleaning](https://img.shields.io/badge/Data_Cleaning-100%25-success?style=for-the-badge)
![Analysis](https://img.shields.io/badge/Analysis-Comprehensive-blue?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=for-the-badge)

</div>

---

## 📋 Project Overview

This project demonstrates a **complete end-to-end data analysis workflow** using SQL on a retail sales dataset. From data cleaning and preparation to advanced analytical queries, this project showcases real-world data analysis skills that drive **business decision-making**.

### 🎯 Business Problem
A retail company wants to understand their sales performance, customer behavior, product performance, and operational efficiency to optimize their business strategy.

## Key Findings
- 🏆 **Top Product:** Smartphones (450 units sold)
- 👑 **Best Customer:** Customer A (₹1,25,000 spent)
- ⏰ **Peak Time:** Afternoon (12PM-5PM)
- 💳 **Popular Payment:** Credit Card (45%)


## SQL Queries Included
- Data cleaning & duplicate removal
- Customer spending analysis
- Product performance tracking
- Monthly sales trends
- Age group analysis


### ✅ Solutions Delivered
- ✨ **Cleaned & Standardized** messy sales data
- 🔍 **Identified & Removed** duplicate records
- 📊 **Generated** 10+ actionable business insights
- 📈 **Created** revenue analysis by product, category, and customer
- 👥 **Analyzed** customer demographics and purchasing patterns

## 📁 Dataset Information

| Attribute | Description |
|-----------|-------------|
| **Table Name** | `sales_store` / `sales` |
| **Records** | 1000+ transactions |
| **Columns** | 15 |
| **Time Period** | Sales data with date & time stamps |
| **Data Quality** | Initial issues: duplicates, NULLs, inconsistent values |


### 📊 Table Schema

```sql
- transaction_id     (VARCHAR) - Unique transaction identifier
- customer_id        (VARCHAR) - Customer unique ID
- customer_name      (VARCHAR) - Customer full name
- customer_age       (INT)     - Customer age
- gender            (VARCHAR) - Customer gender
- product_id        (VARCHAR) - Product unique ID
- product_name      (VARCHAR) - Product name
- product_category  (VARCHAR) - Category (Electronics, Clothing, etc)
- quantity          (INT)     - Number of units purchased
- price             (INT)     - Unit price
- payment_mode      (VARCHAR) - Payment method
- purchase_date     (DATE)    - Transaction date
- time_of_purchase  (TIME)    - Transaction time
- status            (VARCHAR) - Order status (delivered/cancelled/returned)




