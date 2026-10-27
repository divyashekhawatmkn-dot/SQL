show databases;
use world;

show tables;
create table Students(
Student_ID INT PRIMARY KEY,
Student_Name VARCHAR(50) NOT NULL,
Age INT CHECK(Age >= 18),
Email VARCHAR(60) UNIQUE,
Course_Name VARCHAR(30) NOT NULL,
Marks INT check (marks between 0 and 100));
drop table Students;
alter table students modify column marks int ;









INSERT INTO Students values
(101, 'Monu', 25,'monukumar@gmail.com','Python',99),
(102,'dev',20,'devrajput@gmail.com','SQL',89),
(103,'Karsan',19,'karsan@gmail.com','Powerbi',67),
(104,'Rajat',19,'rajat@gamil.com','Data',90),
(105,'Raju',26,'rajusingh@gmail.com','python',68),
(106,'viond',23,'vinod@gamil.com','SQL',98),
(107,'Kalu',33,'kaluram@gamil.com','Datascince',88),
(108,'Ramu',35,'ramudev@gmail.com','Powerbi',45);


update students 
set student_name = 'ramukaka' where student_name = 'ramu';
select * from Students ;

CREATE TABLE Departments(
Dept_id INT PRIMARY KEY,
Dept_Name VARCHAR(100) NOT NULL UNIQUE,
Location VARCHAR(90) NOT NULL,
Budget INT CHECK(Budget > 0));


INSERT INTO Departments values
(101,'HR','Sikar',10000),
(102,'Finance','Jaipur',20000),
(103,'Marketing','Fatehpur',30000),
(104,'IT','Delhi',50000),
(105,'OD','Jodhpur',45000);

CREATE TABLE Employees(
Employee_id INT PRIMARY KEY,
Employee_Name VARCHAR(100) NOT NULL,
Email VARCHAR(100) UNIQUE,
Salary INT CHECK(Salary > 0),
FOREIGN KEY (Dept_ID) REFERENCES Departments(Dept_ID)
);



INSERT INTO Employees values
(101, 'Sonu','sonusingh@gmail.com',30000,1),
(102,'Harsh','harsh@gmail.com',80000,2),
(103,'Devkaran','devkaransingh@gamil.com',45000,3),
(104,'keshav','keshavswami@gamil.com',5000,4),
(105,'Devil','devil@gamil.com',40000,5),
(106,'Raju','rajusingh@gamil.com',70000,6),
(107,'Ashok','ashoksingh@gmail.com',2000,7),
(108,'Dev','devsingh@gamil.com',90000,80),
(109,'Mandeep','mandeep@gmail.com',70000,9),
(110,'Devraj','devraj@gmail.com',75000,10);



-- create database xyz;
-- use xyz;

-- delete database xyz;
-- drop database xyz;

create table students (
student_id int primary key,
name varchar(50),
class int,
section varchar(10) not null,
FOREIGN KEY (str_id) REFERENCES sports(str_id));

insert into students (
student_id, name, class, section, str_id)
values
(1001,'Ramukaka',5,'D',8);


create table sports(
Name varchar(50),
section varchar(10) not null,
period int,
FOREIGN KEY (str_id) REFERENCES students(str_id));

insert into sports(
Name,section,period,str_id)
values
('ramukaka','D',7,8);


