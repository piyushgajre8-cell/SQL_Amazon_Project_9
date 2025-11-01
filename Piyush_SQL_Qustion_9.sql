create database retail_orders;
use retail_orders;
create table orders(
order_id int primary key,
customer_id varchar(100),
order_date date,
order_amount decimal(10,2)
);
INSERT INTO orders (order_id, customer_id, order_date, order_amount) VALUES
(1,'101','2025-02-01',250),
(2,'102','2025-02-05',400),
(3,'101','2025-02-10',350),
(4,'103','2025-03-06',500),
(5,'104','2024-04-09',100);
select 
customer_id,
order_date,
order_amount,
sum(order_amount) over(
partition by customer_id
order by order_date
) as cumulative_orders
from orders;