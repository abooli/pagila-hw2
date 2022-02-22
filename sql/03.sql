/*
 * Management wants to send coupons to customers who have previously rented one of the top-5 most profitable movies.
 * Your task is to list these customers.
 *
 * HINT:
 * In problem 16 of pagila-hw1, you ordered the films by most profitable.
 * Modify this query so that it returns only the film_id of the top 5 most profitable films.
 * This will be your subquery.
 * 
 * Next, join the film, inventory, rental, and customer tables.
 * Use a where clause to restrict results to the subquery.
 */
select distinct r.customer_id 
FROM rental r, inventory i 
WHERE r.inventory_id = i.inventory_id and i.film_id in 
(select f.film_id from payment p, rental r, inventory i, film f where p.rental_id = r.rental_id and r.inventory_id = i.inventory_id and i.film_id = f.film_id group by f.film_id order by sum(p.amount) desc limit 5) 
ORDER BY r.customer_id;

