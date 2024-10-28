USE movies;
-- add sql queries under the appropriate comment

-- exercise 1
SELECT first_name, last_name FROM actor
JOIN film_actor USING (actor_id)
WHERE film_actor.film_id = 443
ORDER BY last_name;

-- exercise 2
SELECT film_id FROM film_category
JOIN category USING (category_id)
WHERE category.name = 'Horror'
ORDER BY film_id;

-- exercise 3
SELECT CONCAT(first_name, ' ', last_name) as name FROM actor
JOIN film_actor USING (actor_id)
WHERE film_actor.film_id = 188
ORDER BY last_name;

-- exercise 4
SELECT title, c.name FROM film_actor
JOIN film_category USING (film_id)
JOIN category c USING (category_id)
WHERE film.rating = 'G'
ORDER BY title;

-- exercise 5
SELECT COUNT(film_id) as number_of_films, c.name as category_name FROM film_category
JOIN category c USING (category_id)
GROUP BY c.name;

-- exercise 6
CREATE VIEW g_films AS 
SELECT * FROM film
WHERE rating = 'G';

-- exercise 7 (note: your solution should be either -- horizontal or -- vertical)
-- horizontal