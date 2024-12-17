 create table Salespeople(SNUM int,SNAME varchar(20),CITY varchar(20),COMM float);


 insert into Salespeople values(1001,'Peel','London',0.1);

 insert into Salespeople values(1002,'Serres','San Jose',0.13);

 insert into Salespeople values(1004,'Motika','London',0.11);


 insert into Salespeople values(1007,'Rifkin','Barcelona',0.15);

 insert into Salespeople values(1003,'AxelRod','New York',0.10);


 insert into Salespeople values(1005,'Fran','London',0.26);

 select * from Salespeople

 create table Orders(ONUM int,AMT float,ODATE date,CNUM int,SNUM int);

 insert into orders values(3001,18.69,'1996-10-03',2008,1007);


 insert into orders values(3003,769.19,'1996-10-03',2001,1001);


 insert into orders values(3002,1900.10,'1996-10-03',2007,1004);

 insert into orders values(3005,5160.45,'1996-10-03',2003,1002);


 insert into orders values(3006,1098.16,'1996-10-03',2008,1007);

insert into orders values(3009,1713.23,'1996-10-04',2002,1003);

insert into orders values(3007,75.75,'1996-10-04',2002,1003);


insert into orders values(3008,4723,'1996-10-05',2006,1001);

insert into orders values(3010,1309.95,'1996-10-06',2004,1002);


 insert into orders values(3011,9891.88,'1996-10-06',2006,1001);

 select * from Orders

 create table customers(CNUM int,CNAME varchar(20),CITY varchar(20),Rating int,SNUM int) ;
insert into customers values (2001,'Hoffman','London',100,1001);


insert into customers values (2002,'Giovanni','Rome',200,1003);
insert into customers values (2003,'Liu','San Jose',200,1002);


insert into customers values (2004,'Grass','Berlin',300,1002);

insert into customers values (2006,'Clemens','London',100,1001);


insert into customers values (2008,'Cisneros','San Jose',300,1007);

insert into customers values (2010,'Cisner','San Jose',90,1007);
insert into customers values (2007,'Pereira','Rome',100,1004);
insert into customers values (2007,'Peira','Berlin',100,1002);

select * from customers

select * from Orders

select * from Salespeople

select sum(AMT) as fullamt, salespeople.SNUM, salespeople.SNAME FROM Orders 
join Salespeople 
on Orders.SNUM=Salespeople.SNUM  
group by salespeople.SNUM, Salespeople.SNAME having SNAME='Serres'



select SUM(AMT) from Orders where SNUM=1002

select COUNT(ONUM) FROM Orders WHERE ODATE='1996-10-03'

SELECT count(customers.CNUM), CUSTOMERS.CITY, Salespeople.SNAME FROM customers 
JOIN Salespeople ON customers.SNUM=Salespeople.SNUM 
group by  CUSTOMERS.CITY, Salespeople.SNAME having SNAME='Serres'

select ORDERS.ONUM, CUSTOMERS.CNAME FROM ORDERS JOIN customers ON ORDERS.CNUM=CUSTOMERS.CNUM 

SELECT DISTINCT CUSTOMERS.SNUM, Salespeople.SNAME, customers.CNAME from customers join Salespeople on customers.SNUM!=Salespeople.SNUM where customers.CITY=Salespeople.CITY 

select  * from customers join Salespeople on customers.SNUM=Salespeople.SNUM where customers.Rating>=any and Salespeople.SNAME='serres' 

select * from customers where rating>=any
(select rating from salespeople s,customers c
where s.SNUM=c.SNUM
and SNAME='Serres');

select * from orders where ODATE in ('1996-10-03', '1996-10-04') 

select * from orders where ODATE='1996-10-03' or ODATE='1996-10-04'

select cname,o1.onum,o2.onum
from orders o1,orders o2,customers c
where o1.cnum=o2.cnum
and o1.cnum=c.cnum
and o2.cnum=c.cnum
and o1.onum<o2.onum;

select customers.CNAME, o1.ONUM, o2.ONUM from customers join Orders o1 on o1.CNUM=customers.CNUM  join Orders o2 on o2.CNUM=customers.CNUM 
where o1.cnum=customers.CNUM and o2.CNUM=customers.CNUM and o1.ONUM>=o2.ONUM

select * from customers where rating >(select MAX(Rating)  from customers where CITY='rome')

select * from customers where Rating>100 or CITY='rome'
/*bujji query wrong*/

select * from customers where SNUM=1001

select sum(amt) as fullamt, o1.snum, s1.sname from Orders o1 join Salespeople s1 on s1.SNUM=o1.SNUM 
group by o1.SNUM,s1.SNAME having sum(amt)>MAX(amt)

/*question60 doubt- there are no zeros and nulls in table*/

select s1.sname, c1.cname from Salespeople s1 join customers c1 on c1.SNUM>s1.SNUM where Rating<200 group by s1.SNAME,c1.CNAME order by SNAME
/*bujji query doubt*/

select SUM(amt*comm) as commission, s1.sname from Orders join Salespeople s1 on s1.SNUM=Orders.SNUM group by s1.sname


