-- SELECT *
-- FROM order_items oi
-- JOIN order_item_notes oin 
-- 	 ON oi.order_id= oin.order_id 
--      and oi.product_id =oin.product_id;

-- select *
-- from orders o
-- join customers c
-- on o.customer_id=c.customer_id

-- Implicit Join Syntax
 -- both query gives the same results
-- select * 
-- from orders o, customers c
-- where o.customer_id=c.customer_id


-- select 
-- c.customer_id,
-- c.first_name ,
-- o.order_id
-- from customers c
-- join orders o
-- on c.customer_id=o.customer_id
-- order by c.customer_id


-- select 
-- c.customer_id,
-- c.first_name ,
-- o.order_id
-- from customers c
--  left join orders o -- all the records of 1st table returns without considering the condition is true or not
-- on c.customer_id=o.customer_id
-- order by c.customer_id

-- select 
-- c.customer_id,
-- c.first_name ,
-- o.order_id
-- from customers c
--  right join orders o -- all the records of 2nd table returns without considering the condition is true or not
-- on c.customer_id=o.customer_id
-- order by c.customer_id



-- select 
-- p.product_id,
-- p.name ,
-- oi.quantity
-- from products p
-- left join order_items oi -- all the records of 2nd table returns without considering the condition is true or not
-- on p.product_id=oi.product_id
-- order by p.product_id

-- outer join between multiple tables

-- select 
-- c.customer_id,
-- c.first_name,
-- o.order_id
-- from customers c
-- left join orders o -- outer left join
-- on c.customer_id=o.customer_id
-- join shippers sh -- inner join
-- on o.shipper_id = sh.shipper_id
-- order by c.customer_id

-- select 
-- c.customer_id,
-- c.first_name,
-- o.order_id,
-- sh.name as shipper
-- from customers c
-- left join orders o -- outer left join
-- on c.customer_id=o.customer_id
--   join shippers sh -- inner join
-- on o.shipper_id = sh.shipper_id
-- order by c.customer_id

-- exersize
-- select o.order_id,o.order_date,c.first_name,s.name as shipper,os.name as status
-- from orders o
--  join customers c
-- on o.customer_id=c.customer_id
-- left join shippers s
-- on o.shipper_id=s.shipper_id
--  join order_statuses os
-- on o.status=os.order_status_id
--   

-- use sql_hr;

-- select 
-- e.employee_id,
-- e.first_name,
-- m.first_name as manager
-- from employees e
-- left join employees m
-- on e.reports_to = m.employee_id



-- using clause
-- select 
-- o.order_id,
-- c.first_name,
-- sh.name as shipper
-- from orders o
-- join customers c
-- using (customer_id)
-- left join shippers sh
-- using (shipper_id)

-- select *
-- from order_items oi
-- join order_item_notes oin 
-- on oi.order_id= oin.order_Id and
-- oi.product_id=oin.product_id

-- using(order_id, product_id)

-- select 
-- p.date,
-- c.name as client,
-- p.amount,
-- pm.name 
-- from payments p
-- join clients c
-- using(client_id)
-- left join payment_methods pm
-- on pm.payment_method_id = p.payment_method

-- natural join
-- select 
-- o.order_id,
-- c.first_name
-- from orders o
-- natural join customers c 

-- cross join 
-- select 
-- c.first_name as customer,
-- p.name as product 
-- from customers c
-- cross join products p
-- order by c.first_name

-- select s.name as shipper, p.name as products
-- -- explici methode
-- from shippers s cross join products p
-- order by s.name
 -- implicit methode 
-- from shippers s, products p

-- select 
-- order_id, 
-- order_date,
-- 'Active' as status 
-- from orders
-- where order_date>='2019-01-01'
-- union

-- select first_name
-- from customers
-- union 
-- select name
-- from shippers

-- select name
-- from shippers
-- union
-- select first_name
-- from customers

-- select order_id,
-- order_date,
-- 'Archived' as status
-- from orders 
-- where order_date<'2019-01-01'

-- select 
-- customer_id
-- ,first_name,
-- points,
-- 'Bronze' as type 
-- from customers c
-- where points<2000

-- union
-- select 
-- customer_id
-- ,first_name,
-- points,
-- 'Silver' as type 
-- from customers c
-- where points between 2000 and 3000

-- union
-- select 
-- customer_id
-- ,first_name,
-- points,
-- 'Gold' as type 
-- from customers c
-- where points>3000
-- order by first_name;

-- insert into products values(default, 'gouravyo',5,1.3),
-- (default, 'Manish',4,3.3),
-- (default, 'rohan',8,1.7)

-- insert into orders(customer_id, order_date, status)
-- values (1, '2019-01-02',1);

-- insert into order_items
-- values
-- (LAST_INSERT_ID(),1,1, 2.95),
-- (LAST_INSERT_ID(),2,1,3.95),
-- (LAST_INSERT_ID(),3,1,4.78)


-- create table orders_archived as
-- select * from orders
-- insert into orders_archived 
-- select *
-- from orders
-- where order_date<'2019-01-01'
-- truncate table orders_archived;
-- use sql_invoicing;
-- create table invoices_archived as
-- select 
-- i.invoice_id,
-- i.number,
-- c.name as client ,
-- i.invoice_total,
-- i.payment_total,
-- i.payment_date,
-- i.due_date
-- from invoices i
-- join clients c
-- using (client_id)
-- where payment_total>0;
-- update invoices
-- set payment_total=10, payment_date='1990-03-02'
-- where invoice_id =1
-- update invoices
-- set 
-- payment_total = invoice_total*0.5,
-- payment_date =due_date
-- -- where invoice_id =3;
-- where client_id in (3,4)


-- write a sql statement to 
-- give any customers born before 1990
-- 50 extra points

-- use sql_store;

-- update customers 
-- set points= points+50
-- where birth_date<'1990=01-01';
-- update invoices
-- set 
-- payment_total = invoice_total*0.5,
-- payment_date= due_date
-- where client_id in (
-- select client_id
-- from clients
-- where state in ('CA','NY'))

-- UPDATE orders
-- set comments='Gold Customers'
-- where customer_id in (
-- select customer_id
-- from customers
-- where points>3000)

delete from invoices
where client_id=(
select client_id
from clients
where name='Myworks')
