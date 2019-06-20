#problem 1
CREATE PROCEDURE usp_get_employees_salary_above_35000()
BEGIN
SELECT e.`first_name`, e.`last_name`
FROM employees e
WHERE e.`salary` > 35000
ORDER BY e.`first_name` ASC,
	e.`last_name` ASC,
    e.`employee_id` ASC;
END;

#problem 2
CREATE PROCEDURE usp_get_employees_salary_above(`number` INT)
BEGIN
SELECT e.`first_name`, e.`last_name`
FROM employees e
WHERE e.`salary` >= `number`
ORDER BY e.`first_name` ASC,
	e.`last_name` ASC,
    e.`employee_id` ASC;
END

#problem 3
CREATE PROCEDURE usp_get_towns_starting_with(`start_str` VARCHAR(20))
BEGIN
	SELECT t.`name`
    FROM towns t
    WHERE POSITION(`start_str` IN t.`name`) = 1
  	ORDER BY t.`name` ASC;
END

#problem 4
CREATE PROCEDURE usp_get_employees_from_town(`town_name` VARCHAR(20))
BEGIN
SELECT 
	e.`first_name`,
    e.`last_name`
FROM employees e
JOIN addresses a
ON e.`address_id` = a.`address_id`
JOIN towns t
ON a.`town_id` = t.`town_id`
WHERE t.`name` = `town_name`
ORDER BY e.`first_name` ASC,
	e.`last_name` ASC,
	e.`employee_id` ASC;
END;

#problem 5
CREATE FUNCTION ufn_get_salary_level(salary DOUBLE)
RETURNS VARCHAR(10)
BEGIN
    DECLARE s_level VARCHAR(10);
    SET s_level := (SELECT CASE
						WHEN salary < 30000 THEN 'Low'
                        WHEN salary BETWEEN 30000 AND 50000 THEN 'Average'
                        WHEN salary > 50000 THEN 'High'
                        END);
	RETURN s_level;
END;

#problem 6
CREATE FUNCTION ufn_get_salary_level(salary DOUBLE)
RETURNS VARCHAR(10)
BEGIN
    DECLARE s_level VARCHAR(10);
    SET s_level := (SELECT CASE
						WHEN salary < 30000 THEN 'Low'
                        WHEN salary BETWEEN 30000 AND 50000 THEN 'Average'
                        WHEN salary > 50000 THEN 'High'
                        END);
	RETURN s_level;
END;
CREATE PROCEDURE usp_get_employees_by_salary_level(level_of_salary VARCHAR(20))
BEGIN
SELECT 
	e.`first_name`,
    e.`last_name`
FROM employees e
WHERE 
	level_of_salary =
    (SELECT ufn_get_salary_level(e.`salary`))
ORDER BY e.`first_name` DESC,
	e.`last_name` DESC;
END;

#problem 7
CREATE FUNCTION ufn_is_word_comprised(set_of_letters varchar(50), word varchar(50))
RETURNS BOOLEAN
BEGIN

	SET @i = 1;
    iterate_through_word: 
    WHILE @i < LENGTH(word) DO
		IF LOCATE(SUBSTRING(word, @i, 1), set_of_letters) < 1
			THEN LEAVE iterate_through_word;
		ELSE SET @i = @i + 1;
	END IF;
    END WHILE;
    IF @i < LENGTH(word) THEN
		RETURN FALSE;
	ELSE RETURN TRUE;
    END IF;
END;

#problem 8
CREATE PROCEDURE usp_get_holders_full_name()
BEGIN
SELECT
	CONCAT_WS(' ', a.`first_name`, a.`last_name`) AS `full_name`
FROM account_holders a
ORDER BY `full_name` ASC,
	a.`id` ASC;
END;

#problem 9
CREATE PROCEDURE usp_get_holders_with_balance_higher_than(`number` INT)
BEGIN
SELECT 
	`first_name`,
    `last_name`
FROM (SELECT 
	ah.`first_name`,
    ah.`last_name`,
	SUM(a.`balance`) AS `account_total_balance`,
    ah.`id`
FROM accounts a
JOIN account_holders ah
ON a.`account_holder_id` = ah.`id`
GROUP BY a.`account_holder_id`) AS total_balance_table
WHERE total_balance_table.`account_total_balance` > `number`
ORDER BY `first_name` ASC,
	`last_name` ASC,
	`id` ASC;
END;

#problem 10
CREATE FUNCTION ufn_calculate_future_value(
	sum DOUBLE, yearly_interest_rate DOUBLE, number_of_years INT)
RETURNS DOUBLE
BEGIN

	SET @future_value = 
		sum * (POW((1 + yearly_interest_rate), number_of_years));
	RETURN @future_value;
END;

#problem 11
CREATE PROCEDURE usp_calculate_future_value_for_account(
	`account_id` INT, `interest_rate` DOUBLE)
BEGIN
	SELECT 
		a.`id` AS `account_id`,
		ah.`first_name`,
		ah.`last_name`,
		a.`balance` AS `current_balance`,
		ROUND(ufn_calculate_future_value(
			a.`balance`, `interest_rate`, 5), 4) AS `balance_in_5_years`
	FROM accounts a
	JOIN account_holders ah
	ON a.`account_holder_id` = ah.`id`
    WHERE a.`id` = `account_id`;
END;

#problem 12
CREATE PROCEDURE usp_deposit_money(account_id INT, money_amount DECIMAL(10, 4))
BEGIN
	START TRANSACTION;
    IF (money_amount <= 0) THEN
		ROLLBACK;
	ELSE
		UPDATE accounts a
		SET a.`balance` = a.`balance` + 10
		WHERE a.`id` = account_id;
		COMMIT;
	END IF;
END;

#problem 13
CREATE PROCEDURE usp_withdraw_money(account_id INT, money_amount DECIMAL(10, 4))
BEGIN
	START TRANSACTION;
    SET @current_balance = (SELECT balance
							FROM accounts
                            WHERE id = account_id);
    IF (money_amount > @current_balance) THEN
		ROLLBACK;
	ELSE
		UPDATE accounts a
		SET a.`balance` = a.`balance` - money_amount
		WHERE a.`id` = account_id;
		COMMIT;
	END IF;
END;


