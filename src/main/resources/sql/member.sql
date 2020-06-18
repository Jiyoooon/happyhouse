
DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `userid` varchar(16) NOT NULL,
  `userpwd` varchar(20) NOT NULL,
  `username` varchar(16) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `tel` varchar(100) DEFAULT NULL,
  `isadmin` varchar(13) DEFAULT NULL,
 
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



INSERT INTO `member` VALUES ('admin','admin','관리자','admin@ssafy.com','010-1234-1234','true'
),('ssafy','ssafy','김싸피','ssafy@ssafy.com','010-1111-1111','false');

