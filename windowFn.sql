show databases;
create database window_fn;
use window_fn;
select database();
CREATE TABLE employees (
    emp_no INT PRIMARY KEY AUTO_INCREMENT,
    department VARCHAR(20),
    salary INT
);
INSERT INTO employees (department, salary) VALUES
('engineering', 80000),
('engineering', 69000),
('engineering', 70000),
('engineering', 103000),
('engineering', 67000),
('engineering', 89000),
('engineering', 91000),
('sales', 59000),
('sales', 70000),
('sales', 159000),
('sales', 72000),
('sales', 60000),
('sales', 61000),
('sales', 61000),
('customer service', 38000),
('customer service', 45000),
('customer service', 61000),
('customer service', 40000),
('customer service', 31000),
('customer service', 56000),
('customer service', 55000);

select * from employees;

select emp_no,department,salary, min(salary) over(),max(salary) over()
from employees;

select emp_no,department,salary,
avg(salary) over(partition by department),
count(*) over(partition by department),
avg(salary) over() as company,
sum(salary) over(partition by department order by salary desc) as total_payroll,
sum(salary) over(partition by department) as total_payroll,
rank() over(order by salary desc) as salary_all_rank,
row_number() over(order by salary desc) as 'row_number',
ntile(4) over(order by salary desc) as 'salry_quartile' ,
dense_rank() over(order by salary desc) as 'dense all rank',
rank() over(order by salary desc) as 'all rank'
from employees;

select 
emp_no,
department,
salary,
first_value(emp_no) over( partition by department order by salary desc),
first_value(emp_no) over(order by salary desc)
from employees;

select emp_no,department,
salary,
salary - lag(salary) over(order by salary desc) as dept_salary_diff,
salary - lag(salary) over(partition by department order by salary desc) as dept_salary_diff
from employees;