select CNAME,CITY from customers where rating= (select rating from customers where CNAME='hoffman')

select s1.sname, c1.cname from customers c1 join Salespeople s1 on c1.SNUM=s1.SNUM where s1.SNAME<c1.CNAME

select Salespeople.SNAME, customers.CNAME, customers.SNUM as csnum,Salespeople.SNUM as ssnum  from customers join Salespeople on customers.SNUM=Salespeople.SNUM

select * from customers

select * from Orders

select * from Salespeople

select customers.CNAME, customers.Rating from Orders join customers on Orders.CNUM=customers.CNUM  group by  customers.CNAME having AVG(ORDERS.ONUM))<COUNT(CNUM)
select onum,amt,odate from Orders

select COUNT(cname) as ratingcount from customers where rating is not null
/*not equal symbol is not working*/

select o1.onum, s1.sname, c1.cname from Orders o1,customers c1 ,Salespeople s1 where o1.CNUM=c1.CNUM and o1.SNUM=s1	.SNUM
select c.cnum,cname,rating from customers c join orders O ON  O.CNUM=c.CNUM GROUP BY CNAME, c.CNUM, Rating having count(O.ONUM)>(select count(c.CNUM) from Orders group by CNAME)
select c.cnum,cname,rating from customers c join orders o on c.cnum=o.cnum group by c.cnum having count(onum)>(select avg(ODATE) from orders)
SELECT c.cnum, c.cname, c.rating
FROM customers c
JOIN orders o ON c.cnum = o.cnum
GROUP BY c.cnum, c.cname, c.rating
HAVING COUNT(o.onum) > (
    SELECT AVG(order_count)
    FROM (
        SELECT COUNT(onum) AS order_count
        FROM orders
        GROUP BY cnum
    ) AS avg_orders
);

select * from Salespeople
select * from Orders
select * from customers

/*1st*/
select top 0 * from Salespeople
select column_name from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='Salespeople'
/*2nd*/
select * from customers where Rating=100
/*3*/
select * from customers where CITY is null
/*4*/
select Orders.ODATE, orders.SNUM, Salespeople.SNAME,MAX(amt) from Salespeople join Orders on Orders.SNUM=Salespeople.SNUM group by Salespeople.SNAME, Orders.SNUM, Orders.ODATE
/*5*/
select * from Orders  order by cnum desc;
/*6*/
select distinct SNAME, Orders.SNUM from orders join Salespeople on Orders.SNUM=Salespeople.SNUM
select distinct sname from Salespeople where snum in (select snum from Orders)
/*7*/
select sname, customers.CNAME, customers.SNUM from customers join Salespeople on Salespeople.SNUM=customers.SNUM
/*8*/
select c.snum, s.sname, COUNT(c.SNUM) from customers c join Salespeople s on c.SNUM=s.SNUM group by s.SNAME, c.SNUM having COUNT(c.SNUM)>1
/*9*/
select count(o.ONUM) as csnum, s.sname from Orders o join Salespeople s on o.SNUM=s.SNUM group by s.SNAME, s.SNUM order by csnum desc
/*10 doubt*/
select * from customers c1 where EXISTS(select 1 from customers where CITY='san jose')

/*11*/
select s.sname, c.cname from customers c join Salespeople s on c.CITY=s.CITY and c.SNUM=s.SNUM
/*12*/
select MAX(amt), s.sname from Orders join Salespeople s on s.SNUM=Orders.SNUM group by s.SNAME
/*13*/
select * from customers where CITY='san jose' and Rating>200
/*14*/
select s.sname, (o.amt*s.comm) as commission from Salespeople s join Orders o on o.SNUM=s.SNUM where s.CITY='london'
/*15*/
select * from Salespeople s join Orders o on o.SNUM=s.SNUM where s.SNAME='Motika'
/*16*/
select distinct c.cname from orders o join customers c on o.cnum=c.cnum where ODATE='1996-10-03'
/*17*/
select sum(o.amt) as sumamt,o.odate from orders o group by o.odate having sum(o.amt)>=(2000+max(o.amt))
/*18*/
select * from Orders where amt>(select min(amt) from Orders where ODATE='1996-10-06') and ODATE!='1996-10-06'
select * from orders where amt>any(select amt from Orders where ODATE='1996-10-06') 
/*19*/
select DISTINCT s.sname from Salespeople s join customers c on c.SNUM=s.SNUM WHERE 
EXISTS(SELECT C2.CNUM FROM customers C2 WHERE Rating=300 AND c2.SNUM=s.SNUM)
/*21*/
select cname from customers join Salespeople on customers.SNUM=Salespeople.SNUM where CNUM>1000+customers.SNUM and customers.SNUM=(select s2.SNUM from Salespeople s2 where s2.SNAME='serres')
SELECT c.CNAME
FROM Customers c
JOIN Salespeople s ON c.SNUM = s.SNUM
WHERE c.CNUM > 1000 + c.SNUM
AND c.SNUM = (
    SELECT s2.SNUM
    FROM Salespeople s2
    WHERE s2.SNAME = 'serres'
);
select cname from customers where CNUM>(select SNUM+1000 from Salespeople where SNAME='serres')
select * from customers
select * from Salespeople
/*20*/
SELECT DISTINCT C1.CNAME AS CNAME1 , C2.CNAME AS CANME2 FROM CUSTOMERS C1 JOIN customers C2 ON C1.Rating=C2.Rating WHERE C1.CNAME!= C2.CNAME
/*22*/
SELECT CONCAT(round(COMM*100,2),'%') AS COMMISSIONPERCENT FROM Salespeople
/*ANY OTHER WAY TO DO IT*/
/*23*/
SELECT MAX(O.AMT), S.sname, o.odate from Orders o join Salespeople s on o.SNUM=s.SNUM group by s.SNAME, o.ODATE having MAX(O.AMT)>3000
/*24*/
SELECT MAX(O.AMT), S.sname, o.ONUM from Orders o join Salespeople s on o.SNUM=s.SNUM where ODATE='1996-10-03' group by SNAME, ONUM

