show databases;
create database MAA;
use Maa;
show tables;
drop table product;
create table coor(
FCCODE varchar(10),
FCNAME varchar(100),
FCSKID varchar(100),
FCCORP varchar(100)
);
create table corp (
FCCODE varchar(10),
FCNAME varchar(100),
FCSKID varchar(100)
);
create table product(
FCCODE varchar(10),
FCNAME varchar(100),
FCCORP varchar(100),
FCCOOR varchar(100),
FNQTY float
);
desc product;
INSERT INTO COOR (FCCODE, FCNAME, FCSKID, FCCORP)
VALUES
    ('51-01824', 'มาซีแล็ก', '{6๛x((()', 'tmภb((()'),
    ('006951-1', 'หจก.วิค', 'txห7((G', 'tmภb((()'),
    ('Q00004', 'พี.บี.อินโน', 'yUC(((*', 'xTjp((()'),
    ('SR2-00190', 'แพทเทอ', 'z๔k((()', 'tv((()'),
    ('ST-0002', 'เวรี่กู๊ดส์', '$$$$:', 'tv((()');
;
INSERT INTO COOR (FCCODE, FCNAME, FCSKID, FCCORP)
VALUES
    ('8888', 'มาซีแล็ก', '{6๛x((()', 'tmภb((()');
insert into corp (FCCODE,
FCNAME ,
FCSKID) values
    ('8888', 'บริษัท โมเดอน จำกัด', 'tv((()'),
    ('9999', 'บริษัท ลอง จำกัด', 'tmภb((()'),
    ('AIC', 'บริษัท ออล จำกัด', 'xTjp((()');
INSERT INTO PRODUCT (FCCODE, FCNAME, FCCORP, FCCOOR, FNQTY)
VALUES 
    ('A113-211', 'ทินเนอร์221', 'tv((()', '{6๛x((()', 15.00),
    ('A113-211', 'ทินเนอร์221', 'tv((()', '{6๛x((()', 15.00),
    ('T201-013', 'ทินเนอร์201 -1', 'tmภb((()', 'txห7((G', 20.00),
    ('T201-013', 'ทินเนอร์201 -1', 'tv((()', 'yUC(((*', 2.00),
    ('Z999', 'ทิ้ง', 'tmภb((()', '$$$$:', 5.00),
    ('KKK0 -160', 'ทินเนอร์201', 'tmภb((()', 'z๔k((()', 100.00),
    ('KKK0 -160', 'ทินเนอร์201', 'xTjp((()', 'z๔k((()', 50.00);
-- 1 
select * from product order by FCCODE desc;
-- 2 
select * from coor;
select * from corp where FCCODE in ('8888','AIC') ;
select corp.FCCODE, corp.FCNAME,coor.FCNAME
from coor
inner JOIN corp on coor.FCCODE = corp.FCCODE
where corp.FCCODE in ('AIC','8888') 
order by FCCODE asc ;
-- 3
select * from product,coor WHERE product.FCCODE = coor.FCCODE;
select 
coor.FCCODE, coor.FCNAME,
corp.FCCODE,corp.FCNAME,
product.FCCODE,sum(product.FNQTY)
from coor
inner JOIN corp ON coor.FCCODE = corp.FCCODE
inner JOIN product ON coor.FCCODE = product.FCCODE
WHERE coor.FCCODE IN ('51-01824', '9999')
group by product.FCCODE,coor.FCCODE, coor.FCNAME,corp.FCCODE,corp.FCNAME;
 


    