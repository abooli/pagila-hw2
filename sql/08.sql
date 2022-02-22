/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 * Order the results alphabetically.
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */
 select title from (select title, unnest(special_features) as "Special Features" from film where rating = 'G') as "Titles"  where "Special Features" = 'Trailers';
