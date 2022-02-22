/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */
with bhs as (
    SELECT title from 
    (SELECT title, unnest(special_features) as "special_features"
     FROM film) AS "Features"
    WHERE "special_features" = 'Behind the Scenes'
),
trailer as (
    SELECT title from
    (SELECT title, unnest(special_features) as "special_features"
    FROM film) AS "Features"
    WHERE "special_features" = 'Trailers'
)
SELECT bhs.title from bhs,trailer where bhs.title = trailer.title ORDER BY bhs.title;
--SELECT DISTINCT title from bhs INNER JOIN trailer;
