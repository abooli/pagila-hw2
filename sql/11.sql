/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */

SELECT DISTINCT first_name || ' ' || last_name as "Actor Name"
FROM 
(SELECT actor_id, unnest(special_features) as "special_features"
FROM film JOIN film_actor USING (film_id)) AS "actors"
JOIN actor USING (actor_id)
WHERE special_features = 'Behind the Scenes'
ORDER BY "Actor Name";

