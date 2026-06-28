create schema BT04;
use BT04;

create table customers (
customer_id int primary key,
customer_name varchar (255) not null
);

create table orders (
order_id int primary key,
order_date varchar (10) not null,
customer_id int,
foreign key (customer_id) references customers(customer_id) 
);

create table order_items (
order_id int,
customer_id int,
product_name varchar (255),
quantity int default 0,
price decimal (10) default 0,
primary key (order_id, customer_id),
foreign key (order_id) references orders(order_id),
foreign key (customer_id) references customers(customer_id)
);

insert into customers
values 
(1, 'Abby'),
(2, 'Bobby'),
(3, 'Cathy'),
(4, 'Danny'),
(5, 'Elly');

insert into orders
values 
(1, '10/03', 3),
(2, '12/03', 5),
(3, '18/04', 1),
(4, '20/03', 4),
(5, '04/03', 5),
(6, '16/05', 2),
(7, '30/03', 3);

insert into order_items
values
(1, 1, 'monitor', 2, 5000000),
(2, 2, 'mouse', 3, 700000),
(3, 3, 'monitor', 1, 15000000),
(4, 4, 'keyboard', 2, 5000000),
(5, 5, 'hddr4', 2, 1000000),
(6, 1, 'cab', 4, 500000),
(7, 2, 'hub', 2, 500000);

-- Hiển thị: mã đơn hàng, ngày đặt hàng, tên khách hàng
select order_id, order_date, customer_name
from orders
left join customers
on orders.customer_id = customers.customer_id;

-- Hiển thị danh sách sản phẩm trong mỗi đơn hàng
select * from order_items
order by order_id;

-- Tính tổng tiền của mỗi đơn hàng
select order_id, group_concat(product_name) as all_name, sum(quantity * price) as total
from order_items
group by order_id;

-- Hiển thị các đơn hàng có tổng tiền lớn hơn 10.000.000
select order_id, group_concat(product_name) as all_name, sum(quantity * price) as total
from order_items
group by order_id
having sum(quantity * price) > 10000000;