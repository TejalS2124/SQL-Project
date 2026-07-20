 CREATE TABLE DR332
 (
	Lernerid int primary key,
    frist_name varchar(50) not null,
    last_name varchar(50) unique,
    progress decimal(5,2) check(progress > 75),
    branch varchar(50) default "Dadar"
    );
    alter table DR332 add address varchar(50);
    select*from DR332;
    alter table dadar332 rename to DADAR332;
    select * from dadar332;
    alter table DADAR332 rename column frist_name to first_name;
    select * from DADAR332;
    alter table DADAR332 rename to Dadar332;