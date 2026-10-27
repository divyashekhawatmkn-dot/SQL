
CREATE DATABASE company_practice;
USE company_practice;

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10,2),
    experience INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(80),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    employee_id INT,
    product_id INT,
    sales_amount DECIMAL(10,2),
    sale_date DATE,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

INSERT INTO Departments VALUES
(1,'IT','Jaipur'),
(2,'HR','Delhi'),
(3,'Sales','Mumbai'),
(4,'Finance','Jaipur'),
(5,'Marketing','Delhi');

INSERT INTO Employees VALUES
(101,'Aarav',1,70000,5),
(102,'Priya',1,85000,7),
(103,'Rahul',1,85000,6),
(104,'Neha',2,55000,4),
(105,'Karan',2,60000,5),
(106,'Simran',3,50000,3),
(107,'Vikram',3,75000,8),
(108,'Anjali',3,65000,6),
(109,'Rohan',4,90000,10),
(110,'Meera',4,80000,7),
(111,'Ishita',5,58000,4),
(112,'Dev',5,62000,5);

INSERT INTO Products VALUES
(201,'Laptop','Electronics',70000),
(202,'Mouse','Electronics',1200),
(203,'Keyboard','Electronics',2500),
(204,'Office Chair','Furniture',12000),
(205,'Desk','Furniture',18000),
(206,'Notebook','Stationery',300),
(207,'Pen Set','Stationery',500),
(208,'Monitor','Electronics',22000);

INSERT INTO Sales VALUES
(1,101,201,70000,'2026-01-05'),
(2,102,208,22000,'2026-01-08'),
(3,103,201,70000,'2026-01-12'),
(4,106,204,12000,'2026-01-15'),
(5,107,205,18000,'2026-01-18'),
(6,108,202,1200,'2026-01-20'),
(7,109,201,70000,'2026-02-02'),
(8,110,208,22000,'2026-02-05'),
(9,111,203,2500,'2026-02-10'),
(10,112,205,18000,'2026-02-12'),
(11,107,201,70000,'2026-02-15'),
(12,108,204,12000,'2026-02-18'),
(13,102,205,18000,'2026-03-01'),
(14,103,208,22000,'2026-03-04'),
(15,109,201,70000,'2026-03-10'),
(16,110,203,2500,'2026-03-12'),
(17,101,208,22000,'2026-03-15'),
(18,107,204,12000,'2026-03-18'),
(19,111,206,300,'2026-03-20'),
(20,112,207,500,'2026-03-22');




-- 1. Find the total salary paid by each department. Display the department name and total salary.


select department_name , sum(salary) as total
from departments as d
join employees as e
on d.department_id = e.department_id 
group by department_name;

-- 2. Find departments whose average employee salary is greater than 65,000.

select department_name , avg(salary) as avg_salary
from departments as d
join employees as e
on d.department_id = e.department_id 
group by department_name
having avg(salary) > 65000;


-- 3. Find the employees whose salary is greater than the overall average salary of all employees.

select employee_name ,salary 
from employees 
where salary > (select avg(salary) from employees);


-- 4. Find the employee(s) who receive the highest salary in the company.

select employee_name,salary
from (select employee_name,
	salary,
    rank() over(order by salary desc) as rankk
    from employees)as b
    where rankk = 1;
    


select employee_name , max(salary) as higest
from employees 
group by employee_name
order by higest desc
limit 1 offset 1;

-- 5. Find employees who earn more than ANY employee working in the HR department.

select employee_name ,salary 
from employees
where salary >any (select salary from employees as e
                   join departments as d
                   on e.department_id = d.department_id
                   where department_name = "HR");
                   
                   
-- 6. Find employees who earn more than ALL employees working in the Sales department.

select employee_name ,salary 
from employees
where salary >all (select salary from employees as e
                   join departments as d
                   on e.department_id = d.department_id
                   where department_name = 'sales');
                   
                   
                   
-- 7. Rank all employees by salary from highest to lowest using RANK(). Display employee name, salary, and rank.
 select employee_name,
salary,
rank() over(order by salary desc ) as rankk
from employees;
                   
                   
-- 8. Rank employees within each department according to salary using DENSE_RANK().
select employee_name , department_name ,salary,
dense_rank() over(partition by department_name order by salary desc) as rankk
from employees as e
 join departments as d
 on e.department_id = d.department_id;
 
 
 -- 9. Assign a unique row number to employees within each department, ordered by salary from high
 select employee_name , department_name ,salary,
row_number() over(partition by department_name order by salary desc) as rankk
from employees as e
 join departments as d
 on e.department_id = d.department_id;


-- 11. Display each employee’s salary along with the average salary of their department.

select employee_name,
department_name,
salary,
avg(salary) over(partition by department_name) as abs
from employees as e
join departments as d
on e.department_id = d.department_id ;


-- 12. Display each employee’s salary along with the total salary of their department.
select employee_name,
department_name,
salary,
sum(salary) over(partition by department_name) as abs
from employees as e
join departments as d
on e.department_id = d.department_id ;

-- 13. Find the top 2 highest-paid employees from each department using DENSE_RANK().
select employee_name,department_name ,salary
from(select employee_name,
department_name,
salary,
dense_rank() over(partition by department_name order by salary desc) as rankk
from employees as e
join departments as d
on e.department_id = d.department_id) as a
where rankk <= 2;
                 
-- 14. Find the total sales amount generated by each employee. Display employee name and total sales.
select employee_name , sum(sales_amount)
from employees as e
join sales as s
on e.employee_id = s.employee_id
group by employee_name;


-- 15. Find the employee(s) whose total sales are greater than the average total sales of all employees who have made sales.
select employee_name, sum(sales_amount) as total
from sales as s
join employees as e
on s.employee_id = e.employee_id
group by employee_name
having sum(s.sales_amount) >(select avg(total) 
                             from (select employee_id,sum(sales_amount) as total
                             from sales
                             group by employee_id)as a);
                             
                             
                             
                             
                             
-- 16. Find the product with the highest total sales amount.
select product_name,sum(sales_amount) as total
from products as p
join sales as s
on p.product_id = s.product_id
group by product_name
order by sum(sales_amount) desc
limit 1;



-- 17. Find the total sales for each product category.
select category , sum(sales_amount) as total
from products as p
join sales as s
on p.product_id = s.product_id
group by category
order by sum(sales_amount);