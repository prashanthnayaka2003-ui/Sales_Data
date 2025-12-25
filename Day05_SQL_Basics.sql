create database SalesDB;

use SalesDB;
go
/*
create table  Sales ( ORDER_ID INT ,
PRODUCT VARCHAR(50),
CATEGORY VARCHAR(50),
QUANTITY int ,
PRICE INT);
    
INSERT INTO Sales VALUES
(101,'Mobile','Electronics',2,15000),
(102,'Laptop','Electronics',1,55000),
(103,'Chair','Furniture',4,2500),
(104,'Table','Furniture',1,8000),
(105,'Headset','Electronics',3,2000);
*/
SELECT * FROM Sales

SELECT PRODUCT,PRICE FROM Sales;

SELECT  * FROM Sales  WHERE CATEGORY = 'Electronics';

SELECT * FROM SALES ORDER BY PRICE DESC;


--Which products are Electronics?
--Which product has highest price?
--How many rows are there?

SELECT COUNT(*) as totalrows FROM Sales;

SELECT  * FROM Sales  WHERE CATEGORY = 'Electronics';

SELECT * FROM SALES ORDER BY PRICE DESC;
-------------------------------------------------------------------------------------------


select * from Sales where CATEGORY = 'Electronics' and Price>5000

select * from Sales where CATEGORY = 'Electronics' or CATEGORY = 'Furniture'

select * from  Sales where  PRICE  between 5000 and 20000;

select * from  Sales where PRODUCT  IN ('MOBILE','LAPTOP')

select * from  Sales where PRODUCT LIKE 'M%'

select * from  Sales where PRODUCT LIKE '%a%'

---Products priced above 10,000
--Electronics products starting with letter ‘H’
--Furniture products between 2,000 and 10,000

SELECT PRODUCT FROM SALES  WHERE PRICE> 10000

select * from  Sales where PRODUCT LIKE 'H%' ; 

SELECT PRODUCT FROM Sales WHERE PRICE BETWEEN 2000 AND 10000;


--------------------------------------------------------------------------

SELECT COUNT(*) FROM Sales;

select sum(QUANTITY* PRICE) as total_sales FROM Sales;

select avg(PRICE) FROM Sales;

select min(PRICE)as min_price,MAX (PRICE ) as max_price FROM Sales;

select  sum (QUANTITY*PRICE) as total_sales from Sales where CATEGORY='Electronics'

select avg(PRICE) FROM Sales WHERE CATEGORY='Furniture'

select max( PRICE) FROM Sales;

--How many Electronics orders?
--Total revenue from Furniture?
--Highest priced product?

select SUM(QUANTITY)  as s FROM Sales  where CATEGORY = 'Electronics';

select  sum (QUANTITY* PRICE) as Furniture_sales FROM  Sales where CATEGORY = 'Furniture';

select max (PRICE) AS HIGHEST_PRICED_PRODUCT FROM Sales

----------------------------------------------------------------------------------------------

SELECT   CATEGORY ,sum(QUANTITY* PRICE) as total_sales FROM Sales  group by CATEGORY; 

 select  PRODUCT ,count(QUANTITY) AS Order_Count FROM Sales  GROUP BY  PRODUCT;

 SELECT  CATEGORY, AVG (PRICE) FROM Sales GROUP  BY CATEGORY

 SELECT  CATEGORY, SUM(QUANTITY*PRICE) as total_sales FROM Sales group by
 CATEGORY having  SUM (QUANTITY*PRICE)  > 10000;


 select  PRODUCT ,count (*) from Sales  group by PRODUCT  having count(*)>1; 

 --Which category gives highest revenue?
 --Which product sold most quantity? 
