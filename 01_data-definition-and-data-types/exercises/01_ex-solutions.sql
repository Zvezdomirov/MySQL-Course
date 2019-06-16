#problem 1
CREATE TABLE minions(
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50) NOT NULL,
age INT NOT NULL
);

CREATE TABLE towns(
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50) NOT NULL
);

#problem 6
CREATE TABLE people(
	id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL,
    picture BLOB(2),
    height FLOAT(2),
    weight FLOAT(2),
    gender ENUM('m', 'f') NOT NULL,
    birthdate DATE NOT NULL,
    biography LONGTEXT
    );

INSERT INTO people(name, gender, birthdate)
VALUES ('Pesho','m', '1998/06/10'),
	('Gosho', 'm', '1998/07/10'),
	('Misho', 'f', '1998/08/10'),
	('Tisho', 'm', '1998/09/10'),
	('Shisho', 'm', '1998/10/10');

#problem 7
CREATE TABLE users(
	id BIGINT NOT NULL AUTO_INCREMENT,
    username VARCHAR(30)
        CHARACTER SET hebrew
        COLLATE hebrew_general_ci NOT NULL,
	password VARCHAR(50)
        CHARACTER SET hebrew
        COLLATE hebrew_general_ci NOT NULL,
    profile_picture BLOB(600),
    last_login_time TIME,
    is_deleted BOOLEAN,
    PRIMARY KEY (id)
);


INSERT INTO users(username, password)
VALUES ('Pesho', 'trudnaParola1'),
	('Gosho', 'trudnaParola2'),
	('Misho', 'trudnaParola3'),
	('Tisho', 'trudnaParola4'),
	('Shisho', 'trudnaParola5');

#problem 8
UPDATE users
SET last_login_time = NOW();

#problem 9
ALTER TABLE users
MODIFY COLUMN last_login_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

#problem 10
ALTER TABLE users
MODIFY COLUMN id INT NOT NULL;

ALTER TABLE users
DROP PRIMARY KEY;

ALTER TABLE users
MODIFY COLUMN username CHAR(30) UNIQUE;

ALTER TABLE users
MODIFY COLUMN id INT PRIMARY KEY AUTO_INCREMENT;

#problem 11

CREATE TABLE directors(
	id INT NOT NULL AUTO_INCREMENT,
    `director_name` VARCHAR(50) NOT NULL,
    `notes` TINYTEXT,
    PRIMARY KEY (id)
);

CREATE TABLE genres(
	id INT NOT NULL AUTO_INCREMENT,
    `genre_name` VARCHAR(50) NOT NULL,
    `notes` TINYTEXT,
    PRIMARY KEY (id)
);

CREATE TABLE categories(
	`id` INT NOT NULL AUTO_INCREMENT,
    `category_name` VARCHAR(50) NOT NULL,
    `notes` TINYTEXT,
    PRIMARY KEY (id)
);

CREATE TABLE movies(
	`id` INT NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(50) NOT NULL,
    `director_id` INT NOT NULL,
    `copyright_year` YEAR NOT NULL,
    `length` TIME NOT NULL,
    `genre_id` INT NOT NULL,
    `category_id` INT NOT NULL,
    `rating` FLOAT(2) NOT NULL,
    `notes` TINYTEXT,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`director_id`) 
		REFERENCES directors(`id`),
    FOREIGN KEY (`genre_id`) 
		REFERENCES genres(`id`),
    FOREIGN KEY (`category_id`) 
		REFERENCES categories(`id`)
);

INSERT INTO directors (director_name)
VALUES ('Pesho'), ('Gosho'), ('Misho'), 
('Tisho'), ('Shisho');

INSERT INTO genres (genre_name)
VALUES ('Action'), ('Comedy'), ('Triller'), 
('Horror'), ('Drama');

INSERT INTO categories (category_name)
VALUES ('Good'), ('Bad'), ('Meh'), 
('Niiiiice'), ('Holy shit, it\'s amazing');

INSERT INTO movies (title, director_id, copyright_year,
	length, genre_id, category_id, rating)
VALUES ('Qk film 1', 1, '1998','1:31', 1, 1, 1),
	('Qk film 2', 2, '1998', '1:20', 2, 2, 2),
    ('Qk film 3', 3, '1997', '1:10', 3, 3, 3),
    ('Qk film 4', 4, '1996', '1:40', 4, 4, 4),
    ('Qk film 5', 5, '1995', '1:50', 5, 5, 5);

