#problem 1
SELECT `department_id`,
	COUNT(`id`) AS `Number of employees`
FROM employees
GROUP BY `department_id`
ORDER BY `department_id` ASC,
	`Number of employees` ASC;

#problem 2
SELECT `department_id`,
	ROUND(AVG(`salary`), 2) AS `Average salary`
FROM employees
GROUP BY (`department_id`)
ORDER BY `department_id`

#problem 3
SELECT e.`department_id`,
	ROUND(MIN(e.`salary`), 2) AS `Min salary`
FROM employees AS e
GROUP BY (e.`department_id`)
HAVING `Min salary` > 800
ORDER BY e.`department_id`;

#problem 4
SELECT COUNT(`category_id`) AS `Number of appetizers`
FROM products
WHERE `category_id` = 2 AND `price` > 8
GROUP BY `category_id`;

#problem 5
SELECT `category_id`,
	ROUND(AVG(`price`), 2) AS `Average Price`,
    ROUND(MIN(`price`), 2) AS `Cheapest Product`,
    ROUND(MAX(`price`), 2) AS `Most Expensive Product`
FROM products
GROUP BY `category_id`;

