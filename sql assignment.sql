create database assignment1;

create table items_table
(
Item_id int,
Item_desc Varchar(250),
vendor_no int,
Vendor_name Varchar(250),
botttle_size int,
bottle_price decimal(15,3)
);
INSERT INTO items_table (Item_id, Item_desc, vendor_no, Vendor_name, botttle_size, bottle_price) VALUES
(1, 'Travis Hasse Apple Pie', 305, 'Mhw Ltd', 750, 9.77),
(2, 'D''aristi Xtabentun', 391, 'Anchor Distilling (preiss Imports)', 750, 14.12),
(3, 'Hiram Walker Peach Brandy', 370, 'Pernod Ricard Usa/austin Nichols', 1000, 6.50),
(4, 'Oak Cross Whisky', 305, 'Mhw Ltd', 750, 25.33),
(5, 'Uv Red(cherry) Vodka', 380, 'Phillips Beverage Company', 200, 1.97),
(6, 'Heaven Hill Old Style White Label', 259, 'Heaven Hill Distilleries Inc.', 750, 6.37),
(7, 'Hyde Herbal Liqueur', 194, 'Fire Tail Brands Llc', 750, 5.06),
(8, 'Dupont Calvados Fine Reserve', 403, 'Robert Kacher Selections', 750, 23.61);
select * from items_table;

create database products;
Use products;
-- Create the table
CREATE TABLE product_sales (
    Product_Id INT,
    Country VARCHAR(50),
    Product VARCHAR(50),
    Units_Sold DECIMAL(10, 1),
    Manufacturing_Price DECIMAL(10, 2),
    Sale_Price DECIMAL(10, 2),
    Gross_Sales DECIMAL(15, 2),
    Sales DECIMAL(15, 2),
    COGS DECIMAL(15, 2),
    Profit DECIMAL(15, 2),
    Sale_Date DATE,
    Month_Number INT,
    Month_Name VARCHAR(20),
    Year INT
);

-- Insert data into the table
INSERT INTO product_sales (Product_Id, Country, Product, Units_Sold, Manufacturing_Price, Sale_Price, Gross_Sales, Sales, COGS, Profit, Sale_Date, Month_Number, Month_Name, Year) VALUES
(1, 'Canada', 'Carretera', 1618.5, 3.00, 20.00, 32370.00, 32370.00, 16185.00, 16185.00, '2014-01-01', 1, 'January', 2014),
(2, 'Germany', 'Carretera', 1321, 3.00, 20.00, 26420.00, 26420.00, 13210.00, 13210.00, '2014-01-01', 1, 'January', 2015),
(3, 'France', 'Carretera', 2178, 3.00, 15.00, 32670.00, 32670.00, 21780.00, 10890.00, '2014-06-01', 6, 'June', 2016),
(4, 'Germany', 'Carretera', 888, 3.00, 15.00, 13320.00, 13320.00, 8880.00, 4440.00, '2014-06-01', 6, 'June', 2017),
(5, 'Mexico', 'Carretera', 2470, 3.00, 15.00, 37050.00, 37050.00, 24700.00, 12350.00, '2014-06-01', 6, 'June', 2018),
(6, 'Germany', 'Carretera', 1513, 3.00, 350.00, 529550.00, 529550.00, 393380.00, 136170.00, '2014-12-01', 12, 'December', 2019),
(7, 'Germany', 'Montana', 921, 5.00, 15.00, 13815.00, 13815.00, 9210.00, 4605.00, '2014-03-01', 3, 'March', 2020),
(8, 'Canada', 'Montana', 2518, 5.00, 12.00, 30216.00, 30216.00, 7554.00, 22662.00, '2014-06-01', 6, 'June', 2021);

select * from product_sales;

DELETE FROM product_sales
WHERE Units_Sold IN (1618.5, 888, 2470);

drop table product_sales;

-- Create the table
CREATE TABLE product_sales (
    Product_Id INT,
    Country VARCHAR(50),
    Product VARCHAR(50),
    Units_Sold DECIMAL(10, 1),
    Manufacturing_Price DECIMAL(10, 2),
    Sale_Price DECIMAL(10, 2),
    Gross_Sales DECIMAL(15, 2),
    Sales DECIMAL(15, 2),
    COGS DECIMAL(15, 2),
    Profit DECIMAL(15, 2),
    Sale_Date DATE,
    Month_Number INT,
    Month_Name VARCHAR(20),
    Year INT
);

