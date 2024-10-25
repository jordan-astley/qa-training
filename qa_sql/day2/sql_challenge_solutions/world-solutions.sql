USE world;

--  1. Using COUNT, get the number of cities in the USA.
SELECT COUNT(*) FROM city
WHERE CountryCode = "USA";

--  2. Find out the population and life expectancy for people in Argentina.
SELECT population, LifeExpectancy FROM country WHERE Name = "Argentina";


--  3. Using IS NOT NULL, ORDER BY, and LIMIT, which country has the highest life expectancy?
SELECT LifeExpectancy, Name FROM country
WHERE lifeexpectancy IS NOT NULL
ORDER BY LifeExpectancy DESC
LIMIT 1;

-- 4. Using JOIN ... ON, find the capital city of Spain.
SELECT city.name FROM city
INNER JOIN country ON city.id = country.capital
WHERE country.name = "Spain";

-- 5. Using JOIN ... ON, list all the languages spoken in the Southeast Asia region.
SELECT country.name, countrylanguage.language FROM country
INNER JOIN countrylanguage ON country.code = countrylanguage.countrycode
WHERE country.region = "Southeast Asia";

-- 6. Using a single query, list 25 cities around the world that start with the letter F.
SELECT name FROM city
WHERE name LIKE "F%"
LIMIT 25;

-- 7. Using COUNT and JOIN ... ON, get the number of cities in China.
SELECT COUNT(DISTINCT city.id) FROM city
INNER JOIN country ON city.countrycode = country.code
WHERE country.name = "China";

-- 8. Using IS NOT NULL, ORDER BY, and LIMIT, which country has the lowest population? Discard non-zero populations.
SELECT population, name FROM country
WHERE population IS NOT NULL AND population = 0
ORDER BY population ASC
LIMIT 5;

-- 9. Using aggregate functions, return the number of countries the database contains.
SELECT COUNT(country.code) FROM country;

-- 10. What are the top ten largest countries by area?
SELECT name FROM country
ORDER BY surfacearea DESC
LIMIT 10;

-- 11. List the five largest cities by population in Japan.
SELECT city.name FROM city
JOIN country ON city.CountryCode = country.code
WHERE country.name = "Japan"
ORDER BY city.population DESC
LIMIT 5;

-- 12. List the names and country codes of every country with Elizabeth II as its Head of State. You will need to fix the mistake first!
SET SQL_SAFE_UPDATES=0;
UPDATE country
SET headofstate = "Elizabeth II"
WHERE headofstate = "Elisabeth II";
SET SQL_SAFE_UPDATES=1;

SELECT country.name, country.code, country.headofstate FROM country
WHERE country.headofstate = "Elizabeth II";
