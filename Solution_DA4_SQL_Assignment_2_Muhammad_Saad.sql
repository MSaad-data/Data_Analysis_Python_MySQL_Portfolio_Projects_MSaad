-- ASSIGNMENT 2
-- Total marks = 35
-- Please use your practice and DA4_database schemas for this assignment. The tables you will need are mentioned in the exercises
-- Please write your code under each question and submit this .sql file. Don't submit anything else.

-- -----------------------------------------------------------------------------------
-- DDL/DML [10 marks]
-- -----------------------------------------------------------------------------------

-- the str_to_date() function takes 2 inputs: an input date and a format string that lets it know what the format of the input date is.
-- using that format string, it extracts the day, month and year from the input date and outputs the date in the correct format (YYYY-MM-DD)
-- https://www.w3schools.com/sql/func_mysql_str_to_date.asp
-- Please do not confuse the format string as format for output date. It is to let the function know the format of your INPUT date. 


-- examples:
select str_to_date("24th Mar 2024", "%D %b %Y");
select str_to_date("24th/Mar/2024", "%D/%b/%Y");


-- [5 + 1 marks]
-- using str_to_date(), correct the dates in the hire_date column in your employees table in your practice schema
select * from employees;

set sql_safe_updates =0;  

update employees
set hire_date = str_to_date(hire_date, '%m/%d/%Y');

-- after correcting the dates, change the datatype of hire_date from text to date

alter table employees
modify hire_date date;

set sql_safe_updates =1;  


-- [4 marks]
-- Write an update statement to remove the " st" from the street column in your customers table in DA4_database schema
-- i.e. instead of Main St, Elm St, the column should show Main, Elm etc
-- left, right, mid, length functions all exist in mysql. you can use those.
-- substring_index() is a helpful function too

select * from customers;

update customers
set street = substring_index(street, " ", 1); 


-- -----------------------------------------------------------------------------------
-- Queries [25 marks]
-- (use your customers, orders and items tables in DA4_database schema)
-- -----------------------------------------------------------------------------------

-- [5 marks]
-- For only between the dates of "2022-05-15" and "2022-08-15", find out customer_ids and total no of orders for customers who have placed more than 2 orders 
-- return results sorted by count in descending order

select * from orders;

select customer_id, count(*) as total_orders
from orders
where order_date between "2022-05-15" and "2022-08-15"
group by customer_id
having total_orders > 2
order by total_orders desc;

-- [5 + 2 + 3 marks]
-- You wish to find out how many orders the company received in each season 

-- For each order invoice, find out if the order is a winter, spring, summer or fall order
-- if the order is placed in the months of Nov, Dec or Jan - winter order
-- if the order is placed in the months of Feb, Mar, or Apr - spring order
-- if the order is placed in the months of May, Jun or Jul - summer order
-- if the order is placed in the months of Aug, Sept or Oct - fall order

-- Show results sorted by order_date

select order_id, order_date,
case when month(order_date) in (11, 12, 1) then "winter order"
     when month(order_date) in (2, 3, 4) then "spring order" 
     when month(order_date) in (5, 6, 7) then "summer order"
     else "fall order"
     end as season
from orders
order by order_date;     


-- Show only the summer orders

select order_id, order_date
from orders
where month(order_date) in (5, 6, 7)
order by order_date;

-- Show how many orders from each season

select count(*) as total_orders,
case when month(order_date) in (11, 12, 1) then "winter order"
     when month(order_date) in (2, 3, 4) then "spring order" 
     when month(order_date) in (5, 6, 7) then "summer order"
     else "fall order"
     end as season
from orders
group by season
order by total_orders;  



-- [5 marks]
-- Use a join to find out how many orders per city

alter table customers
add primary key (customer_id); 

select customers.city, count(orders.order_id) as total_orders
from customers
join orders on customers.customer_id = orders.customer_id
group by customers.city
order by total_orders desc; 


-- [5 marks]
-- Use a join to find out item_id, item_name and item_type for all items that have not been ordered. 

alter table items
add primary key (item_id);

select items.item_id, items.item_name, items.item_type
from items 
left join orders on items.item_id = orders.item_id
where orders.item_id is null; 


