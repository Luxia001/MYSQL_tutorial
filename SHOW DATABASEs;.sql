show databases;
use book_shop;
show tables;
desc books;
select * from books;
select title from books where title not like '% %';
select * from books where released_year!=2017;
select title,author_fname,author_lname from books where author_fname not like '%da%';
select * from books where released_year between 1900 and 2000;
select title,author_lname from books where author_lname='carver' or author_lname='lahiri' or author_lname='smith';
select title,author_lname from books where author_lname in ('carver','lahiri','smith');
select title,author_lname from books where author_lname not in ('carver','lahiri','smith');
select title , released_year, 
case
    when released_year >= 2000 then '>=2000'
    else '<2000'
end as 'if'
from books;
select title as'1' from books where released_year < 1980;
select title,concat(author_fname,' ',author_lname)as 'author'  from books where author_lname in ('Eggers','chabon');
select title from books where author_lname ='Lahiri' and released_year>2000;
select title from books where pages between 100 and 200;
select title,concat(author_fname,' ',author_lname) from books where author_lname like 'C%' or author_lname like 'S%';
select title,author_lname, case 
when title like '%stories%' then 'short' 
when title in ('Just Kids' ,'A Heartbreaking Work of Staggering Genius') then 'memoir' 
else 'novel' end as 'type' 
from books;
SELECT 
    author_fname,
    author_lname,
    CASE
        WHEN COUNT(*) >1 THEN CONCAT(COUNT(*), ' ', 'books')
        ELSE CONCAT(COUNT(*), ' ', 'book')
    END AS 'count'
FROM
    books
GROUP BY author_fname , author_lname;



