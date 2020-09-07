CREATE TABLE `memberinfo` (
	`userId` VARCHAR(30) NOT NULL,
	`userPw` VARCHAR(30) NOT NULL,
	`userName` VARCHAR(30) NOT NULL,
	`userEmail` VARCHAR(100) NOT NULL,
	`userRegDate` DATETIME NULL DEFAULT '',
	PRIMARY KEY (`userId`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;