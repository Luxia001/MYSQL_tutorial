show databases;
use book_shop;
select database();
show tables;
-- create table
create table customers(
    id int primary key auto_increment,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50)
);
create table orders(
    id int auto_increment primary key,
    order_date date,
    amount decimal(8,2),
    customer_id int,
    FOREIGN KEY (customer_id) REFERENCES customers(id) on delete cascade
);
desc Orders;

insert into customers (first_name,last_name,email)
values('Boy','George','george@gmail.com'),
('Georage','Michael','gm@gmail.com'),
('David','Bowie','david@gmail.com'),
('Blue','Steele','blue@gmail.com'),
('Bette','Davis','bette@aol.com');
insert into orders (order_date,amount,customer_id)
values('2016-02-10',99.99,1),
('2017-11-11',35.50,1),
('2014-12-12',800.67,2),
('2015-01-03',12.50,2),
('1999-04-11',450.25,5);

select id from customers where last_name='George';
select * from orders where id=1;
select * from orders where id=(select id from customers where last_name='George');

select * from customers,orders;
select first_name,last_name,order_date,amount from customers
JOIN orders on customers.id = orders.customer_id;
select first_name,last_name,order_date,amount from orders
inner JOIN customers on customers.id = orders.customer_id;
select first_name,last_name,sum(amount) as total from customers 
JOIN orders on orders.customer_id = customers.id
group by first_name,last_name;
-- left join
select first_name,last_name,ifnull(sum(amount),0) from customers
left JOIN orders on orders.customer_id = customers.id
group by first_name,last_name;
desc orders;
insert into orders(order_date,amount)
values (curdate(),100.00);
select first_name,last_name,sum(amount) from customers
right JOIN orders on orders.customer_id = customers.id
group by first_name,last_name;

-- delete FOREIGN key
delete from customers where last_name='George';
select * from customers;
select * from orders;

-- exercise
create table stdents (
    id int auto_increment primary key,
    first_name varchar(100)
);
create table papers(
    title varchar(100),
    grade int,
    students_id int,
    FOREIGN KEY (students_id) REFERENCES stdents(id) on delete cascade
);
insert into stdents(first_name)
values 
('Caleb'),
('Samantha'),
('Raj'),
('Carlos'),
('Lisa');
insert into papers(students_id,title,grade) values 
(1,'My First Book Report',60),
(1,'My Second Book Report',75),
(2,'Russian Lit Through The Ages',94),
(2,'De MOntaigne and The Art of The Easy',98),
(4,'Borges and Magical Realism',89);

select * from stdents;
select * from papers;
-- 1
select first_name,title,grade from papers
inner join stdents on stdents.id = papers.students_id 
order by grade desc ;
-- 2
select first_name,ifnull(title,'missing'),ifnull(grade,0) from papers
right join stdents on stdents.id = papers.students_id  ;
-- 3
select first_name,ifnull(avg(grade),0)as'avg' from papers
right join stdents on stdents.id = papers.students_id  
group by first_name order by avg desc ;
-- 4
select first_name,ifnull(avg(grade),0)as'avg',case
when avg(grade)>=75 then 'Passing'
else 'Failing'
 end as 'status' from papers
right join stdents on stdents.id = papers.students_id  
group by first_name 
order by avg desc ;
