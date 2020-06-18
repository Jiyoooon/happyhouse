CREATE TABLE `noticelist` (
	`bookno`	int 	PRIMARY KEY,
    `userid`   VARCHAR(20)    NOT NULL,
    `username`   VARCHAR(20)    NOT NULL,
	`subject`	VARCHAR(100) 	NOT NULL,
	`context`	VARCHAR(1000) 	NOT NULL,
	`looked`		int,
	`date` 	TIMESTAMP		NOT NULL DEFAULT current_timestamp,
	FOREIGN KEY (`userid`) REFERENCES `member` (`userid`)
);