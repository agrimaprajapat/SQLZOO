--QUESTION-1
--Show the name for the countries that have a population of at least 200 million.
SELECT name FROM world
WHERE population >= 200000000;


--QUESTION-2
--Give the name and the per capita GDP for those countries with a population of at least 200 million.
SELECT name, gdp/population
FROM world
WHERE population >= 200000000;


--QUESTION-3
--Show the name and population in millions for the countries of the continent 'South America'.
SELECT name, population/1000000
FROM world
WHERE continent = 'South America';


--QUESTION-4
--Show the name and population for France, Germany, and Italy.
SELECT name, population
FROM world
WHERE name IN ('France', 'Germany', 'Italy');


--QUESTION-5
--Show the countries which have a name that includes the word 'United'.
SELECT name
FROM world
WHERE name LIKE '%United%';


--QUESTION-6
--Show the countries that are big by area or by population.
SELECT name, population, area
FROM world
WHERE area > 3000000
   OR population > 250000000;


--QUESTION-7
--Show the countries that are big by area or big by population but not both.
SELECT name, population, area
FROM world
WHERE area > 3000000
XOR population > 250000000;


--QUESTION-8
--Show the name, population (in millions), and GDP (in billions) for South American countries.
SELECT name,
       ROUND(population/1000000, 2),
       ROUND(gdp/1000000000, 2)
FROM world
WHERE continent = 'South America';


--QUESTION-9
--Show the name and per-capita GDP for countries with a GDP of at least one trillion.
SELECT name,
       ROUND(gdp/population, -3)
FROM world
WHERE gdp >= 1000000000000;

--QUESTION-10
--Show the name and capital where both have the same number of characters.
SELECT name, capital
FROM world
WHERE LENGTH(name) = LENGTH(capital);


--QUESTION-11
--Show the name and capital where the first letters match,
--but the country name and capital are not the same.
SELECT name, capital
FROM world
WHERE LEFT(name, 1) = LEFT(capital, 1)
  AND name <> capital;


--QUESTION-12
--Find the country that has all the vowels and no spaces in the name.
SELECT name
FROM world
WHERE name LIKE '%a%'
  AND name LIKE '%e%'
  AND name LIKE '%i%'
  AND name LIKE '%o%'
  AND name LIKE '%u%'
  AND name NOT LIKE '% %';