#problem 12
CREATE TABLE categories(
	`id` INT NOT NULL AUTO_INCREMENT,
    `category` VARCHAR(50) NOT NULL,
    `daily_rate` FLOAT(2) NOT NULL,
    `weekly_rate` FLOAT(2) NOT NULL,
    `monthly_rate` FLOAT(2) NOT NULL,
    `weekend_rate` FLOAT(2) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE cars(
	`id` INT NOT NULL AUTO_INCREMENT,
    `plate_number` VARCHAR(15) NOT NULL,
    `make` VARCHAR(50) NOT NULL,
    `model` VARCHAR(50) NOT NULL,
    `car_year` YEAR NOT NULL,
    `category_id` INT NOT NULL,
    `doors` ENUM('2', '3', '4') NOT NULL,
	`picture` MEDIUMBLOB,
    `car_condition` ENUM('New', 'Used') NOT NULL,
    `available` BOOLEAN NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`category_id`)
		REFERENCES categories(`id`)
);

CREATE TABLE employees(
	`id` INT NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(50) NOT NULL,
    `last_name` VARCHAR(50) NOT NULL,
    `title` VARCHAR(50) NOT NULL,
    `notes` TINYTEXT,
    PRIMARY KEY(`id`)
);


CREATE TABLE customers(
	`id` INT NOT NULL AUTO_INCREMENT,
    `driver_licence_number` INT NOT NULL,
    `full_name` VARCHAR(100) NOT NULL,
    `address` TINYTEXT,
    `city` VARCHAR(50) NOT NULL,
    `zip_code` INT NOT NULL,
    `notes` TINYTEXT,
    PRIMARY KEY (`id`)
);
CREATE TABLE rental_orders (
`id` INT NOT NULL AUTO_INCREMENT,
`employee_id` INT NOT NULL,
`customer_id` INT NOT NULL,
`car_id` INT NOT NULL,
`car_condition` ENUM ('New', 'Used') NOT NULL,
`tank_level` ENUM
	('Empty', 'Half-full', 'Full') NOT NULL,
`kilometrage_start` BIGINT,
`kilometrage_end` BIGINT,
`total_kilometrage` BIGINT NOT NULL,
`start_date` DATE,
`end_date` DATE,
`total_days` INT NOT NULL,
`rate_applied` FLOAT(2) NOT NULL,
`tax_rate` FLOAT(2) NOT NULL,
`order_status` ENUM
	('Not started', 'In process', 'Finished'),
`notes` TINYTEXT,
PRIMARY KEY(`id`),
FOREIGN KEY(`employee_id`)
	REFERENCES `employees`(`id`),
FOREIGN KEY(`customer_id`)
	REFERENCES `customers`(`id`),
FOREIGN KEY(`car_id`)
	REFERENCES `cars`(`id`)
);
INSERT INTO categories
	(`category`, `daily_rate`,
    `weekly_rate`, `monthly_rate`,
    `weekend_rate`)
VALUES ('Expensive', 1.1, 1.1, 1.1, 1.1),
	('Medium class', 2.1, 2.1, 2.1, 2.1),
    ('Cheap', 3.1, 3.1, 3.1, 3.1);

INSERT INTO cars
	(`plate_number`, `make`, `model`,
    `car_year`, `category_id`, `doors`,
    `car_condition`, `available`)
VALUES ('1234ab', 'Mercedes', 'CLS-250',
	'2016', 1, '4', 'New', 1),
    ('1235bb', 'Mitsubishi', 'good one',
	'2012', 2, '2', 'New', 0),
    ('1234zz', 'VolksWagen', 'Golf',
	'2016', 3, '4', 'Used', 1);

INSERT INTO employees(`first_name`, `last_name`,
						`title`)
VALUES ('Pesho', 'Peshov', 'Cashier'),
	('Gosho', 'Petkov', 'Manager'),
    ('Misho', 'Petrov', 'Consultant');

INSERT INTO customers(`driver_licence_number`,
						`full_name`, `city`, `zip_code`)
