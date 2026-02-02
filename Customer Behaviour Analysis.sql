GRANT ALL PRIVILEGES ON customer_behaviour.* 
TO 'alvith'@'localhost';

FLUSH PRIVILEGES;
SELECT USER(), CURRENT_USER();
create database customer_behaviour;
use customer_behaviour;
#Total Customers
SELECT COUNT(*) AS total_customers
FROM customer;
#Average Purchase Amount (USD)
SELECT ROUND(AVG(`Purchase Amount (USD)`), 2) AS avg_purchase_amount
FROM customer;
#Total Revenue
SELECT ROUND(SUM(`Purchase Amount (USD)`), 2) AS total_revenue
FROM customer;
#Customers by Gender
SELECT Gender,COUNT(*) AS customer_count
FROM customer
GROUP BY Gender;
#Revenue by Gender
SELECT Gender,ROUND(SUM(`Purchase Amount (USD)`), 2) AS total_revenue
FROM customer
GROUP BY Gender;
#Customers by Subscription Status
SELECT `Subscription Status`,COUNT(*) AS customer_count
FROM customer
GROUP BY `Subscription Status`;
#Revenue by Subscription Status
select 'Subscription Status',Round(sum('Purchase Amount (USD)'),2) as total_revenue
from customer
group by 'Subscription Status';
#Sales by Product Category
select Category, count(*) as total_orders
from customer 
group by Category
order by total_orders Desc;
#Revenue by Product Category
select category, Round(sum('Purchase Amount (USD)'),2) as total_revenue 
from customer
group by category
order by total_revenue desc;
#Most Purchased Items
select 'Item Purchased',count(*) as purchased_amount
from customer
group by 'Item Purchased'
order by purchased_amount desc 
limit 10;
#Age Group Analysis
select 
case 
when age<25 then 'Young Adult'
when age between 25 and 40 then 'Adult'
when age between 41 and 60 then 'Middle Aged'
else 'senior'
end as age_group,
count(*) as customer_count
from customer
group by age_group;
#Impact of Discounts
SELECT `Discount Applied`,COUNT(*) AS total_customers,
ROUND(AVG(`Purchase Amount (USD)`), 2) AS avg_purchase
FROM customer
GROUP BY `Discount Applied`;
#Promo Code Usage Analysis
SELECT `Promo Code Used`,COUNT(*) AS usage_count
FROM customer
GROUP BY `Promo Code Used`;
#Preferred Shipping Type
SELECT`Shipping Type`,COUNT(*) AS usage_count
FROM customer
GROUP BY `Shipping Type`
ORDER BY usage_count DESC;
#Payment Method Distribution
select 'Payment Method', count(*) as total_transactions 
from customer
group by 'Payment Method'
order by total_transactions desc;
#Customer Loyalty Analysis
SELECT`Frequency of Purchases`,
ROUND(AVG(`Purchase Amount (USD)`), 2) AS avg_spend,
ROUND(AVG(`Previous Purchases`), 1) AS avg_previous_purchases
FROM customer
GROUP BY `Frequency of Purchases`
ORDER BY avg_spend DESC;
#High-Value Customers
SELECT`Customer ID`,
ROUND(SUM(`Purchase Amount (USD)`), 2) AS total_spent
FROM customer
GROUP BY `Customer ID`
ORDER BY total_spent DESC
LIMIT 10;
