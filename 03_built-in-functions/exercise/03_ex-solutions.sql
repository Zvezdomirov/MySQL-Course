#problem 1
SELECT `first_name`, `last_name`
FROM employees
WHERE LOWER(`first_name`) LIKE 'sa%';

#problem 2
SELECT `first_name`, `last_name`
FROM employees
WHERE LOWER(`first_name`) LIKE 'sa%';

#problem 3
SELECT `first_name`
FROM employees
WHERE `department_id` IN (3, 10)
	AND YEAR(`hire_date`) BETWEEN '1995' AND '2005'
ORDER BY `employee_id`;

#problem 4
SELECT `first_name`, `last_name`
FROM employees
WHERE LOCATE('engineer', LOWER(`job_title`)) <= 0
ORDER BY `employee_id`;

#problem 5
SELECT `name`
FROM towns
WHERE LENGTH(`name`) IN (5, 6)
ORDER BY `name` ASC;

#problem 6
SELECT `town_id`, `name`
FROM towns
WHERE LEFT(UPPER(`name`), 1) IN ('M', 'K', 'B', 'E')
ORDER BY `name` ASC;

#problem 7
SELECT `town_id`, `name`
FROM towns
WHERE LEFT(UPPER(`name`), 1) NOT IN ('R', 'B', 'D')
ORDER BY `name` ASC;

#problem 8
CREATE VIEW v_employees_hired_after_2000 AS
(SELECT first_name, last_name
FROM employees
WHERE year(hire_date) > '2000'
ORDER BY employee_id ASC);

#problem 9
SELECT `first_name`, `last_name`
	FROM employees
    WHERE LENGTH(`last_name`) = 5;

#problem 10
SELECT `country_name`, `iso_code`
FROM countries
WHERE LOWER(`country_name`) LIKE '%a%a%a%'
ORDER BY `iso_code`;

#problem 11
SELECT p.`peak_name`, r.`river_name`,
	lower(concat(p.`peak_name`, SUBSTRING(r.`river_name`, 2))) AS `mix`
FROM peaks AS p, rivers AS r
WHERE RIGHT(p.`peak_name`, 1) = LEFT(r.`river_name`, 1)
ORDER BY `mix` ASC;

#problem 12
SELECT `name`, date_format(`start`, '%Y-%m-%d')
FROM games
WHERE YEAR(`start`) IN (2011, 2012)
ORDER BY `start` ASC, `name` ASC
LIMIT 50;


#problem 13
SELECT `user_name`, 
	SUBSTRING(`email`, locate('@', `email`) + 1) AS `Email Provider`
FROM users
ORDER BY `Email Provider` ASC, `user_name` ASC;


#problem 14
SELECT `user_name`, `ip_address`
FROM users
WHERE `ip_address` LIKE '___.1%.%.___'
ORDER BY `user_name` ASC;


#problem 15
SELECT g.`name` AS `game`,
	IF(HOUR(g.`start`) BETWEEN 0 AND 11, 'Morning',
		IF(HOUR(g.`start`) BETWEEN 12 AND 17, 'Afternoon', 'Evening'))
        AS `Part of the Day`,
	IF(`duration` <= 3, 'Extra Short',
		IF(`duration` BETWEEN 4 AND 6, 'Short',
        IF(`duration` BETWEEN 7 AND 10, 'Long',
        'Extra Long'))) AS `Duration`
    FROM games AS g;

#problem 16
SELECT `product_name`, `order_date`,
	DATE_ADD(`order_date`, INTERVAL 3 DAY) AS `pay_due`,
	DATE_ADD(`order_date`, INTERVAL 1 MONTH) AS `deliver_due`
FROM orders;
