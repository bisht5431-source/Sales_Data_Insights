Drop Table If Exists sales_store;
CREATE TABLE sales_store (
    transaction_id VARCHAR(20),
    customer_id VARCHAR(20),
    customer_name VARCHAR(100),
    customer_age INT,
    gender VARCHAR(10),
    product_id VARCHAR(20),
    product_name VARCHAR(100),
    product_category VARCHAR(50),
    quantity INT,
    price INT,
    payment_mode VARCHAR(20),
    purchase_date DATE,
    time_of_purchase TIME,
    status VARCHAR(20)
);

Select * From sales_store;

Select * into sales from sales_store;

Select * From sales_store
Select * From sales

---To check for duplicate

Select transaction_id, count(*)
From Sales
Group By transaction_id
Having Count(transaction_id) >1

With CTE As(
Select *,
	Row_number() Over (Partition By transaction_id Order By transaction_id) As Row_Num
From sales
)
Select * From CTE
Where transaction_id in ('TXN240646', 'TXN342128', 'TXN855235', 'TXN981773')


WITH cte AS (
    SELECT ctid,
           ROW_NUMBER() OVER (
               PARTITION BY transaction_id
               ORDER BY transaction_id
           ) AS rn
    FROM sales
)
DELETE FROM sales
WHERE ctid IN (
    SELECT ctid
    FROM cte
    WHERE rn > 1
);


Select Column_Name, Data_type
from information_schema.columns
where Table_name='sales';

SELECT *
FROM sales
WHERE transaction_id is Null
    OR customer_id is Null
    OR customer_name is NUll
    OR customer_age is Null
    OR gender is Null
    OR product_id is Null
    OR product_name is Null
    OR product_category is Null
    Or quantity is Null
    Or price is Null
    Or payment_mode is Null
    Or purchase_date is Null
    Or time_of_purchase is Null
    Or status is Null

Delete From sales
Where transaction_id is Null;

Select * From sales
Where customer_name = 'Ehsaan Ram';

---CUST9494

Update sales
Set customer_id='CUST9494'
Where transaction_id = 'TXN977900';

---CUST1401
Select * From sales
Where customer_name = 'Damini Raju';

Update sales
Set customer_id = 'CUST1401'
Where transaction_id = 'TXN985663';

Select * From sales
Where customer_id = 'CUST1003';

Update sales
Set customer_name = 'Mahika Saini'
Where transaction_id = 'TXN432798';

Update sales
Set customer_age = 35, gender = 'Male'
Where transaction_id = 'TXN432798';

Select Distinct gender from sales;

Update sales 
Set gender = 'Male'
Where gender = 'M';

Update sales
Set gender = 'Female'
Where gender = 'F';

Select * From sales;

Select Distinct payment_mode From sales;

Update Sales
Set payment_mode = 'Credit Card'
Where payment_mode = 'CC';


-----Data Analysis-----

--What are the top 5 most selling products by quantity?

Select product_name, Sum(quantity) As Total_quantity
From sales
Where status = 'delivered'
Group By product_name
Order By Total_quantity Desc
Limit 5;


--Which products are most frequently cancelled?

Select product_name, Count(status) As Total_Count
From sales
Where status = 'cancelled'
Group By product_name
Order By Total_Count Desc
Limit 1;


--What time of the day has the highest number of purchases?

SELECT 
    CASE
        WHEN EXTRACT(HOUR FROM time_of_purchase) BETWEEN 5 AND 11 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM time_of_purchase) BETWEEN 12 AND 16 THEN 'Afternoon'
        WHEN EXTRACT(HOUR FROM time_of_purchase) BETWEEN 17 AND 20 THEN 'Evening'
        ELSE 'Night'
    END AS time_category,
    COUNT(*) AS total_orders
FROM sales
GROUP BY time_category
ORDER BY time_category Desc;


--Who are the top 5 highest spending customers?
--With use of rupees symbol
SELECT 
    customer_name,
    '₹ ' || TO_CHAR(SUM(price * quantity), 'FM999,999,999') AS total_price
FROM sales
GROUP BY customer_name
ORDER BY SUM(price * quantity) DESC
LIMIT 5;

--Which product categories generate the highest revenue?

Select product_category, 
		  '₹ ' || TO_CHAR(SUM(price * quantity), 'FM999,999,999') AS Revenue
From sales
Group By product_category
Order By SUM(price * quantity) Desc;


--What is the return/cancellation rate per product category?
Select product_category,
		Round(Count(Case When status='cancelled' Then 1 End)*100.0/Count(*),2) As Cancelled_Percent 
From sales
Group By product_category
Order By cancelled_percent Desc;

--Return
Select product_category,
		Round(Count(Case When status='returned' Then 1 End)*100.0/Count(*),2) As Return_Percent 
From sales
Group By product_category
Order By Return_percent Desc;


--What is the most preferred payment mode?
Select Distinct payment_mode, Count(payment_mode) As Total_Count
From sales
Group By payment_mode
Order By Total_Count Desc
Limit 1;

--How does age group affect purchasing behaviour?

Select 
	Case
		When customer_age Between 18 and 25 Then '18-25'
		When customer_age Between 26 and 35 Then '26-35'
		When customer_age Between 36 and 50 Then '36-50'
		Else '51+'
	End as Age_category,
	Sum(price*quantity) As Total_purchase
From sales
Group By Case
		When customer_age Between 18 and 25 Then '18-25'
		When customer_age Between 26 and 35 Then '26-35'
		When customer_age Between 36 and 50 Then '36-50'
		Else '51+'
	End
Order By total_purchase Desc;


--What's the monthly sales trend?

SELECT 
    EXTRACT(MONTH FROM purchase_date) AS month,
    SUM(price * quantity) AS total_sales,
    SUM(quantity) AS total_quantity
FROM sales
GROUP BY month
ORDER BY month;

--Are certain genders buying more specific product categories?

Select gender, product_category, 
		Count(product_category) As total_purchase
From sales
Group By gender, product_category
Order By gender
