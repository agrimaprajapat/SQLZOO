--QUESTION-1
--Find the country that start with Y
SELECT name FROM world
  WHERE name LIKE 'Y%'

  --QUESTION-2
  --Find the countries that end with y
  SELECT name FROM world
  WHERE name LIKE '%Y'


--QUESTION-3
--Find the countries that contain the letter x
SELECT name FROM world
  WHERE name LIKE '%X%'

--QUESTION-4
--Find the countries that end with land
SELECT name FROM world
  WHERE name LIKE '%land'

--QUESTION-5
--Find the countries that start with C and end with ia
SELECT name FROM world
  WHERE name LIKE 'c%%ia'

--QUESTION-6
--Find the country that has oo in the name
SELECT name FROM world
  WHERE name LIKE '%oo%'


--QUESTION-7
--Find the countries that have three or more a in the name
SELECT name FROM world
  WHERE name LIKE '%a%a%a%'

--QUESTION-8
--Find the countries that have "t" as the second character.
SELECT name FROM world
 WHERE name LIKE '_t%'
ORDER BY name

--QUESTION-9
--Find the countries that have two "o" characters separated by two others.
SELECT name FROM world
 WHERE name LIKE '%o__o%'

--QUESTION-10
--Find the countries that have exactly four characters.
SELECT name FROM world
 WHERE name LIKE '____'

--QUESTION-11
--Find the country where the name is the capital city.
SELECT name
  FROM world
 WHERE name=capital


--QUESTION-12
--Find the country where the capital is the country plus "City".
SELECT name
  FROM world
 WHERE capital = concat(name, ' City');

 --QUESTION-13
 --Find the capital and the name where the capital includes the name of the country.
 select capital, name 
from world 
where capital like concat('%',name,'%')

--QUESTION-14
--Find the capital and the name where the capital is an extension of name of the country.
select capital, name 
from world 
where capital like concat(name,'%')AND capital <> name;

--QUESTION-15
--Show the name and the extension where the capital is a proper (non-empty) extension of name of the country.
SELECT name,
       SUBSTRING(capital, LENGTH(name) + 1) AS extension
FROM world
WHERE capital LIKE CONCAT(name, '%')
  AND capital != name;