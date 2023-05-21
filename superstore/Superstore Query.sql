--- 1. Show all details about orders, products and propertyinfo 
select * from orders;
select * from products;	
select * from propertyinfo;	

-- 2. Select city and state column in propertyinfo table
select "PropertyCity", "PropertyState" from propertyinfo;

-- 3. Show the dates orders were made and quantity of orders
select "OrderDate", "Quantity" from orders;

-- 4. Unique dates orders were made
select distinct "OrderDate" from orders;

-- 5. Different products category 
select distinct "ProductCategory" from products;

-- 6. different properties that have made orders
select distinct "PropertyID" from orders;

-- 7. Data from order table and sort in ascending order of quantity
select * from orders order by "Quantity" asc;

-- 8. Select all products and their details and sort in descending order of price
select * from products order by "Price" desc;

-- 9. Five most expensive products
select * from products order by "Price" desc limit 5;

-- 10. Five least expensive products
select * from products order by "Price" asc limit 5;

-- 13. Select all properties in descending order of the city they are in
select * from propertyinfo order by "PropertyCity" desc;

-- 14. Name of products whose id is 50
select "ProductID", "ProductName" from products where "ProductID" = 50;

-- 15. Name and category of product whose id is 94
select "ProductID", "ProductName", "ProductCategory" from products where "ProductID" = 94;

-- 16. Name and category of product whose prices are above $200
select "ProductID", "ProductName", "ProductCategory", "Price" from products where "Price" >200;

-- 17. Name and category of the most expensive product 
select "ProductName", "ProductCategory" from products order by "Price" desc limit 1;

-- 18. Name and category of product whose price is $300
select "ProductName", "ProductCategory", "Price" from products where "Price" = 300;

-- 19. Name of product whose prices are between $50 and $200
select "ProductName", "Price" from products where "Price" between 50 and 200 order by "Price" asc;

-- 20. Productid of products sold between 07-01-2015 and 10-01-2015
select "ProductID", "OrderDate" from orders where "OrderDate" between '2015-01-07' and '2015-01-10';

-- 21. Orders made by property 14, 16, and 10
select * from orders where "PropertyID" in (14, 16, 10);

-- product whose price is either 50, 200, 215
select * from products where "Price" in (50, 200, 215);

-- 22. Orders made by property not 14, 16, and 10
select * from orders where "PropertyID" not in (14, 16, 10);

-- 23. How much will all products be worth if there were just 2 of it in the store?
select sum(2*"Price") as "Total_Sum" from products;
-- or
select "ProductID", 2 * "Price" as "Double_Price" from products;

-- 24. What product price is the lowest?
select min("Price") from products;

-- 24. What product price is the lowest?
select max("Price") from products;

-- How many products are there?
select count (*) as Total_Product from products;

-- How many orders were made in total?
select count (*) as Total_Orders from orders;

-- What is the average price of each product category?
select "ProductCategory", round(avg("Price"),2) as "Average_Price"
from products
Group by "ProductCategory";

-- Find product categories that the average product price is greater than 30
select "ProductCategory", avg("Price") as "Average_Price"
from products
Where "ProductCategory" in ('Public Areas','Housekeeping')
Group by "ProductCategory"
having avg("Price") > 30;

-- What products have names starting with “T”?
select * from products
Where "ProductName" like 'T%'
or "ProductNmae" like 't%';

-- We want to find the the average price of housekeeping products.
select avg ("Price") from products
where "ProductCategory" like 'Housekeeping%';

-- The no of products avail and the sum of their prices for each product category assuming there is just one of each product available in the store.
select "ProductCategory", count ("ProductID") as no_of_products, sum("Price") as total_price
from products
group by "ProductCategory";



-- Display in a new table each order and the amount paid for them?
select * from orders;
select * from products;

select "OrderID", "Quantity", "Price", "Price" * "Quantity" as amount_paid 
from orders
join products
on products."ProductID" = orders."ProductID";

select *
from orders
join products
on products."ProductID" = orders."ProductID";

select *
from orders
join products
on products."ProductID" = orders."ProductID"
join propertyinfo
on orders."PropertyID" = propertyinfo."PropID";





