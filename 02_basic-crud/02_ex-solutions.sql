#problem 1
SELECT * FROM departments
ORDER BY department_id ASC;

#problem 2
SELECT `name` FROM departments
ORDER BY department_id ASC;

#problem 3
SELECT first_name, last_name, salary FROM employees
ORDER BY employee_id ASC;

#problem 4
SELECT first_name, middle_name, last_name FROM employees
ORDER BY employee_id ASC;

#problem 5
SELECT concat(first_name, '.',last_name, '@softuni.bg') AS full_email_address FROM employees
ORDER BY employee_id ASC;

#problem 6
SELECT DISTINCT salary FROM employees
ORDER BY salary ASC;

#problem 7
SELECT * FROM employees
WHERE job_title = 'Sales Representative'
ORDER BY employee_id ASC;

#problem 8
SELECT first_name, last_name, job_title FROM employees
WHERE salary BETWEEN 20000 AND 30000
ORDER BY employee_id ASC;

#problem 9