VALUES ('12345', 'Pesho Mitkov', 'Sofia', '1215'),
	('12346', 'Petko Minkov', 'Plovdiv', '1214'),
    ('12347', 'Zlati Zlatev', 'Ruse', '1213');



INSERT INTO rental_orders(`employee_id`, `customer_id`,
							`car_id`, `car_condition`,
                            `tank_level`, `total_kilometrage`,
                            `total_days`, `rate_applied`,
                            `tax_rate`)
VALUES (1, 1, 1, 'New', 'Full', 100, 2, 1.5, 2),
	(2, 2, 2, 'Used', 'Full', 120, 1, 1, 2),
	(3, 3, 3, 'New', 'Empty', 200, 3, 2, 3);

#problem 13
CREATE TABLE employees(
	`id` INT NOT NULL AUTO_INCREMENT,
	`first_name` VARCHAR(50) NOT NULL,
    `last_name` VARCHAR(50) NOT NULL,
    `title` VARCHAR(50) NOT NULL,
    `notes` TINYTEXT,
    PRIMARY KEY(`id`)
);


CREATE TABLE customers(
	`account_number` INT NOT NULL AUTO_INCREMENT,
	`first_name` VARCHAR(50) NOT NULL,
    `last_name` VARCHAR(50) NOT NULL,
    `phone_number` VARCHAR(20) NOT NULL,
    `emergency_name` VARCHAR(50),
    `emergency_number` VARCHAR(50),
    `notes` TINYTEXT,
    PRIMARY KEY(`account_number`)
);

CREATE TABLE room_status(
	`room_status` ENUM 
		('free', 'occupied') NOT NULL,
	`notes` TINYTEXT,
  	PRIMARY KEY (`room_status`)
);

CREATE TABLE room_types(
	`room_type` VARCHAR(50) UNIQUE NOT NULL,
    `notes` TINYTEXT,
    PRIMARY KEY (`room_type`)
);


CREATE TABLE bed_types(
	`bed_type` VARCHAR(50) UNIQUE NOT NULL,
    `notes` TINYTEXT,
    PRIMARY KEY (`bed_type`)
);

CREATE TABLE rooms(
	`room_number` INT NOT NULL,
    `room_type` VARCHAR(50) UNIQUE NOT NULL,
    `bed_type` VARCHAR(50) UNIQUE NOT NULL,
    `rate` FLOAT(2),
    `room_status` ENUM ('free', 'occupied'),
    `notes` TINYTEXT,
    PRIMARY KEY (`room_number`),
    FOREIGN KEY (`room_type`)
		REFERENCES room_types(`room_type`),
	FOREIGN KEY (`bed_type`)
		REFERENCES bed_types(`bed_type`),
  	FOREIGN KEY (`room_status`)
  		REFERENCES room_status(`room_status`)
);

CREATE TABLE payments(
	`id` INT NOT NULL AUTO_INCREMENT,
	`employee_id` INT NOT NULL,
    `payment_date` DATE NOT NULL,
    `account_number` INT NOT NULL,
    `first_date_occupied` DATE,
	`last_date_occupied` DATE,
    `total_days` INT NOT NULL,
    `amount_charged` FLOAT(2) NOT NULL,
    `tax_rate` FLOAT(2),
    `tax_amount` FLOAT(2),
    `payment_total` FLOAT(2) NOT NULL,
	`notes` TINYTEXT,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`employee_id`)
		REFERENCES employees(`id`),
    FOREIGN KEY (`account_number`)
		REFERENCES customers(`account_number`)
    );

CREATE TABLE occupancies(
	`id` INT NOT NULL AUTO_INCREMENT,
    `employee_id` INT NOT NULL,
    `date_occupied` DATE NOT NULL,
    `account_number` INT NOT NULL,
    `room_number` INT NOT NULL,
    `rate_applied` FLOAT(2),
	`phone_charge` FLOAT(2),
    `notes` TINYTEXT,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`employee_id`)
		REFERENCES employees(`id`),
    FOREIGN KEY (`room_number`)
		REFERENCES rooms(`room_number`),
    FOREIGN KEY (`account_number`)
		REFERENCES customers(`account_number`)
    );

INSERT INTO employees (first_name, last_name, title)
VALUES ('Pesho', 'Petkov', 'Cleaner'),
	('Misho', 'Peshov', 'Manager'),
	('Tisho', 'Petrov', 'Receptionist');