-- Which category has average price > 10,000?

 select top 1 CATEGORY,sum (QUANTITY*PRICE) as total_sales from Sales  
 group by CATEGORY 
 
 select top 1 PRODUCT,sum(QUANTITY ) as topper from Sales  group by PRODUCT order by topper  desc

 select CATEGORY , avg (Price)  as average_sales from Sales  group by  CATEGORY having avg(PRICE)> 10000

 ----------------------------------------------------------------------------------------------------------------
 /*
 create table Product_Info(Product varchar(50),Supplier varchar(50));
 
 insert into Product_Info values
 ('Mobile','Samsung'),
 ('Laptop','Dell'),
 ('Chair','IKEA'),
('Table','IKEA'),
('Headset','Boat')*/

 select* from Product_Info;

 select S.*,P.Supplier from Sales S 
 inner join Product_Info P on S.Product=P.Product;

 --or

  select  S.ORDER_ID,S.PRODUCT,S.CATEGORY,S.QUANTITY,S.PRICE,P.Supplier from Sales S 
 inner join Product_Info P on S.Product=P.Product;

 
  select S.ORDER_ID,P.Product,P.Supplier from Sales S left join Product_Info P on S.Product=P.Product;


  select P.Supplier ,sum (S.QUANTITY * S.PRICE) as total_sales 
  from  Sales S join Product_Info P on  S.Product=P.Product
  group by P.Supplier

-----------------------------------------------------------------------------------------------------------------
select* from Sales
select* from Product_Info

/*
create table consumers (customer_id int, customer_name varchar(40))
insert into consumers values 
(1,'ravi'),
(2,'sita'),
(3,'Arjun')*/
/*
create table orders_table(order_id int,customer_id int ,amount int)
insert into orders_table values
(101,1,5000),
(102,2,8000),
(103,3,12000);*/

select * from consumers c
select * from  orders_table

select customer_name,order_id,amount from consumers c 
inner join orders_table o on o.customer_id=c.customer_id;

select customer_name, sum(o.amount) as total_spent from consumers c
inner join orders_table o  on o.customer_id=c.customer_id group by c.customer_name;

select top 1 customer_name, sum(o.amount) as total_spent from consumers c
inner join orders_table o  on o.customer_id=c.customer_id group by c.customer_name ORDER BY total_spent desc 
--------------------------------------------------------------------------------------------------------------------
/*
Show top 2 expensive products
Show cheapest product
Show Electronics products sorted by price
Show products whose name ends with 't'
Show products not Electronics*/
select * from Sales
select DISTINCT TOP 2 PRICE,PRODUCT ,ORDER_ID from Sales  ORDER BY PRICE DESC 
select DISTINCT TOP 1 PRICE,PRODUCT ,ORDER_ID from Sales  ORDER BY PRICE ASC  
SELECT  * from Sales where CATEGORY= 'Electronics' ORDER BY  PRICE ASC
SELECT  * FROM Product_Info WHERE Supplier like '%t'
select * from Sales where CATEGORY!= 'Electronics'


/*

Get all Furniture products with price > 5000
Get products priced between 2000 and 10000
Sort products by quantity sold
Find products starting with letter “C”
Get Electronics OR products priced above 30000*/

 select * from Sales where CATEGORY= 'Furniture' and PRICE>5000
 select * from Sales where PRICE between 2000 and 10000;
 select * from Sales  order by QUANTITY asc;
 SELECT  * FROM Product_Info WHERE PRODUCT like 'C%';
 select * from sales where CATEGORY= 'Electronics' or  PRICE > 30000;

 -- 1. Show only Electronics category
SELECT * FROM sales
WHERE category = 'Electronics';
-- 2. Products with price > 10000
SELECT * FROM sales
WHERE price > 10000;
-- 3. Electronics AND price > 10000
SELECT * FROM sales
WHERE category='Electronics' AND price > 10000;
-- 4. Price between 5000 and 20000
SELECT * FROM sales
WHERE price BETWEEN 5000 AND 20000;
-- 5. Products starting with 'M'
SELECT * FROM sales
WHERE product LIKE 'M%';
-- 6. Sort by highest price
SELECT * FROM sales
ORDER BY price DESC;
---------------------------------------------------------------------------------------------------------------------------------









