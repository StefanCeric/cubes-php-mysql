-- Napisati upit koji ispisuje gradove ali sa redom sledecim informacijama: naziv drzave, naziv regije, naziv grada
SELECT
    c.`name` AS country,
    s.`name` AS region,
    cit.`name` AS city
FROM
    countries AS c
JOIN 
    states AS s ON c.id = s.country_id
JOIN
    cities AS cit ON s.id = cit.state_id;

-- Napisati upit koji ispipsuje gradove koji imaju populaciju milion ili vise, sortiranim po populaciji opadajuce, sa sledecim informacijama: 
-- kratki kod zemlje, naziv zemlje, naziv grada, populacija
SELECT
    c.sortname AS country_code,
    c.`name` AS country,
    cit.`name` AS city,
    cit.population
FROM
    countries AS c
JOIN 
    states AS s ON c.id = s.country_id
JOIN
    cities AS cit ON s.id = cit.state_id
WHERE
    cit.population >= 1000000
ORDER BY
    cit.population DESC;

-- Napisati upit koji prikazuje gradove za koje nije uneta populacija (tj populacija je 0) sa kolonama: 
-- naziv drzave, naziv regije, naziv grada
SELECT
    c.`name` AS country,
    s.`name` AS region,
    cit.`name` AS city
FROM
    countries AS c
JOIN 
    states AS s ON c.id = s.country_id
JOIN
    cities AS cit ON s.id = cit.state_id
WHERE
    cit.population = 0;

-- Napisati upit koji prikazuje broj gradova za koje nije uneta populacija
SELECT
    COUNT(id) AS number_of_cities_with_zero_population_where_white_plague_rules_so_god_help_us
FROM
    cities
WHERE
    population = 0;

-- Napisati upit koji prikazuje regije zajedno sa brojem stanovnika u regiji, polja koja se prikazuju su: 
-- naziv drzave, naziv regije, broj stanovnika u regiji
-- Ako hocemo SVE regione onda LEFT JOIN states sa cities ali ce nam u koloni population biti null
SELECT
    c.`name` AS country,
    s.`name` AS region,
    SUM(cit.population) AS region_population
FROM
    countries AS c
JOIN 
    states AS s ON c.id = s.country_id
JOIN
    cities AS cit ON s.id = cit.state_id
GROUP BY
    s.id;


-- Napisati upit koji pronalazi 10 regija sa najvise stanovnika, polja koja se prikazuju su: 
-- naziv drzave, naziv regije, broj stanovnika u regiji
SELECT
    c.`name` AS country,
    s.`name` AS region,
    SUM(cit.population) AS region_population
FROM
    countries AS c
JOIN 
    states AS s ON c.id = s.country_id
JOIN
    cities AS cit ON s.id = cit.state_id
GROUP BY
    s.id
ORDER BY
    SUM(cit.population) DESC
LIMIT
    10;

-- Napisati upit koji pronalazi regije sa brojem stanovnika vecim od milion, polja koja se prikazuju su: 
-- naziv drzave, naziv regije, broj stanovnika u regiji
SELECT
    c.`name` AS country,
    s.`name` AS region,
    SUM(cit.population) AS region_population
FROM
    countries AS c
JOIN 
    states AS s ON c.id = s.country_id
JOIN
    cities AS cit ON s.id = cit.state_id
GROUP BY
    s.id
HAVING
    SUM(cit.population) > 1000000
ORDER BY
    SUM(cit.population) DESC;

-- Napisati upit koji pronalazi 5 regija sa najvise registrovanih gradova, polja koja se prikazuju su: 
-- naziv drzave, naziv regije, broj gradova u regiji
SELECT
    c.`name` AS country,
    s.`name` AS region,
    COUNT(cit.id) AS number_of_cities_in_region
FROM
    countries AS c
JOIN 
    states AS s ON c.id = s.country_id
JOIN
    cities AS cit ON s.id = cit.state_id
GROUP BY
    s.id
ORDER BY
    COUNT(cit.id) DESC
LIMIT
    5;

-- Napisati upit koji pronalazi regije sa nijednim unetim gradom (broj gradova je 0 !!!ili null!!!), polja koja se prikazuju su: 
-- naziv drzave, naziv regije, broj gradova u regiji
SELECT
    c.`name` AS country,
    s.`name` AS region,
    COUNT(cit.id) AS number_of_cities_in_region
FROM
    countries AS c
JOIN 
    states AS s ON c.id = s.country_id
LEFT JOIN
    cities AS cit ON s.id = cit.state_id
