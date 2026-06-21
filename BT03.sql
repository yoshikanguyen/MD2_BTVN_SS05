create schema BT03;
use BT03;

create table products (
product_id int primary key,
product_name varchar (255) not null,
category varchar (25) not null,
price decimal (10) default 0
);

insert into products
values (1, 'laptop01', 'lap', 15000000),
(2, 'laptop02', 'lap', 25000000),
(3, 'laptop03', 'lap', 35000000),
(4, 'tivi01', 'tv', 10000000),
(5, 'fridge01', 'fri', 35000000),
(6, 'fridge02', 'fri', 10000000),
(7, 'smartphone01', 'smp', 45000000),
(8, 'smartphone02', 'smp', 5000000),
(9, 'tivi02', 'tv', 15000000),
(10, 'laptop04', 'lap', 10000000);

-- a/ Hiển thị các sản phẩm có giá cao hơn giá trung bình của tất cả sản phẩm

-- check giá trung bình:
select avg(price) as price_avg from products;

-- Hiển thị sp:
select * from products
where price > (select avg(price) from products);

-- b/ Hiển thị sản phẩm có giá cao nhất trong từng loại sản phẩm
select p1.* from products p1
inner join (
select category, max(price) as price_max
from products
group by category
) p2
on p1.category = p2.category and p1.price = p2.price_max;

-- c/ Hiển thị các sản phẩm thuộc loại có ít nhất một sản phẩm giá trên 20.000.000
select p1.* from products p1
inner join (
select price from products
group by price
) p2
on p1.price = p2.price and p1.price > 20000000;