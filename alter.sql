use book_shop;
create table contacts(
id int auto_increment primary key,
name varchar(100) not null,
phone varchar(10) not null unique,
age int check (age>18),
constraint name_city unique (name) 
);
insert into contacts (name,phone) value('billbob','0912345678');
select * from contacts;
alter table contacts add column city varchar(20);
desc contacts;
alter table contacts drop column city;
alter table contacts rename column name to emp;
alter table contacts modify emp varchar(50) default 'Unknow';
insert into contacts(phone) values(091099999);
drop table contacts;