USE movies;
-- add sql queries under the appropriate comment

-- exercise 1
SELECT COUNT(DISTINCT replacement_cost) FROM film;

-- exercise 2
SELECT COUNT(last_name) FROM actor 
WHERE last_name LIKE "H%";

-- exercise 3
SELECT MAX(replacement_cost) as most_expensive FROM film;

-- exercise 4
SELECT MAX(length) as longest_G_movie FROM film 
WHERE rating = 'G';

-- exercise 5
SELECT DISTINCT replacement_cost, COUNT(film_id) as number_of_movies FROM film
GROUP BY replacement_cost
ORDER BY replacement_cost;

-- exercise 6
SELECT DISTINCT replacement_cost, COUNT(film_id) as number_of_movies FROM film
GROUP BY replacement_cost
HAVING COUNT(film_id) > 50
ORDER BY number_of_movies DESC;

-- exercise 7
SELECT actor_id FROM film_actor WHERE film_id = (
    SELECT film_id FROM film WHERE title = "HURRICANE AFFAIR"
);

-- exercise 8
SELECT first_name, last_name FROM actor 
WHERE actor_id IN (
    SELECT actor_id FROM film_actor WHERE film_id = 26
)
ORDER BY last_name;
