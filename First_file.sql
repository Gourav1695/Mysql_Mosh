-- SELECT name 
-- ,unit_price
-- ,(unit_price *1.1) AS new_price
-- FROM products;


-- select * 
-- from CusTomers
-- -- where points>3000; 
-- -- where state ='VA';
-- -- where state !='VA';
-- where birth_date> '1990-01-01'
-- -- following the formate yyyy-mm-dd


-- Get the orders placed this year
-- select * from orders
-- where order_date>='2018-01-01';
-- select *
-- from customers
-- where birth_date > '1990-01-01' or points > 1000
-- and state ='va';

-- select *
-- from customers
-- where birth_date > '1990-01-01' or
-- (points > 1000 and state ='va')

-- * / 
-- +-
-- AND has the higher precedence than
-- OR

-- select  * 
-- from customers
-- where not (birth_date > '1990-01-01' or points > 1000)

-- select *
-- from customers 
-- where birth_date <= '1990-01-01' and points <=1000;

-- Qn from the order_items table, get the items
-- for order #6
-- where the total price is greater than 30
 -- select * 
--  from order_items 
--  where  order_id =6 and   unit_price * quantity >30;
 
--  select * 
--  from customers
--  where state ='va' or state ='ga' or state ='fl';

-- select *
-- from customers
-- where state In ('va', 'fl', 'ga')

-- return products with 
 -- quantity in stock equal to 49, 38, 72
 
-- select * 
--  from products
--  where quantity_in_stock in (49,38, 72);

-- select * 
-- from customers
-- -- where points >= 1000 and points <= 3000 
-- where points between 1000 and 3000

-- return customers born 
-- between 1/1/1990 and 1/1/2000

-- select * 
-- from customers
-- where birth_date between '1990-01-01' and '2000-01-01'

-- select *
-- from customers
 -- where last_name LIKE 'brush%'
  -- where last_name LIKE 'b%' -- b at the beginning
  --  where last_name LIKE '%b%' -- b anywhere
   -- where last_name LIKE '%y' -- last name with y
   
   -- where last_name like '_____y' -- last name with y with 5 blank
   -- where last_name like 'b____y' 
    
   -- % any number of charcters
   -- _single character
   
   -- get the customers whose and
   -- address contain TRAIL or AVENUE 
   
--    select *
--    from customers
--    where address LIKE '%trail%' or
--    address LIKE '%avenue%'
   
   -- phone numbers end with 9
 --   select * 
--    from customers
--    -- where phone like '%9' 
--    where phone  NOT like '%9'

-- use of regexp -- means regular expression
-- select *
-- from customers
-- where last_name regexp 'field$' -- here $ means ending of the string 
-- where last_name regexp '^bru' -- here ^ means starting of the string
-- where last_name regexp 'field|mac|rose'-- use | to show multiple search pattarn
-- here last_name regexp '^field|mac|rose'-- start with these words
-- where last_name regexp 'field$|mac|rose'--

-- where last_name regexp '[gim]e'
-- last name with  ge or
-- ie or

-- me
-- where last_name regexp 'e[gim]'
-- where last_name regexp '[a-h]e'


-- note
-- ^ beginning 
-- $ end
-- | logical or
-- [abcd]
-- [a-f] -- for range


-- get the customers whose 
-- first names are ELKA or AMBUR
-- select *
-- from customers
-- where first_name regexp 'elka|ambur'
-- last names end with EY or ON

-- select * 
-- from customers
-- where last_name regexp 'ey$|on$' -- $ sign for indicating the ending of the string
-- last names start with MY or contains SE

-- select * 
-- from customers
-- where last_name regexp '^my|se' -- here ^ means starting with my and simple se to find out it contains the se

-- last names contain B followed by  R or U
-- select *
-- from customers
-- -- where last_name regexp 'b[ru]'
-- where last_name regexp 'br|bu'

-- select *
-- from customers
-- -- where phone is NOT NULL;
-- where phone is null 

-- get the orders that are not shipped 
-- select * from orders 
-- where shipped_date is null;
-- select *
-- from customers
-- order by first_name
-- order by first_name desc

-- select * 
-- from customers
-- order by state,last_name
 
--  select first_name , last_name 
--  from customers
--  -- order by state desc , first_name desc
--  order by birth_date -- this means we can use the order by with the coloumns which are not in the result table but this type of query may give error in other sql

-- select first_name , last_name, 10 as points
-- from customers
-- order by points , first_name 
-- order by 1,2 -- here 1 means first_name and 2 means last_name
-- should avoid the above way of order by

-- select *,quantity*unit_price as total_price
-- from order_items
-- where order_id =2 
-- order by total_price desc 

-- limit clause

-- select *
-- from customers 
-- -- limit 5 
-- limit 6,3 -- here 6 is no. that is left and after that the date will be shown ie from 7 to 9

-- get the top three loyal customers

-- select * 
-- from customers
-- order by points desc 
-- limit 3

-- always follows the order of
-- select
-- from
-- where
-- order by
-- limit

-- select * 
-- select order_id, o.customer_id,first_name, last_name
-- from orders o 
-- join customers c
--  -- on orders.customer_id = customers.customer_id;
--  on o.customer_id=c.customer_id

-- select order_id,oi.product_id,quantity,oi.unit_price
-- from order_items oi
-- join products p on oi.product_id = p.product_id

-- use sql_inventory; 

-- select * 
-- from sql_store.order_items oi -- here we are specifing the table name as it is not in the present  table

-- join products p
--  ON oi.product_id= p.product_id 

-- self join
-- use sql_hr;

-- SELECT 
--     e.employee_id, e.first_name, m.first_name AS manager
-- FROM
--     employees e
--         JOIN
--     employees m ON e.reports_to = m.employee_id

-- joining multiple table
-- select 
-- o.order_id,
-- o.order_date,
-- c.first_name,
-- c.last_name,
-- os.name as status
-- from orders o
-- join customers c
--  on o.customer_id= c.customer_id
-- join order_statuses os
--  on o.status = os.order_status_id
-- order by order_id

-- select 
-- p.date,
-- p.invoice_id,
-- p.amount,
-- c.name,
-- pm.name 
-- from payments p
-- join clients c
--   on p.client_id = c.client_id
-- join payment_methods pm
--  on p.payment_method= pm.payment_method_id

-- composite join
select *
from order_items oi
join order_item_notes oin
  on oi.order_id= oin.order_id
  and oi.product_id=oin.product_id





