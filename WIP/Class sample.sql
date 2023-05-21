-- Select Statement (Select and From), * means everything
select * from actor;
select * from film;
select * from address;

-- Return the title, description, release year and rating
select title, description, release_year, rating
from film;

-- Return the first and last name
select first_name, last_name
from actor;

-- Return the address, district and postal code
select address, district, postal_code
from address;

-- Select distinct (to return unique details)
select * from film;

-- Disticnt rating
select distinct rating 
from film;

-- Distinct replacement cost
select distinct replacement_cost 
from film;

-- Distinct amount
select distinct amount 
from payment;


-- Select where statement
select * from actor;

-- Select the actor id, first and last name
select actor_id, first_name, last_name
from actor
where actor_id = 105;


-- Select the actor id, first and last name of specific actors                      
select actor_id, first_name, last_name
from actor
where actor_id in (1, 10, 27, 100, 154, 163);
                  

select * from film;
-- Return title, release_year, length and rating of r rate movies

select title, release_year, length, rating
from film
where rating = 'R';


select title, description, release_year, length, rating
from film
where length <= 50;


-- Select count
select * from film;

-- Count
select count(*) from film;
select count(*) from customer;
select count(*) from inventory;

select count(*)
from film
where rating = 'R';

-- Limit
select * from rental limit 5;
select * from city limit 6;
select * from customer limit 10;

-- Order by statement
select first_name, last_name, email
from customer
order by first_name asc;

Select * from payment;

-- Top 10 customers that spent the most money
select customer_id, amount
from payment
order by amount desc limit 10;

-- Get the titles of the movies with film IDs 1-5
select film_id, title
from film
order by film_id asc limit 5;

-- Between (Lower and Higher Value)
select * from payment;

select customer_id, staff_id, amount
from payment
where amount between 3 and 5
order by amount asc;

select count(*)
from payment
where amount between 3 and 5;

-- In statement (Check for value in a list)

select first_name, last_name, email
from customer
where first_name in ('Mary', 'Susan', 'Michael', 'Maria');

-- Like statement
select first_name, last_name, email
from customer
where first_name like 'Ja%'
order by first_name asc;

select first_name, last_name, email
from customer
where first_name ilike '%il';

select first_name, last_name, email
from customer
where first_name ilike '%mar%';

-- Aggregate functions (Sum, Count, Average, Max, Min)
select * from payment;

select count(*) from payment;
select min(amount) from payment;
select max(amount) from payment;
select round(avg (amount),2) from payment;
select sum(amount) from payment;

select avg(rental_rate) from film;

-- Group statement
select * from film;

select rating, count(rating)
from film
Group by rating
order by count (rating) desc;

select * from payment;

select customer_id, sum (amount)
from payment
group by customer_id
order by sum(amount) desc
limit 10;

-- Having Clause (is used in conjuction with group)
select customer_id, sum (amount)
from payment
group by customer_id
having sum (amount)>= 180
order by sum (amount) desc;

select * from customer;

select distinct store_id
from customer;

select store_id, count(customer_id) 
from customer
group by store_id;

-- As statement
select * from customer;

select first_name As Name, last_name As Surname, email As Mailing_details
from customer;

-- Inner Join
Select c.customer_id, first_name, last_name, email, amount, payment_date
from customer as c
Inner join payment as p
On c.customer_id = p.customer_id;

-- Left Join
select f.film_id, title, inventory_id
from film as f
Left join inventory as i
On f.film_id = i.film_id
where inventory_id is null;

-- Right join
select inventory_id, inventory.film_id, title
from film 
Right join inventory 
On film.film_id = inventory.film_id;

-- Full join
select f.film_id, title, inventory_id
from film as f
full join inventory as i
On f.film_id = i.film_id;
