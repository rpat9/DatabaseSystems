USE movies;
-- add sql queries under the appropriate comment

-- exercise 1
SELECT title, release_year, rental_rate FROM film
WHERE rating = 'G'
ORDER BY title;

-- exercise 2
SELECT title, rating FROM film
WHERE length > 120;

-- exercise 3
SELECT title, rating, length FROM film
WHERE length < 60 AND rating = 'R'
ORDER BY title;

-- exercise 4
SELECT title, rental_rate, length FROM film
ORDER BY rental_rate, length;

-- exercise 5
SELECT DISTINCT rental_rate from film
ORDER BY rental_rate;