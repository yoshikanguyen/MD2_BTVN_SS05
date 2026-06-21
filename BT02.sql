create schema BT02;
use BT02;

create table employees (
emp_id int primary key,
full_name varchar (255) not null,
department varchar (10) not null,
salary decimal (10,0) not null
);

insert into employees
values (1, 'Nguyen Van An', 'VP1', 30000000);
insert into employees
values (2, 'Hoang Thi Bich', 'VP1', 8000000);
insert into employees
values (3, 'Le Hong Giang', 'VP2', 9500000);
insert into employees
values (4, 'Ho Kim Hoa', 'VP3', 9300000);
insert into employees
values (5, 'Nguyen Van Muoi', 'VP1', 10500000);
insert into employees
values (6, 'Ho Thanh Tung', 'VP2', 15000000);
insert into employees
values (7, 'Vu Thi Hong', 'VP4', 9000000);
insert into employees
values (8, 'Le Huy', 'VP4', 7500000);
insert into employees
values (9, 'Tran Trung', 'VP4', 11000000);
insert into employees
values (10, 'Huynh Ngoc', 'VP4', 11500000);

-- a/ Thống kê:
-- mỗi phòng ban có bao nhiêu nhân viên
select count(emp_id), department
from employees
group by department;

-- b/ Tính:
-- mức lương trung bình của từng phòng ban
select avg(salary), department
from employees
group by department;

-- c/ Chỉ hiển thị:
-- các phòng ban có trên 3 nhân viên
select count(emp_id) as emp_total, department
from employees
group by department
having emp_total >3;

-- d/ Chỉ hiển thị:
-- các phòng ban có lương trung bình lớn hơn 12.000.000
select avg(salary) as salary_avg, department
from employees
group by department
having salary_avg > 12000000;