-- Insert data into the table
INSERT INTO product_sales (Product_Id, Country, Product, Units_Sold, Manufacturing_Price, Sale_Price, Gross_Sales, Sales, COGS, Profit, Sale_Date, Month_Number, Month_Name, Year) VALUES
(1, 'Canada', 'Carretera', 1618.5, 3.00, 20.00, 32370.00, 32370.00, 16185.00, 16185.00, '2014-01-01', 1, 'January', 2014),
(2, 'Germany', 'Carretera', 1321, 3.00, 20.00, 26420.00, 26420.00, 13210.00, 13210.00, '2014-01-01', 1, 'January', 2015),
(3, 'France', 'Carretera', 2178, 3.00, 15.00, 32670.00, 32670.00, 21780.00, 10890.00, '2014-06-01', 6, 'June', 2016),
(4, 'Germany', 'Carretera', 888, 3.00, 15.00, 13320.00, 13320.00, 8880.00, 4440.00, '2014-06-01', 6, 'June', 2017),
(5, 'Mexico', 'Carretera', 2470, 3.00, 15.00, 37050.00, 37050.00, 24700.00, 12350.00, '2014-06-01', 6, 'June', 2018),
(6, 'Germany', 'Carretera', 1513, 3.00, 350.00, 529550.00, 529550.00, 393380.00, 136170.00, '2014-12-01', 12, 'December', 2019),
(7, 'Germany', 'Montana', 921, 5.00, 15.00, 13815.00, 13815.00, 9210.00, 4605.00, '2014-03-01', 3, 'March', 2020),
(8, 'Canada', 'Montana', 2518, 5.00, 12.00, 30216.00, 30216.00, 7554.00, 22662.00, '2014-06-01', 6, 'June', 2021);
-----sum f sales------
SELECT 
    SUM(Sale_Price) AS Total_Sale_Price, 
    SUM(Gross_Sales) AS Total_Gross_Sales
FROM 
    product_sales;
----------highest sale-----------------
SELECT TOP 1 
    Year, 
    SUM(Sales) AS Total_Sales
FROM 
    product_sales
GROUP BY 
    Year
ORDER BY 
    Total_Sales DESC;
--------where_clause--------
SELECT 
    Product 
FROM 
    product_sales
WHERE 
    Sales = 37050.00;
---------between-------------
SELECT 
    DISTINCT Country 
FROM 
    product_sales
WHERE 
    Profit BETWEEN 4605.00 AND 22662.00;
-----------product_id where clause--------
SELECT 
    Product_Id 
FROM 
    product_sales
WHERE 
    COGS = 24700.00;
-----------
USE assignment1;

SELECT item_desc 
FROM items_table
WHERE botttle_size = 750;
---------------

SELECT 
    vendor_name 
FROM 
    items_table 
WHERE 
    vendor_no IN (305, 380, 391);
----------------------------------

SELECT 
    SUM(bottle_price) AS Total_Bottle_Price 
FROM 
    items_table;
------------------------------------------

ALTER TABLE items_table
ADD CONSTRAINT PK_Item_Id PRIMARY KEY (Item_id);
------------------------------------------------
SELECT 
    Item_id 
FROM 
    items_table 
WHERE 
    bottle_price = 5.06;
-----------------JOINS---------------------------------
USE products;

SELECT *
FROM product_sales ps
INNER JOIN assignment1.dbo.items_table it
ON ps.Product_Id = it.Item_Id;


SELECT *
FROM product_sales ps
FULL OUTER JOIN assignment1.dbo.items_table it
ON ps.Product_Id = it.Item_Id;

USE product_data;

SELECT *
FROM product_sales ps
LEFT JOIN assignment1.dbo.items_table it
ON ps.Product_Id = it.Item_Id;

USE product_data;

SELECT *
FROM product_sales ps
FULL OUTER JOIN assignment1.dbo.items_table it
ON ps.Product_Id = it.Item_Id;

USE product_data;

SELECT *
FROM product_sales ps
RIGHT JOIN assignment1.dbo.items_table it
ON ps.Product_Id = it.Item_Id;

USE product_data;

SELECT *
FROM product_sales ps
CROSS JOIN assignment1.dbo.items_table it;

USE product_data;

SELECT it.item_desc, ps.Product
FROM product_sales ps
INNER JOIN assignment1.dbo.items_table it
ON ps.Product_Id = it.Item_Id
WHERE ps.Gross_Sales = 13320.00;


SELECT 
    Item_id,
    LEFT(item_desc, CHARINDEX(' ', item_desc) - 1) AS Item_desc1,
    SUBSTRING(item_desc, CHARINDEX(' ', item_desc) + 1, LEN(item_desc)) AS Item_desc2
FROM items_table;



