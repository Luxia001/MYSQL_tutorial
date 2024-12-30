show databases;
create database join_us;
select database();
use join_us;
create table users(
    email varchar(255) primary key,
    created_at timestamp default now()
);
desc users;

select email,DATE_FORMAT(created_at, '%M %d, %Y') from users 
where created_at =  (select min(created_at) from users);

select monthName(created_at) as month,count(*) 
from users
group by month;

select count(*) from users
where email like '%@yahoo.com%';

select case 
when email like '%@gmail.com%' then 'gmail'
when email like '%@yahoo.com%' then 'yahoo'
when email like '%@hotmail.com%' then 'homail'
else 'other'
end as 'provider',
count(*)
from users
group by provider;

-- delete from users;