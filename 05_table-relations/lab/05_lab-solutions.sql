#problem 1
CREATE TABLE mountains(
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE peaks(
	`id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `mountain_id` INT NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`mountain_id`)
		REFERENCES mountains(`id`)
);

#problem 2
SELECT v.driver_id,
	v.`vehicle_type`,
    concat_ws(' ', c.`first_name`, c.`last_name`)
		AS `driver_name`
FROM vehicles v
JOIN campers c
ON c.`id` = v.`driver_id`;

#problem 3
SELECT r.`starting_point` AS `route_starting_point`,
	r.`end_point` AS `route_ending_point`,
    r.`leader_id`,
    concat_ws(' ', c.`first_name`,
		c.`last_name`) AS `leader_name`
FROM routes r
JOIN campers c
ON r.`leader_id` = c.`id`;

#problem 4
CREATE TABLE mountains(
	`id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`id`)
);
CREATE TABLE peaks(
	`id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `mountain_id` INT NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`mountain_id`)
		REFERENCES mountains(`id`)
	ON DELETE CASCADE
);

#problem 5
CREATE TABLE projects(
	`id` INT NOT NULL AUTO_INCREMENT,
    `client_id` INT,
    `project_lead_id` INT,
    PRIMARY KEY (`id`)
);

CREATE TABLE clients(
	`id` INT NOT NULL AUTO_INCREMENT,
	`client_name` VARCHAR(50),
    `project_id` INT NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`project_id`)
		REFERENCES projects(`id`)
);

CREATE TABLE employees(
	`id` INT NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(30),
    `last_name` VARCHAR(30),
    `project_id` INT NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`project_id`)
		REFERENCES projects(`id`)
);

ALTER TABLE projects
ADD FOREIGN KEY (`client_id`)
	REFERENCES clients(`id`);

ALTER TABLE projects
ADD FOREIGN KEY (`project_lead_id`)
	REFERENCES projects(`id`);

