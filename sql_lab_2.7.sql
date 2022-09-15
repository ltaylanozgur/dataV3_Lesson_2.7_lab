USE sakila;

-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.
SELECT COUNT(f.film_id) AS 'num_film', c.name AS 'film_name'
FROM category c
LEFT JOIN film_category f
ON c.category_id = f.category_id
GROUP BY name;


-- 2. Display the total amount rung up by each staff member in August of 2005.
SELECT CONCAT(s.first_name,' ',s.last_name) AS 'staff_name', SUM(p.amount) AS 'total_amount'
FROM staff s
JOIN payment p
ON s.staff_id = p.staff_id
WHERE p.payment_date BETWEEN '2005-08-01 00:00:00' AND '2005-08-31 23:59:59'
GROUP BY s.first_name;


-- 3. Which actor has appeared in the most films?
SELECT CONCAT(a.first_name,' ',a.last_name) AS 'actor_name', COUNT(f.film_id) AS num_films
FROM actor a
JOIN film_actor f
ON a.actor_id = f.actor_id
GROUP BY a.actor_id 
ORDER BY num_films DESC
LIMIT 1; 

-- 4. Most active customer (the customer that has rented the most number of films)
SELECT CONCAT(c.first_name,' ',c.last_name) AS 'customer_name', COUNT(r.rental_id) AS num_films
FROM customer c
JOIN rental r
ON c.customer_id = r.customer_id
GROUP BY c.customer_id
ORDER BY num_films DESC
LIMIT 1;

-- 5. Display the first and last names, as well as the address, of each staff member.
SELECT CONCAT(s.first_name,' ',s.last_name) AS 'staff_name', CONCAT(a.address, ' ',a.district,' ',a.city_id,' ',a.postal_code) AS 'primary_address', a.address2 AS 'secondary_address'
FROM staff s
JOIN address a
ON s.address_id = a.address_id
GROUP BY s.first_name;

-- 6. List each film and the number of actors who are listed for that film.
SELECT f.title AS 'film', COUNT(a.actor_id) AS 'num_actors'
FROM film f
JOIN film_actor a
ON f.film_id = a.film_id
GROUP BY f.film_id
ORDER BY f.film_id ASC;

-- 7. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
SELECT CONCAT(c.first_name,' ',c.last_name) AS 'customer_name', SUM(p.amount) AS 'total_paid'
FROM payment p
JOIN customer c
ON p.customer_id = c.customer_id
GROUP BY c.first_name
ORDER BY c.last_name;

-- 8. List number of films per category.
SELECT COUNT(f.film_id) AS 'num_film', c.name AS 'film_name'
FROM category c
LEFT JOIN film_category f
ON c.category_id = f.category_id
GROUP BY name;