SELECT first_name
FROM actor;

-- last name with film title and language name orderder by descending and with rental rate > 1 -- 
SELECT customer.last_name, film.title, language.name
FROM customer
JOIN rental ON customer.customer_id=rental.customer_id
JOIN inventory ON rental.inventory_id=inventory.inventory_id
JOIN film ON inventory.film_id=film.film_id
JOIN language ON film.language_id=language.language_id
JOIN payment ON payment.customer_id=rental.customer_id
WHERE rental_rate > 1
ORDER BY amount DESC;



SELECT film.title, category.name
FROM category
JOIN film_category ON film_category.category_id=category.category_id
JOIN film ON film.film_id=film_category.film_id
GROUP BY film.title, category.name
HAVING count(film_id) > 65;

