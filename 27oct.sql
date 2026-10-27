create database abcd;

use abcd;


CREATE TABLE Employeess (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Department VARCHAR(30),
    Salary DECIMAL(10,2),
    Experience INT,
    City VARCHAR(30)
);


INSERT INTO Employeess VALUES
(1, 'Aman', 'IT', 45000, 3, 'Jaipur'),
(2, 'Riya', 'HR', 35000, 2, 'Sikar'),
(3, 'Karan', 'IT', 60000, 5, 'Jaipur'),
(4, 'Neha', 'Finance', 50000, 4, 'Delhi'),
(5, 'Rohit', 'HR', 30000, 1, 'Jaipur'),
(6, 'Pooja', 'IT', 55000, 4, 'Delhi'),
(7, 'Arjun', 'Finance', 65000, 6, 'Sikar'),
(8, 'Simran', 'HR', 40000, 3, 'Delhi'),
(9, 'Vikas', 'Finance', 45000, 2, 'Jaipur'),
(10, 'Anjali', 'IT', 70000, 7, 'Sikar');




-- Level 1 -- BASIC AGGREGATE FUNCTIONS

-- 1. Find the total number of employees.


select count(*) from employeess;


-- 2. Calculate the total salary of all employees.
select sum(salary) as total from employeess;


-- 3. Find the average salary of employees.
select avg(salary) as mean from employeess;


-- 4. Find the highest salary.
select max(salary) as higest_salary  from employeess;



-- 5. Find the lowest salary.
select min(salary) as lowest_salary  from employeess;



-- 6. Count the number of employees working in the IT department.
select count(empid) as counts from employeess
where department = "IT";



-- 7. Calculate the average experience of all employees.
select avg(experience) as average from employeess;

-- 8. Find the difference between the highest and lowest salary.
select max(salary) - min(salary) as difference from employeess;

-- 9. Count how many employees live in Jaipur.
select count(empid) as total from employeess
where city = "Jaipur";



-- 10. Find the total salary of employees living in Delhi.
select sum(salary) as total from employeess
where city = "Delhi";



-- Level 3 — GROUP BY

-- 11. Count the number of employees in each department.
select department,count(empid) as  total_ep from employeess
group by department;



-- 12. Calculate the total salary paid by each department.
select department,sum(salary) as  total_sy from employeess
group by department;



-- 13. Find the average salary for each department.
select department,avg(salary) as  total_sy from employeess
group by department;


-- 14. Find the maximum salary in each department.

select department,max(salary) as  maximum_salary from employeess
group by department;

-- 15. Find the minimum salary in each department.
select department,min(salary) as  minimum_salary from employeess
group by department;

-- 16. Calculate the average experience of employees in each department.
select department,avg(experience) as  avg_experience from employeess
group by department;



-- 17. Count employees in each city.
select city,count(*) as total_ep from employeess
group by city;



-- 18. Calculate the total salary paid to employees in each city.
select city,sum(salary) as  total_salary from employeess
group by city;



-- 19. Find the average salary for each city.
select city,avg(salary) as  avg_salary from employeess
group by city;

-- 20. Display the department-wise employee count and total salary.
select department , count(*) as count_,sum(salary) as total_salary
from employeess
group by department;




-- Level 2 — WHERE with aggregate functions

-- 21. Find the average salary of employees earning more than ₹40,000.
select avg(salary) as avg_slary from employeess
where salary > 40000;




-- 22. Calculate the total salary of IT employees.
select sum(salary) as total_salary from employeess
where department = "IT";


-- 23. Find the highest salary among employees with more than 3 years of experience.
select max(salary) as highest from employeess
where experience > 3;



-- 24. Count employees whose salary is at least ₹40,000.
select count(*) as emp from employeess
where salary >= 40000;



-- 25. Find the average salary of employees living in Jaipur.
select avg(salary) as avg_salary from employeess 
where city = "Jaipur";


-- 26. Find the minimum salary among HR employees.
select min(salary) as lowerst from employeess
where  department ="HR";


-- 27. Calculate the total salary of employees with 5 or more years of experience.

select sum(salary) as total from employeess
where experience >= 5;


-- 28. Count employees in the Finance department who live in Jaipur.
select count(*) as totalep from employeess
where department = "Finance" and city = "Jaipur";