INSERT INTO customers (account_number, first_name, last_name, phone_number)
VALUES (123, 'Pesho', 'Mishev', '08888888'),
	(124, 'Petko', 'Mitev', '08888887'),
	(125, 'Petar', 'Milev', '08888886');

INSERT INTO room_status (room_status)
VALUES ('free'), ('occupied');

INSERT INTO room_types (room_type)
VALUES ('Good'), ('Bad'), ('Dirty');

INSERT INTO bed_types (bed_type)
VALUES ('Spingy'), ('Comfy'), ('Hard');

INSERT INTO rooms (room_number, room_type, bed_type, room_status)
VALUES (123, 'Good', 'Spingy', 'free'),
	(124, 'Bad', 'Hard', 'occupied'),
	(125, 'Dirty', 'Comfy', 'free');

INSERT INTO payments (employee_id, payment_date,
					account_number, total_days, 
                    amount_charged, payment_total)
VALUES (1, '2018-03-12', 123, 10, 1500, 1600),
	(2, '2018-04-12', 124, 9, 1400, 1500),
	(3, '2018-05-12', 125, 8, 1300, 1400);

INSERT INTO occupancies (employee_id, date_occupied, account_number, room_number)
VALUES (1, '2018-03-12', 123, 123),
	(2, '2018-04-12', 124, 124),
	(3, '2018-05-12', 125, 125);

#problem 14
CREATE TABLE towns(
	`id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE addresses(
	`id` INT NOT NULL AUTO_INCREMENT,
    `address_text` TINYTEXT NOT NULL,
    `town_id` INT NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY (`town_id`)
		REFERENCES towns(`id`)
);

CREATE TABLE departments(
	`id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE employees(
	`id` INT NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(50) NOT NULL,
    `middle_name` VARCHAR(50),
    `last_name` VARCHAR(50) NOT NULL,
    `job_title` VARCHAR(50) NOT NULL,
    `department_id` INT NOT NULL,
    `hire_date` DATE NOT NULL,
    `salary` FLOAT(2) NOT NULL,
    `address_id` INT NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY (`department_id`)
		REFERENCES departments(`id`),
	FOREIGN KEY (`address_id`)
		REFERENCES addresses(`id`)
);

#problem 15
INSERT INTO towns(`name`)
VALUES ('Sofia'), ('Plovdiv'),
('Varna'), ('Burgas');

INSERT INTO departments(`name`)
VALUES ('Engineering'),
('Sales'),
('Marketing'),
('Software Development'),
('Quality Assurance');

ALTER TABLE employees
MODIFY COLUMN `address_id` INT;

INSERT INTO employees (`first_name`, `middle_name`,
						`last_name`, `job_title`,
						`department_id`, `hire_date`,
                        `salary`)
VALUES ('Ivan', 'Ivanov', 'Ivanov',
		'.NET Developer', 4, '2013-02-01',3500),
        ('Petar', 'Petrov', 'Petrov',
		'Senior Engineer', 1, '2004-03-02', 4000),
        ('Maria', 'Petrova', 'Ivanova',
		'Intern', 5, '2016-08-28', 525.25),
        ('Georgi', 'Terziev', 'Ivanov',
		'CEO', 2, '2007-12-09', 3000),
        ('Peter', 'Pan', 'Pan',
		'Intern', 3, '2016-08-28', 599.88);

#problem 16
SELECT *
FROM towns;
SELECT *
FROM departments;
SELECT *
FROM employees;

#problem 17
SELECT *
FROM towns
ORDER BY `name` ASC;
SELECT *
FROM departments
ORDER BY `name` ASC;
SELECT *
FROM employees
ORDER BY `salary` DESC;

#problem 18
SELECT name
FROM towns
ORDER BY `name` ASC;
SELECT name
FROM departments
ORDER BY `name` ASC;
SELECT first_name, last_name, job_title, salary
FROM employees
ORDER BY `salary` DESC;

#problem 19
UPDATE employees
SET `salary` = `salary` * 1.1;

SELECT salary
FROM employees;

#problem 20
UPDATE payments
SET tax_rate = tax_rate * 0.97;

SELECT tax_rate
FROM payments;

#problem 21
TRUNCATE TABLE occupancies;
