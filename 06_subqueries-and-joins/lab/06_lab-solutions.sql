#problem 1
SELECT e.`employee_id`,
	concat_ws(' ', e.`first_name`, e.`last_name`) AS `full_name`,
    d.`department_id`, d.`name` AS `department_name`
FROM employees e
INNER JOIN departments d
ON e.`employee_id` = d.`manager_id`
ORDER BY e.`employee_id` ASC
LIMIT 5;

#problem 2
SELECT a.town_id, t.`name` AS `town_name`, a.address_text
FROM addresses AS a
JOIN towns AS t ON a.town_id = t.town_id
WHERE t.`name` IN ('San Francisco', 'Sofia', 'Carnation')
ORDER BY a.town_id, a.address_id;

#problem 3
SELECT employee_id, first_name, last_name, department_id, salary
FROM employees
WHERE manager_id IS NULL;

#problem 4
SELECT COUNT(e.salary)
FROM employees AS e
WHERE e.salary > (SELECT AVG(e1.salary)
	FROM employees AS e1);

