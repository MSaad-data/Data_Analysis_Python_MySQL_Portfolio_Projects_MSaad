create schema assignment_1;
use assignment_1;
create table assignment_1.employees_assignment (

employee_id int primary key,
job_id char(4),
first_name varchar(20),
last_name varchar(20),
age int default 0,
phone_number varchar(20),
salary int,
hire_date text

);

insert into assignment_1.employees_assignment
			(employee_id, job_id, first_name, last_name, age, phone_number, salary, hire_date)
values 
(1, "E101", 'John', 'Doe', 28, '555-1234', 45000, '1/15/2020'),
(2, "E102", 'Jane', 'Smith', 34, '555-5678', 52000, '3/22/2019'),
(3, "E103", 'Michael', 'Johnson', 45, '555-8765', 61000, '7/30/2018'),
(4, "E101", 'Emily', 'Davis', 26, '555-4321', 75000, '5/11/2021'),
(5, "E105", 'David', 'Brown', 50, '555-1357', 35000, '2/14/2017'),
(6, "E104", 'Sarah', 'Williams', 31, '555-2468', 85000, '4/4/2022'),
(7, "E107", 'Daniel', 'Jones', 29, '555-7890', 43000, '8/20/2020'),
(8, "E108", 'Sophia', 'Garcia', 38, '555-3141', 80000, '2/17/2019'),
(9, "E106", 'Matthew', 'Martinez', 43, '555-2718', 72000, '9/15/2019'),
(10, "E102", 'Olivia', 'Hernandez', 24, '555-1589', 59000, '11/1/2021'),
(11, "E107", 'James', 'Lopez', 37, '555-4567', 63000, '12/5/2018'),
(12, "E105", 'James', 'Wilson', 29, '555-2710', 90000, '10/10/2017');

select * from employees_assignment;

alter table assignment_1.employees_assignment
add column bonus_pact float after salary;

alter table assignment_1.employees_assignment
drop column bonus_pact;

alter table assignment_1.employees_assignment
add column bonus_pct float not null default 0 after salary;
 
alter table assignment_1.employees_assignment
add column total_bonus float generated always as (bonus_pct * salary) stored after bonus_pct;

-- MODIFICATIONS (3 + 2 + 3 + 2)

alter table assignment_1.employees_assignment
modify column employee_id int auto_increment;

alter table assignment_1.employees_assignment
auto_increment = 13;

alter table assignment_1.employees_assignment
modify column bonus_pct float not null default 0.5;

insert into assignment_1.employees_assignment 
                 (job_id, first_name, last_name, age, phone_number, salary, hire_date)
values	
("E101", 'Bill', 'Rogers', 36, '555-3232', 53000, '11/25/2020'),
("E108", 'Micheal', 'Williams',22, '555-4444', 12000, '12/1/2019'),
("E105", 'Dave', 'Johnson', 60, '555-9011', 89000, '7/21/2018');                 

select * from employees_assignment;

-- -----------------------------------------------------------------------------------
-- UPDATING DATA (5)
-- -----------------------------------------------------------------------------------
set sql_safe_updates = 0;

update assignment_1.employees_assignment
set bonus_pct = 0.5;

-- -----------------------------------------------------------------------------------
-- QUERIES (3 + 2 + 5)
-- -----------------------------------------------------------------------------------

select employee_id, job_id, concat(first_name, " ", last_name) as full_name, age
from assignment_1.employees_assignment
where salary < 50000
order by age desc;

select employee_id, job_id, concat(first_name, " ", last_name) as full_name, age
from assignment_1.employees_assignment
where salary < 50000
order by age desc
limit 1;

select first_name, last_name, phone_number
from assignment_1.employees_assignment
where age between 25 and 35
order by salary asc
limit 1;


