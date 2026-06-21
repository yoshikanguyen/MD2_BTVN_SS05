create schema BT01;
use BT01;

create table students (
student_id int primary key,
full_name varchar (255) not null,
birth_year int,
gender varchar (10),
score decimal (4,2)
);

insert into students
values (1, 'Nguyen Van A', 2000, 'male', 7.06);
insert into students
values (2, 'Hoang Thi B', 1992, 'female', 8.51);
insert into students
values (3, 'Le Hong Giang', 2004, 'male', 6.7);
insert into students
values (4, 'Ho Kim Hoa', 1998, 'female', 7.31);
insert into students
values (5, 'Nguyen Van Muoi', 2001, 'male', 5.85);

-- a/ Hiển thị:
-- mã sinh viên
-- họ tên (viết hoa toàn bộ) - Ban đầu chưa in hoa hết
select student_id, upper(full_name) as full_name_upperCase, full_name
from students;

-- b/ Hiển thị:
-- họ tên
-- số tuổi của sinh viên (dựa vào năm hiện tại)
select full_name, year(curdate()) - birth_year as age
from students;

-- c/ Hiển thị:
-- điểm trung bình được làm tròn 1 chữ số thập phân
select score, round(score,1) as score_rounded from students;

-- d/ Hiển thị:
-- tổng số sinh viên
-- điểm cao nhất
-- điểm thấp nhất
select 
count(student_id)as stu_total,
max(score) as score_max,
min(score) as score_min

from students;