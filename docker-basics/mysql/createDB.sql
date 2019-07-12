/* SQL file to perform following actons
  1. create user and set password
  2. create table employee and fill up with details
*/

CREATE DATABASE testDB;
use testDB;
create table employee (Name char(20),Dept char(20),jobTitle char(20));
INSERT INTO employee values ('Piyush Sharma','IT','Engg');
insert into employee values ('Wilma Flinstone','Finance','Analyst');
insert into employee values ('Barney Rubble','Sales','Manager');
insert into employee VALUES ('Betty Rubble','IT','Engg');
insert into employee VALUES ('Rocky Stein','IT','Engg');


