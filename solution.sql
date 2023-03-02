-- Lab 2.07
USE sakila;

-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT c.name, COUNT(f.film_id) AS count
FROM sakila.category c
JOIN sakila.film_category f
ON c.category_id = f.category_id
GROUP BY c.name
ORDER BY count DESC;


-- 2. Display the total amount rung up (sales) by each staff member in August of 2005.
SELECT s.username, SUM(p.amount) AS Sales 
FROM sakila.staff s 
JOIN sakila.payment p 
USING (staff_id)
WHERE p.payment_date LIKE '2005-08%'
GROUP BY s.username
ORDER BY Sales DESC;

-- 3. Which actor has appeared in the most films?
SELECT a.first_name, a.last_name, COUNT(DISTINCT f.film_id) AS count
FROM sakila.actor a 
JOIN sakila.film_actor f 
USING (actor_id)
GROUP BY a.first_name, a.last_name
ORDER BY count DESC;

-- 4. Most active customer (the customer that has rented the most number of films)
SELECT c.first_name, c.last_name, COUNT(DISTINCT r.rental_id) AS count
FROM sakila.customer c 
JOIN sakila.rental r 
USING (customer_id)
GROUP BY c.first_name, c.last_name
ORDER BY count DESC;

-- 5. Display the first and last names, as well as the address, of each staff member.
SELECT s.first_name, s.last_name, a.address
FROM sakila.staff s 
JOIN sakila.address a 
USING (address_id);


-- 6. List each film and the number of actors who are listed for that film.
SELECT f.title AS film_title, COUNT(a.actor_id) AS count
FROM sakila.film f 
JOIN sakila.film_actor a 
USING (film_id)
GROUP BY f.title;


-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT c.first_name, c.last_name, SUM(p.amount) AS total_paid
FROM sakila.customer c 
JOIN sakila.payment p 
USING (customer_id)
GROUP BY c.first_name, c.last_name
ORDER BY c.last_name DESC;


-- 8. List number of films per category.
SELECT c.name, COUNT(f.film_id) AS number_of_films
FROM sakila.category c 
JOIN sakila.film_category f 
USING (category_id)
GROUP BY c.name;