SELECT s.SNAME, o.ONUM, o.AMT AS largest_order FROM Orders o JOIN Salespeople s ON o.SNUM = s.SNUM
WHERE o.ODATE = '1996-10-03'  -- Filter for October 3, 1996
AND o.AMT = (
    SELECT MAX(o2.AMT)
    FROM Orders o2
    WHERE o2.SNUM = o.SNUM
    AND o2.ODATE = '1996-10-03'
)
ORDER BY largest_order DESC;


/*25*/
select * from customers where city in (select distinct CITY from customers where SNUM=1002)
/*26*/
select * from customers where rating>200
/*27*/
select COUNT(distinct orders.SNUM) from Orders
/*28*/
select c.cname, (s.comm*100) from customers c join Salespeople s on c.SNUM=s.SNUM where (s.comm*100)>12
/*29*/
SELECT SNAME from Salespeople join customers on customers.SNUM=Salespeople.SNUM group by customers.SNUM, SNAME having COUNT(customers.SNUM)>1
/*30*/
select s.sname, c.cname from Salespeople s join customers c on c.CITY=s.CITY and c.SNUM=s.SNUM
/*31*/
select * from Salespeople where SNAME like 'P__I%'
/*32*/
SELECT * FROM ORDERS O WHERE EXISTS (SELECT 1 FROM customers C WHERE C.CNAME='Cisneros' AND C.CNUM=O.CNUM )
/*33*/
select ONUM, SNAME, AMT from orders o join Salespeople s on o.SNUM=s.SNUM where AMT=(select MAX(AMT) from Orders o1 where o1.SNUM=o.SNUM) and SNAME in ('serres', 'rifkin')
/*doubt*/
/*34*/
select SNUM, SNAME, COMM as COMMISSION, CITY from Salespeople
/*35*/
select * from customers where CNAME like 'A%G'
/*36*/
select c1.cname, c2.cname from customers c1 cross join customers c2
/*37*/
select ONUM, AMT from orders group by onum, AMT having amt>(select AVG(AMT) from Orders)
/*38*/
select cname,cnum from customers c1 where Rating in (select max(Rating) from customers c2 where c1.CITY=c2.city )
/*40*/
select cname, rating from customers where CITY='san jose'
/*39*/
select sum(AMT), odate from orders group by ODATE order by SUM(AMT) desc
/*41*/
select * from Orders o join customers c on o.CNUM=c.CNUM where amt<(select min(AMT) from Orders o1 join customers c1 on o1.CNUM=c1.CNUM  where CITY='san jose') 
select * from customers
/*42*/
select * from Orders o1 where AMT> (select avg(AMT) from Orders o2 where o2.CNUM=o1.CNUM) 
/*43*/
select MAX(rating), CITY from customers group by CITY
/*44*/
select (comm*AMT) as commpersale, sname from Salespeople join orders on Salespeople.SNUM=Orders.SNUM
join customers on customers.SNUM=Salespeople.SNUM where Rating>100
/*45*/
select count(cnum) from customers where Rating>(select avg(Rating) from customers where CITY='san jose')
/*46*/
select c1.sname, c2.sname from Salespeople c1 cross join Salespeople c2
/*47*/
select * from Salespeople where city in('barcelona','london')
/*48*/
select sname from Salespeople join Orders o on o.snum=Salespeople.SNUM group by SNAME having count(o.SNUM)=1
/*49*/
select c1.CNAME, c2.CNAME from customers c1  join customers c2 on c1.SNUM=c2.SNUM 
/*50*/
select * from Orders where AMT>1000
/*51*/
select o.onum, cname from Orders o, customers where o.CNUM=customers.CNUM
/*70*/
select comm, sname from salespeople join customers on salespeople.snum=customers.snum where customers.city='london' group by SNAME, COMM
/*71*/
select DISTINCT sname from Salespeople join customers on Salespeople.SNUM=customers.SNUM where CUSTOMERS.CITY= any (select CITY from  customers WHERE CITY!='LONDON')
/*72*/
select sname from Salespeople where exists (select * from customers where customers.CITY=Salespeople.CITY and customers.SNUM!=Salespeople.SNUM)
/*73*/
