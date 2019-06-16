#problem 1
SELECT id, first_name, last_name, job_title
FROM employees AS e
ORDER BY e.id;

#problem 2
SELECT id,
	concat_ws(' ', `first_name`, `last_name`) AS `full_name`,
    job_title, salary
    FROM employees
    WHERE salary > 1000
    ORDER BY id;

#problem 3
UPDATE employees
SET salary = salary * 1.1
WHERE `job_title` = 'Therapist';

SELECT salary
FROM employees
ORDER BY salary ASC;

#problem 4
CREATE VIEW `v_hr_result_set` AS
SELECT * FROM employees
ORDER BY salary DESC LIMIT 1;
SELECT * FROM `v_hr_result_set`;

#problem 5
SELECT * FROM employees
WHERE department_id = 4
	AND salary >= 1600
    ORDER BY id;

#problem 6
DELETE FROM employees
WHERE department_id IN (1,2);

SELECT * FROM employees;
