CREATE TABLE `comment` (
	`cno` INT(11) NOT NULL AUTO_INCREMENT,
	`bno` INT(11) NOT NULL,
	`content` TEXT NOT NULL,
	`writer` VARCHAR(20) NOT NULL,
	`reg_date` DATETIME NOT NULL,
	PRIMARY KEY (`cno`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;