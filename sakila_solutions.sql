USE sakila;

-- 1. List all actors.
SELECT first_name, last_name FROM actor_info;

-- 2. Find the surname of the actor with the forename 'John'.
SELECT first_name, last_name FROM actor_info WHERE first_name = "John";

-- 3.  Find all actors with surname 'Neeson'.
SELECT first_name, last_name FROM actor_info WHERE last_name = "Neeson";

-- 4. Find all actors with ID numbers divisible by 10.
SELECT first_name, last_name FROM actor_info WHERE actor_id % 10 = 0;

-- 5. What is the description of the movie with an ID of 100?
SELECT description FROM film WHERE film_id = 100;

-- 6. Find every R-rated movie.
SELECT title FROM film WHERE rating = "R";

-- 7. Find every non-R-rated movie.
SELECT title FROM film WHERE rating != "R";

-- 8. Find the ten shortest movies.
SELECT title, length FROM film ORDER BY length ASC LIMIT 10;

-- 9. Find the movies with the longest runtime, without using LIMIT.
SELECT title, length FROM film WHERE length = (SELECT MAX(length) FROM film);

-- 10. Find all movies that have deleted scenes.
 SELECT title, special_features FROM film WHERE special_features LIKE "%deleted scenes%";
 
-- 11. Using HAVING, reverse-alphabetically list the last names that are not repeated.
SELECT last_name FROM actor GROUP BY last_name HAVING COUNT(*) = 1 ORDER BY last_name DESC;

-- 12. Using HAVING, list the last names that appear more than once, from highest to lowest frequency.
SELECT last_name, COUNT(*) FROM actor 
	GROUP BY last_name 
    HAVING COUNT(*) > 1 
    ORDER By COUNT(*) DESC;

-- 13. Which actor has appeared in the most films?
SELECT first_name, last_name 
FROM actor
INNER JOIN film_actor ON actor.actor_id = film_actor.actor_id
GROUP BY actor.actor_id
HAVING COUNT(film_actor.film_id) = (
	SELECT MAX(film_count)
    FROM (
		SELECT actor_id, COUNT(film_actor.film_id) AS film_count
		FROM film_actor
		GROUP BY actor_id
        ) AS subquery
    );
        
--  14. When is 'Academy Dinosaur' due?
SELECT rental_date 
FROM rental 
WHERE rental_id = (
	SELECT film_id FROM film WHERE title = "Academy Dinosaur"
    );
    
--  15. What is the average runtime of all films?
SELECT AVG(length) FROM film;

--  16. List the average runtime for every film category.
SELECT category.name FROM category
JOIN  

--     17. List all movies featuring a robot.
--     18. How many movies were released in 2010?
--     19. Find the titles of all the horror movies.
--     20. List the full name of the staff member with the ID of 2.
--     21. List all the movies that Fred Costner has appeared in.
--     22. How many distinct countries are there?
--     23. List the name of every language in reverse-alphabetical order.
--     24. List the full names of every actor whose surname ends with '-son' in alphabetical order by their forename.
--     25. Which category contains the most films?