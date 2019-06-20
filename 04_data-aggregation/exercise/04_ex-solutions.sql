#problem 1
SELECT COUNT(`id`)
FROM wizzard_deposits


#problem 2
SELECT MAX(`magic_wand_size`) AS `longest_magic_wand`
FROM wizzard_deposits


#problem 3
SELECT `deposit_group`, 
	MAX(`magic_wand_size`) AS `longest_magic_wand`
FROM wizzard_deposits
GROUP BY `deposit_group`
ORDER BY `longest_magic_wand` ASC,
	`deposit_group` ASC;

#problem 4
SELECT `deposit_group`
FROM wizzard_deposits
GROUP BY `deposit_group`
ORDER BY AVG(`magic_wand_size`)
LIMIT 1;


#problem 5
SELECT `deposit_group`,
	SUM(`deposit_amount`) AS `total_sum`
FROM wizzard_deposits
GROUP BY `deposit_group`
ORDER BY `total_sum`;

#problem 6
SELECT `deposit_group`,
	SUM(`deposit_amount`) AS `total_sum`
FROM wizzard_deposits
WHERE `magic_wand_creator` = 'Ollivander family'
GROUP BY `deposit_group`
ORDER BY `deposit_group` ASC;

#problem 7
SELECT `deposit_group`,
	SUM(`deposit_amount`) AS `total_sum`
FROM wizzard_deposits
WHERE `magic_wand_creator` = 'Ollivander family'
GROUP BY `deposit_group`
HAVING `total_sum` < 150000
ORDER BY `total_sum` DESC;

#problem 8
SELECT `deposit_group`, `magic_wand_creator`,
	MIN(`deposit_charge`) AS `min_deposit_charge`
FROM wizzard_deposits
GROUP BY `deposit_group`, `magic_wand_creator`
ORDER BY `magic_wand_creator` ASC, `deposit_group` ASC;

#problem 9
SELECT CASE 
	WHEN w.`age` BETWEEN 0 AND 10 THEN '[0-10]'
    WHEN w.`age` BETWEEN 11 AND 20 THEN '[11-20]'
    WHEN w.`age` BETWEEN 21 AND 30 THEN '[21-30]'
    WHEN w.`age` BETWEEN 31 AND 40 THEN '[31-40]'
    WHEN w.`age` BETWEEN 41 AND 50 THEN '[41-50]'
    WHEN w.`age` BETWEEN 51 AND 60 THEN '[51-60]'
    ELSE '[61+]'
    END AS `age_group`, COUNT(w.`id`) AS `wizzard_count`
FROM wizzard_deposits AS w
GROUP BY `age_group`
ORDER BY `wizzard_count`;

#problem 10
SELECT LEFT(`first_name`, 1) AS `first_letter`
FROM wizzard_deposits
WHERE `deposit_group` = 'Troll Chest'
GROUP BY `first_letter`
ORDER BY `first_letter` ASC;

#problem 11
SELECT `deposit_group`, `is_deposit_expired`,
	AVG(`deposit_interest`) AS `average_interest`
FROM wizzard_deposits
WHERE `deposit_start_date` > '1985/01/01'
GROUP BY `is_deposit_expired`, `deposit_group`
ORDER BY `deposit_group` DESC,
		`is_deposit_expired` ASC;

#problem 13
SELECT `department_id`,
	MIN(`salary`) AS `minimum_salary`
FROM `employees`
WHERE `hire_date` > '2000/01/01' AND
	`department_id` IN (2, 5, 7)
GROUP BY `department_id`
ORDER BY `department_id` ASC;

#problem 14
CREATE TABLE `high_paid_employees`
AS (SELECT * FROM employees
    WHERE `salary` > 30000);
DELETE FROM high_paid_employees
WHERE `manager_id` = 42;
UPDATE `high_paid_employees`
SET `salary` = `salary` + 5000
WHERE `department_id` = 1;
SELECT `department_id`,
	AVG(`salary`) AS `average_salary`
FROM high_paid_employees
GROUP BY `department_id`
ORDER BY `department_id` ASC;

#problem 15
SELECT `department_id`,
	MAX(`salary`) AS `max_salary`
FROM employees
GROUP BY `department_id`
HAVING `max_salary` NOT BETWEEN 30000 AND 70000
ORDER BY `department_id` ASC;

#problem 16
SELECT COUNT(`salary`)
FROM employees
WHERE `manager_id` IS NULL
GROUP BY `manager_id`

#problem 17
SELECT `department_id`,
	SUM(`salary`) AS `total_salary`
FROM employees
GROUP BY `department_id`
ORDER BY `department_id` ASC;

#problem 19
SELECT `department_id`,
	SUM(`salary`) AS `total_salary`
FROM employees
GROUP BY `department_id`
ORDER BY `department_id` ASC;
