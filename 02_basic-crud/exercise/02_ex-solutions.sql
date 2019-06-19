#problem 1
SELECT * FROM departments;

#problem 2
SELECT name FROM departments
ORDER BY department_id;

#problem 3
SELECT first_name, last_name, salary
FROM employees
ORDER BY employee_id;

#problem 4
SELECT first_name, middle_name, last_name
FROM employees
ORDER BY employee_id;

#problem 5
SELECT concat(`first_name`, '.', `last_name`,
	'@softuni.bg') AS `full_email_address`
    FROM employees;

#problem 6
SELECT salary AS Salary
	FROM (SELECT DISTINCT salary
		FROM employees) AS e
ORDER BY salary ASC;

#problem 7
SELECT * 
	FROM employees
WHERE job_title = 'Sales Representative'
ORDER BY employee_id;

#problem 8
SELECT first_name, last_name, job_title
FROM employees
WHERE salary BETWEEN 20000 AND 30000
ORDER BY employee_id;

#problem 9
SELECT concat_ws(' ', `first_name`,
				`middle_name`, `last_name`) AS `full_name`
FROM employees
WHERE salary IN (25000, 14000, 12500, 23600)
ORDER BY employee_id;

#problem 10
SELECT `first_name`, `last_name`
FROM employees
WHERE `manager_id` IS NULL
ORDER BY employee_id;

#problem 11
SELECT `first_name`, `last_name`, `salary`
FROM employees
WHERE salary > 50000
ORDER BY salary DESC;

#problem 12
SELECT `first_name`, `last_name`
FROM employees
ORDER BY salary DESC
LIMIT 5;

#problem 13
SELECT `first_name`, `last_name`
FROM employees
WHERE `department_id` != 4;

#problem 14
SELECT *
FROM employees
ORDER BY `salary` DESC,
	`first_name` ASC,
    `last_name` DESC,
    `middle_name` ASC;

#problem 15
CREATE VIEW `v_employees_salaries`
AS (SELECT `first_name`, `last_name`,
			`salary` 
		FROM employees);

#problem 16
CREATE VIEW `v_employees_job_titles`
AS (SELECT concat_ws(' ',  `first_name`,
					IFNULL(`middle_name`, ''),
                    `last_name`) AS `full_name`,
			`job_title`
	FROM employees);

#problem 17
SELECT `job_title`
FROM (SELECT DISTINCT `job_title`
	FROM employees) AS e
ORDER BY `job_title` ASC;

#problem 18
SELECT *
FROM `projects`
ORDER BY `start_date` ASC,
	`name` ASC,
    `project_id` ASC
LIMIT 10;

#problem 19
SELECT `first_name`, `last_name`, `hire_date`
FROM employees
ORDER BY `hire_date` DESC
LIMIT 7;

#problem 20
UPDATE employees
SET `salary` = salary * 1.12
WHERE `department_id` IN (1, 2, 4, 11);

SELECT salary
FROM employees;

#problem 21
SELECT `peak_name`
FROM peaks
ORDER BY `peak_name` ASC;

#problem 22
SELECT `country_name`, `population`
FROM countries
WHERE `continent_code` = 'EU'
ORDER BY `population` DESC,
	`country_name` ASC
LIMIT 30;

#problem 23
SELECT `country_name`, `country_code`,
		IF(`currency_code` = 'EUR', 'Euro', 'Not Euro') AS `currency`
FROM countries
ORDER BY `country_name` ASC;

#problem 24
SELECT `name`
FROM characters
ORDER BY `name` ASC;
