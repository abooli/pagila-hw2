/*
 * Management is planning on purchasing new inventory.
 * Films with special features cost more to purchase than films without special features,
 * and so management wants to know if the addition of special features impacts revenue from movies.
 *
 * Write a query that for each special_feature, calculates the total profit of all movies rented with that special feature.
 *
 * HINT:
 * Start with the query you created in pagila-hw1 problem 16, but add the special_features column to the output.
 * Use this query as a subquery in a select statement similar to answer to the previous problem.
 */

SELECT special_feature, sum(amount) as "profit"
FROM 
(SELECT p.amount, unnest(special_features) as "special_feature" from payment p, rental r, inventory i, film f where p.rental_id = r.rental_id and r.inventory_id = i.inventory_id and i.film_id = f.film_id) as "Profits"
GROUP BY "special_feature"
ORDER BY "special_feature";

