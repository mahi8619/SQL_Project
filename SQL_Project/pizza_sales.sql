create database pizzasales;

use pizzasales;

select * From pizza_sales;
-- 1. Total Revenue:
select sum(total_price) as Total_Revenue From pizza_sales;

-- 2. Average Order Value
Select (sum(total_price ) / count(distinct order_id)) as Avg_order_value From pizza_sales;

-- 3. Total Pizzas Sold
Select sum(quantity) As Total_Pizza_Sold From pizza_sales;

-- 4. Total Orders
Select count(distinct order_id) As Total_Orders From pizza_sales;

-- 5. Average Pizzas Per Order
Select sum(quantity)/count(distinct order_id) From pizza_sales;

-- B. Daily Trend for Total Orders
Select dayname(str_to_date(order_date,'%d-%m-%y')) As Order_Day, count(distinct order_id)
 From pizza_sales group by dayname(str_to_date(order_date,'%d-%m-%y')) order by order_day desc;
 
 -- C. Monthly Trend for Orders
 Select monthname(str_to_date(order_date, '%d-%m-%y')) As Month_Name, count(distinct order_id)
 From pizza_sales group by monthname(str_to_date(order_date, '%d-%m-%y')) order by Month_Name desc;
 
 -- D. % of Sales by Pizza Category
 Select pizza_category,sum(total_price) as total_revenue ,(sum(total_price) * 100 )/  (select sum(total_price) from pizza_sales) as  
 PCT From pizza_sales group by pizza_category;
 
 -- E. % of Sales by Pizza Size
 Select pizza_size,sum(total_price) as total_revenue ,(sum(total_price) * 100 )/  (select sum(total_price) from pizza_sales) as  
 PCT From pizza_sales group by pizza_size;
 
 -- F. Total Pizzas Sold by Pizza Category
 
 Select pizza_category, sum(quantity) as total_quantity_sold from pizza_sales group by pizza_category;
 
 -- G. Top 5 Pizzas by Revenue
 Select pizza_name, sum(total_price) as total_revenue from pizza_sales group by pizza_name
 order by total_revenue desc limit 5;
 
 -- H. Bottom 5 Pizzas by Revenue
 Select pizza_name, sum(total_price) as total_revenue from pizza_sales 
 group by pizza_name order by total_revenue asc limit 5;
 
 -- I. Top 5 Pizzas by Quantity
select pizza_name, sum(quantity) as total_pizza_sold from pizza_sales group by pizza_name order by total_pizza_sold
desc limit 5;

-- J. Bottom 5 Pizzas by Quantity 
Select pizza_name, sum(quantity) as total_pizza_sold from pizza_sales group by pizza_name order by total_pizza_sold
asc limit 5;

-- K. Top 5 Pizzas by Total Orders
Select pizza_name, count(distinct order_id) as total_orders from pizza_sales group by pizza_name order by 
total_orders desc limit 5;

-- L. Borrom 5 Pizzas by Total Orders
Select pizza_name, count(distinct order_id) as total_orders from pizza_sales group by pizza_name order by 
total_orders asc limit 5;
 


