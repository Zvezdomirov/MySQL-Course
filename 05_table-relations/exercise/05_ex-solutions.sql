#problem 1

CREATE TABLE passports(
	`passport_id` INT NOT NULL AUTO_INCREMENT,
    `passport_number` CHAR(8) UNIQUE NOT NULL,
    PRIMARY KEY (`passport_id`)
);

ALTER TABLE passports
	AUTO_INCREMENT = 101;

CREATE TABLE persons(
	`person_id` INT NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(50) NOT NULL,
    `salary` FIXED(10, 2),
    `passport_id` INT UNIQUE NOT NULL,
    PRIMARY KEY (`person_id`),
    FOREIGN KEY (`passport_id`)
		REFERENCES passports(`passport_id`)
	ON DELETE CASCADE
);



INSERT INTO passports(`passport_number`)
VALUES ('N34FG21B'), ('K65LO4R7'), ('ZE657QP2');

INSERT INTO persons(`first_name`, `salary`, `passport_id`)
VALUES ('Roberto', '43300.00', 102), ('Tom', '56100.00', 103),
	('Yana', '60200.00', 101);

#problem 2
CREATE TABLE manufacturers(
	`manufacturer_id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `established_on` DATE NOT NULL,
    PRIMARY KEY (`manufacturer_id`)
);

CREATE TABLE models(
	`model_id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `manufacturer_id` INT NOT NULL,
    PRIMARY KEY (`model_id`),
    FOREIGN KEY (`manufacturer_id`)
		REFERENCES manufacturers(`manufacturer_id`)
	ON DELETE NO ACTION
    ON UPDATE NO ACTION
) AUTO_INCREMENT = 101;

INSERT INTO manufacturers (`name`, `established_on`)
VALUES ('BMW', '1916-03-01'),
	('Tesla', '2003-01-01'),
    ('Lada', '1966-05-01');

INSERT INTO models (`name`, `manufacturer_id`)
VALUES ('X1', 1),
	('i6', 1),
    ('Model S', 2),
    ('Model X', 2),
    ('Model 3', 2),
    ('Nova', 3);

#problem 3
CREATE TABLE students(
	`student_id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`student_id`)
);

CREATE TABLE exams(
	`exam_id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`exam_id`)
) AUTO_INCREMENT = 101;

CREATE TABLE students_exams(
	`student_id` INT NOT NULL,
    `exam_id` INT NOT NULL,
    FOREIGN KEY (`student_id`)
		REFERENCES students(`student_id`),
	FOREIGN KEY (`exam_id`)
		REFERENCES exams(`exam_id`)
	ON DELETE NO ACTION
    ON UPDATE NO ACTION
);	

INSERT INTO students (`name`)
VALUES ('Mila'), ('Toni'), ('Ron');

INSERT INTO exams(`name`)
VALUES ('Spring MVC'), ('Neo4j'),
	('Oracle 11g');

INSERT INTO students_exams(`student_id`, `exam_id`)
VALUES (1, 101), (1, 102), (2, 101),
	(3, 103), (2, 102), (2, 103);

#problem 4
CREATE TABLE teachers(
	`teacher_id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `manager_id` INT,
    PRIMARY KEY (`teacher_id`),
	FOREIGN KEY (`manager_id`)
		REFERENCES teachers(`teacher_id`)
)AUTO_INCREMENT = 101;

INSERT INTO teachers (`name`)
VALUES ('John'), ('Maya'), ('Silvia'), 
	('Ted'), ('Mark'), ('Greta');


UPDATE teachers
SET `manager_id` = (CASE WHEN `teacher_id` = 101 THEN NULL
						WHEN `teacher_id` = 102 THEN 106
                        WHEN `teacher_id` = 103 THEN 106
                        WHEN `teacher_id` = 104 THEN 105
                        WHEN `teacher_id` = 105 THEN 101
                        WHEN `teacher_id` = 106 THEN 101
					END);

#problem 6
CREATE TABLE majors(
	`major_id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(50) NOT NULL,
     PRIMARY KEY (`major_id`)
);

CREATE TABLE students(
	`student_id` INT NOT NULL AUTO_INCREMENT,
    `student_number` VARCHAR(12) NOT NULL,
    `student_name` VARCHAR(50) NOT NULL,
    `major_id` INT,
    PRIMARY KEY(`student_id`),
    FOREIGN KEY (`major_id`)
		REFERENCES majors(`major_id`)
	ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE payments(
	`payment_id` INT NOT NULL AUTO_INCREMENT,
    `payment_date` DATE NOT NULL,
    `payment_amount` DECIMAL(8, 2) NOT NULL,
	`student_id` INT NOT NULL,
    PRIMARY KEY (`payment_id`),
    FOREIGN KEY (`student_id`)
		REFERENCES students(`student_id`)
	ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE subjects(
	`subject_id` INT NOT NULL AUTO_INCREMENT,
    `subject_name` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`subject_id`)
);

CREATE TABLE agenda(
	`student_id` INT NOT NULL,
    `subject_id` INT NOT NULL,
    PRIMARY KEY (`student_id`, `subject_id`),
    FOREIGN KEY (`student_id`)
		REFERENCES students(`student_id`),
	FOREIGN KEY (`subject_id`)
		REFERENCES subjects(`subject_id`)
	ON DELETE CASCADE
    ON UPDATE CASCADE
);

#problem 5
CREATE TABLE cities(
	`city_id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`city_id`)
);

CREATE TABLE customers(
	`customer_id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `birthday` DATE,
    `city_id` INT NOT NULL,
    PRIMARY KEY (`customer_id`),
    FOREIGN KEY (`city_id`)
		REFERENCES cities(`city_id`)
	ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE orders(
	`order_id` INT NOT NULL AUTO_INCREMENT,
    `customer_id` INT NOT NULL,
    PRIMARY KEY (`order_id`),
    FOREIGN KEY (`customer_id`)
		REFERENCES customers (`customer_id`)
	ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE TABLE item_types(
	`item_type_id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`item_type_id`)
);

CREATE TABLE items(
	`item_id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `item_type_id` INT NOT NULL,
    PRIMARY KEY (`item_id`),
    FOREIGN KEY (`item_type_id`)
		REFERENCES item_types(`item_type_id`)
);

CREATE TABLE order_items(
	`order_id` INT NOT NULL,
    `item_id` INT NOT NULL,
  	PRIMARY KEY (`order_id`, `item_id`),
    FOREIGN KEY (`order_id`)
		REFERENCES orders(`order_id`),
	FOREIGN KEY (`item_id`)
		REFERENCES items(`item_id`)
);


#problem 9

SELECT m.`mountain_range`,
	p.`peak_name`, p.`elevation` AS `peak_elevation`
FROM peaks p
JOIN mountains m
ON m.`id` = p.`mountain_id`
WHERE m.`mountain_range` = 'Rila'
ORDER BY `peak_elevation` DESC;

#problem 10
