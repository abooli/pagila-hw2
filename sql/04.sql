/*
 * Select the titles of all films that the customer with customer_id=1 has rented more than 1 time.
 *
 * HINT:
 * It's possible to solve this problem both with and without subqueries.
 */
SELECT f.title FROM customer c, rental r, inventory i, film f 
WHERE c.customer_id = r.customer_id and 
      r.inventory_id = i.inventory_id and 
      i.film_id = f.film_id and c.customer_id = 1 
GROUP BY f.title 
HAVING count(f.title) > 1;
