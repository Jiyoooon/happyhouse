
create table area_intrest(
   `area_userid` varchar(20) not null,
    `area_sido` varchar(10) not null,
    `area_gugun` varchar(10) not null,
    `area_dong` varchar(30),
    primary key(`area_userid`, `area_sido`, `area_gugun`, `area_dong`),
    CONSTRAINT `area_intrest_fk1` FOREIGN KEY (`area_userid`) REFERENCES `member` (`userid`) on delete cascade,
    CONSTRAINT `area_intrest_fk2` FOREIGN KEY (`area_sido`) REFERENCES `sidocode` (`sido_code`) on delete cascade,
    CONSTRAINT `area_intrest_fk3` FOREIGN KEY (`area_gugun`) REFERENCES `guguncode` (`gugun_code`) on delete cascade
);