GROUP BY
    s.id
HAVING
    COUNT(cit.id) = 0;


-- Napisati upit koji pronalazi 5 regija sa najvise registrovanih gradova ciji naziv pocinje sa slovom 'r', polja koja se prikazuju su: 
-- naziv drzave, naziv regije, broj gradova u regiji
SELECT
    c.`name` AS country,
    s.`name` AS region,
    COUNT(cit.id) AS number_of_cities_that_begin_with_r
FROM
    countries AS c
JOIN 
    states AS s ON c.id = s.country_id
JOIN
    cities AS cit ON s.id = cit.state_id
WHERE
    cit.`name` LIKE 'r%'
GROUP BY
    s.id
ORDER BY
    COUNT(cit.id) DESC
LIMIT
    5;


-- Napisati upit koji pronalazi 5 regija sa najvise milionskih gradova (broje se gradovi sa populacijom vecom od milion), polja koja se prikazuju su: 
-- naziv drzave, naziv regije, broj gradova u regiji
SELECT
    c.`name` AS country,
    s.`name` AS region,
    COUNT(cit.id) AS number_of_cities_with_more_than_1mil_population
FROM
    countries AS c
JOIN 
    states AS s ON c.id = s.country_id
JOIN
    cities AS cit ON s.id = cit.state_id
WHERE
    cit.population > 1000000
GROUP BY
    s.id
ORDER BY
    COUNT(cit.id) DESC
LIMIT
    5;




-- Napisati upit koji pronalazi drzave koje imaju vise od 100 regija, polja koja se prikazuju su 
-- id drzave, kratki kod drzave, naziv drzave i broj regija
SELECT
    c.id AS country_id,
    c.sortname AS country_code,
    c.`name` AS country,
    COUNT(s.id) AS number_of_regions
FROM
    countries AS c
JOIN 
    states AS s ON c.id = s.country_id
GROUP BY
    c.id
HAVING
    COUNT(s.id) > 100
ORDER BY
    COUNT(s.id) DESC;


-- Napisati upit koji pronalazi drzave koje imaju vise od 10 regija ciji naziv pocinje sa slovom 'a', polja koja se prikazuju su 
-- id drzave, kratki kod drzave, naziv drzave i broj regija
SELECT
    c.id AS country_id,
    c.sortname AS country_code,
    c.`name` AS country,
    COUNT(s.id) AS number_of_regions_that_begin_on_a
FROM
    countries AS c
JOIN 
    states AS s ON c.id = s.country_id
WHERE
    s.`name` LIKE 'a%'
GROUP BY
    c.id
HAVING
    COUNT(s.id) > 10
ORDER BY
    COUNT(s.id) DESC;

-- Napisati upit koji prikazuje drzave zajedno sa njihovim brojem stanovnika, sortiranih po broju stanovnika opadajuce, polja koja se prikazuju su 
-- id drzave, kratki kod drzave, naziv drzave i broj stanovnika
-- FIN ZADATAK!!! Za malo da previdim left :)
SELECT
    c.id AS country_id,
    c.sortname AS country_code,
    c.`name` AS country,
    SUM(cit.population) AS population
FROM
    countries AS c
JOIN 
    states AS s ON c.id = s.country_id
LEFT JOIN
    cities AS cit ON s.id = cit.state_id
GROUP BY
    c.id
ORDER BY
    SUM(cit.population) DESC;

-- Napisati upit koji pronalazi drzave koje imaju vise od milion stanovnika, polja koja se prikazuju su 
-- id drzave, kratki kod drzave, naziv drzave i broj stanovnika
SELECT
    c.id AS country_id,
    c.sortname AS country_code,
    c.`name` AS country,
    SUM(cit.population) AS population
FROM
    countries AS c
JOIN 
    states AS s ON c.id = s.country_id
JOIN
    cities AS cit ON s.id = cit.state_id
GROUP BY
    c.id
HAVING
    SUM(cit.population) > 1000000
ORDER BY
    SUM(cit.population) DESC;

-- Napisati upit koji prikazuje prvih 5 drzava sa najvise milionskih gradova
SELECT
    c.`name` AS country,
    COUNT(cit.id) AS number_of_cities_with_more_than_1mil_population
FROM
    countries AS c
JOIN 
    states AS s ON c.id = s.country_id
JOIN
    cities AS cit ON s.id = cit.state_id
WHERE
    cit.population > 1000000
GROUP BY
    c.id
ORDER BY
    COUNT(cit.id) DESC
LIMIT
    5;