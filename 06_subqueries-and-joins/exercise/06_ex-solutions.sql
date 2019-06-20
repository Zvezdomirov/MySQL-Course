#problem 1
SELECT e.employee_id, e.job_title, e.address_id, a.address_text
FROM employees AS e
LEFT JOIN addresses AS a ON e.address_id = a.address_id
ORDER BY address_id ASC
LIMIT 5;

#problem 2
SELECT e.first_name, e.last_name, t.`name` AS `town`, a.address_text
FROM employees AS e
LEFT JOIN addresses AS a ON e.address_id = a.address_id
LEFT JOIN towns AS t ON a.town_id = t.town_id
ORDER BY first_name, last_name ASC
LIMIT 5;

#problem 3
SELECT e.employee_id, e.first_name, e.last_name, d.`name` AS `department_name`
FROM employees AS e
JOIN departments AS d ON e.department_id = d.department_id
WHERE d.`name` = 'Sales'
ORDER BY e.employee_id DESC;

#problem 4
SELECT e.employee_id, e.first_name,
	e.salary, d.`name` AS `department_name`
FROM employees AS e
RIGHT JOIN departments AS d ON e.department_id = d.department_id
WHERE salary > 15000
ORDER BY d.department_id DESC
LIMIT 5;

#problem 5
SELECT e.employee_id, e.first_name
FROM employees AS e
LEFT JOIN employees_projects AS ep ON e.employee_id = ep.employee_id
WHERE ep.project_id IS NULL
ORDER BY e.employee_id DESC
LIMIT 3;

#problem 6
SELECT e.`first_name`, e.`last_name`,
	e.`hire_date`, d.`name` AS `dept_name`
FROM employees e
JOIN departments d
ON e.`department_id` = d.`department_id`
WHERE e.`hire_date` > '1999-01-01'
	AND d.`name` IN ('Sales', 'Finance')
ORDER BY e.`hire_date` ASC;

#problem 7
SELECT e.`employee_id`, e.`first_name`,
		ewp.`project_name`
FROM employees e
JOIN (SELECT ep.`employee_id`,
	ep.`project_id`, p.`name` AS `project_name`,
    p.`start_date`, p.`end_date`
FROM employees_projects ep
JOIN projects p
ON ep.project_id = p.project_id
WHERE p.`start_date` > '2002-08-13'
	AND p.`end_date` IS NULL) AS ewp
ON e.`employee_id` = ewp.`employee_id`
ORDER BY e.`first_name` ASC,
	ewp.`project_name` ASC;

#problem 8
SELECT
	e.`employee_id`,
	e.`first_name`,
    IF (YEAR(p.`start_date`) > 2004,
		NULL, p.`name`) AS `project_name`
FROM employees e
JOIN employees_projects ep
ON ep.`employee_id` = e.`employee_id`
	AND e.`employee_id` = 24
JOIN projects p
ON p.`project_id` = ep.`project_id`
ORDER BY `project_name` ASC;

#problem 9
SELECT e.`employee_id`, e.`first_name`,
	e.`manager_id`, m.`first_name` AS `manager_name`
FROM employees e
JOIN employees m
ON e.`manager_id` = m.`employee_id`
WHERE e.`manager_id` IN (3, 7)
ORDER BY e.`first_name` ASC;

#problem 10
SELECT e.`employee_id`,
	concat_ws(' ', e.`first_name`, e.`last_name`) AS `employee_name`,
	concat_ws(' ', m.`first_name`, m.`last_name`) AS `manager_name`,
    d.`name` AS `department_name`
FROM employees e
JOIN employees m
ON e.`manager_id` = m.`employee_id`
JOIN departments d
ON e.`department_id` = d.`department_id`
WHERE e.`manager_id` IS NOT NULL
ORDER BY e.`employee_id` ASC
LIMIT 5;

#problem 11
SELECT MIN(s.`avg_salary`) AS `min_average_salary`
FROM (SELECT AVG(e.`salary`) AS `avg_salary`
		FROM `employees` AS e
        GROUP BY e.`department_id`) AS s

#problem 12
SELECT mc.`country_code`, m.`mountain_range`,
	p.`peak_name`, p.`elevation`
FROM peaks p
JOIN mountains m
ON p.`mountain_id` = m.`id`
JOIN mountains_countries mc
ON p.`mountain_id` = mc.`mountain_id`
WHERE mc.`country_code` = 'BG'
	AND p.`elevation` > 2835
ORDER BY p.`elevation` DESC;

#problem 13
SELECT mc.`country_code`,
	COUNT(mc.`mountain_id`) AS `mountain_range`
FROM mountains_countries mc
GROUP BY mc.`country_code`
HAVING mc.`country_code` IN ('BG', 'RU', 'US')
ORDER BY `mountain_range` DESC;

#problem 14
SELECT c.`country_name`,
	r.`river_name`
FROM countries c
left JOIN countries_rivers cr
ON cr.`country_code` = c.`country_code`
JOIN continents cont
ON c.`continent_code` = cont.`continent_code` 
left JOIN rivers r
ON cr.`river_id` = r.`id`
WHERE cont.`continent_name` = 'Africa'
ORDER BY c.`country_name` ASC
LIMIT 5;

#problem 16
SELECT COUNT(c.`country_code`) AS `country_count`
FROM countries c
LEFT JOIN mountains_countries mc
ON c.`country_code` = mc.`country_code`
LEFT JOIN mountains m
ON mc.`mountain_id` = m.`id`
WHERE `mountain_id` IS NULL;

#problem 17
SELECT 
    c.`country_name`,
    fpj.`highest_peak_elevation`,
    lrl.`longest_river_length`
FROM
    (SELECT 
        MAX(hp.`max_peak`) AS `highest_peak_elevation`,
            mc.`country_code`
    FROM
        (SELECT 
        p.`mountain_id`, MAX(p.`elevation`) AS `max_peak`
    FROM
        peaks p
    GROUP BY p.`mountain_id`) AS hp
    JOIN mountains_countries mc ON mc.`mountain_id` = hp.`mountain_id`
    GROUP BY mc.country_code) AS fpj
        JOIN
    countries c ON c.`country_code` = fpj.`country_code`
        JOIN
    (SELECT 
        c.`country_name`, frj.`longest_river_length`
    FROM
        (SELECT 
        MAX(lr.`max_length`) AS `longest_river_length`,
            cr.`country_code`
    FROM
        (SELECT 
        r.`id`, MAX(r.`length`) AS `max_length`
    FROM
        rivers r
    GROUP BY r.`id`) AS lr
    JOIN countries_rivers cr ON cr.`river_id` = lr.`id`
    GROUP BY cr.country_code) AS frj
    JOIN countries c ON c.`country_code` = frj.`country_code`) AS lrl ON lrl.country_name = c.country_name
ORDER BY `highest_peak_elevation` DESC,
	`longest_river_length` DESC,
    c.`country_name` ASC
LIMIT 5;


