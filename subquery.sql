show databases;
use sakila;

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2),
    dept_id INT,
    hire_date DATE
);

INSERT INTO Employees (emp_id, emp_name, salary, dept_id, hire_date)
VALUES
(101, 'Rahul', 45000, 10, '2020-01-15'),
(102, 'Priya', 55000, 20, '2019-06-10'),
(103, 'Amit', 60000, 10, '2018-03-20'),
(104, 'Neha', 40000, 30, '2021-07-05'),
(105, 'John', 50000, 20, '2020-11-12'),
(106, 'David', 70000, 30, '2017-09-18'),
(107, 'Sneha', 48000, 10, '2022-02-25'),
(108, 'Rohit', 65000, 20, '2019-12-01'),
(109, 'Pooja', 35000, 30, '2023-04-15'),
(110, 'Karan', 52000, 10, '2021-01-10');

CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO Departments (dept_id, dept_name)
VALUES
(10, 'IT'),
(20, 'Sales'),
(30, 'HR');

-- single sub query --->
select * 
from employees
where dept_id = (select dept_id from departments 
                        where dept_name = 'IT');





select * from employees
where dept_id = (select dept_id
	            from departments
                where dept_name = 'Sales'
and salary > 50000);



select * from payment;


-- multi subquery --->
select * from payment
where payment_id = 3 or  payment_id = 1;

select * from payment
where amount in (select amount from payment
where payment_id = 3 or  payment_id = 1);


select max(salary)as higest_salary from employees
where dept_id = (select dept_id
                 from departments
                 where dept_name = 'IT');

select * from employees
where salary > (select avg(salary)
                 from departments
                 where dept_name = 'Sales');

select max(salary) from employees
where dept_id = (select dept_id from departments
                  where dept_name = 'HR');













-- > any ,< any and all in multi pal sub query --->


-- task of subquery ---->


use world;

CREATE TABLE Patients(
    Patient_ID INT PRIMARY KEY,
    Patient_Name VARCHAR(50) NOT NULL,
    Age INT,
    Gender CHAR(1),
    City VARCHAR(30),
    Blood_Group VARCHAR(5),
    Diagnosis VARCHAR(40),
    Registration_Date DATE
);

INSERT INTO Patients
(Patient_ID, Patient_Name, Age, Gender, City, Blood_Group, Diagnosis, Registration_Date)
VALUES
(1, 'Aarav Sharma', 25, 'M', 'Jaipur', 'B+', 'Fever', '2026-01-05'),
(2, 'Ananya Singh', 32, 'F', 'Delhi', 'O+', 'Diabetes', '2026-01-08'),
(3, 'Rohan Verma', 41, 'M', 'Kota', 'A+', 'Hypertension', '2026-01-10'),
(4, 'Priya Gupta', 29, 'F', 'Agra', 'AB+', 'Migraine', '2026-01-12'),
(5, 'Vikas Meena', 55, 'M', 'Alwar', 'B-', 'Arthritis', '2026-01-15'),
(6, 'Neha Yadav', 24, 'F', 'Sikar', 'O-', 'Cold', '2026-01-18'),
(7, 'Rahul Joshi', 38, 'M', 'Ajmer', 'A-', 'Asthma', '2026-01-20'),
(8, 'Pooja Kumari', 45, 'F', 'Bharatpur', 'B+', 'Diabetes', '2026-01-22'),
(9, 'Amit Jain', 52, 'M', 'Jaipur', 'O+', 'Heart Disease', '2026-01-25'),
(10, 'Kavya Sharma', 31, 'F', 'Jodhpur', 'A+', 'Thyroid', '2026-01-28'),
(11, 'Mohit Saini', 27, 'M', 'Bikaner', 'B+', 'Fever', '2026-02-01'),
(12, 'Sneha Rathore', 36, 'F', 'Udaipur', 'O+', 'Anemia', '2026-02-03'),
(13, 'Karan Singh', 48, 'M', 'Kota', 'AB+', 'Hypertension', '2026-02-05'),
(14, 'Simran Kaur', 23, 'F', 'Delhi', 'A+', 'Allergy', '2026-02-07'),
(15, 'Deepak Kumar', 60, 'M', 'Jaipur', 'O-', 'Arthritis', '2026-02-10'),
(16, 'Muskan Sharma', 28, 'F', 'Sikar', 'B+', 'Migraine', '2026-02-12'),
(17, 'Nitin Gupta', 44, 'M', 'Agra', 'A-', 'Asthma', '2026-02-15'),
(18, 'Riya Meena', 34, 'F', 'Alwar', 'O+', 'Diabetes', '2026-02-18'),
(19, 'Suresh Yadav', 57, 'M', 'Ajmer', 'B-', 'Heart Disease', '2026-02-20'),
(20, 'Tanya Joshi', 26, 'F', 'Jaipur', 'AB+', 'Cold', '2026-02-22'),
(21, 'Manish Verma', 39, 'M', 'Jodhpur', 'A+', 'Fever', '2026-02-25'),
(22, 'Komal Gupta', 30, 'F', 'Bharatpur', 'B+', 'Thyroid', '2026-02-27'),
(23, 'Rajesh Sharma', 63, 'M', 'Kota', 'O+', 'Hypertension', '2026-03-01'),
(24, 'Isha Singh', 22, 'F', 'Delhi', 'A+', 'Anemia', '2026-03-03'),
(25, 'Varun Jain', 35, 'M', 'Jaipur', 'B+', 'Allergy', '2026-03-05'),
(26, 'Nisha Saini', 42, 'F', 'Sikar', 'O-', 'Diabetes', '2026-03-08'),
(27, 'Arjun Meena', 29, 'M', 'Alwar', 'A-', 'Migraine', '2026-03-10'),
(28, 'Shreya Kumari', 33, 'F', 'Ajmer', 'AB+', 'Asthma', '2026-03-12'),
(29, 'Ravi Kumar', 50, 'M', 'Bikaner', 'O+', 'Arthritis', '2026-03-15'),
(30, 'Aditi Sharma', 27, 'F', 'Udaipur', 'B+', 'Fever', '2026-03-18'),
(31, 'Sachin Verma', 46, 'M', 'Jaipur', 'A+', 'Heart Disease', '2026-03-20'),
(32, 'Megha Joshi', 37, 'F', 'Kota', 'O+', 'Hypertension', '2026-03-22'),
(33, 'Yash Gupta', 21, 'M', 'Delhi', 'B-', 'Cold', '2026-03-25'),
(34, 'Pallavi Singh', 40, 'F', 'Agra', 'AB+', 'Thyroid', '2026-03-27'),
(35, 'Rakesh Meena', 58, 'M', 'Alwar', 'A-', 'Diabetes', '2026-03-30'),
(36, 'Sakshi Yadav', 26, 'F', 'Sikar', 'B+', 'Allergy', '2026-04-02'),
(37, 'Gaurav Sharma', 43, 'M', 'Ajmer', 'O+', 'Asthma', '2026-04-05'),
(38, 'Payal Kumari', 35, 'F', 'Bharatpur', 'A+', 'Migraine', '2026-04-08'),
(39, 'Vivek Jain', 49, 'M', 'Jaipur', 'B+', 'Hypertension', '2026-04-10'),
(40, 'Kiran Gupta', 54, 'F', 'Jodhpur', 'O-', 'Arthritis', '2026-04-12'),
(41, 'Akash Verma', 28, 'M', 'Kota', 'A+', 'Fever', '2026-04-15'),
(42, 'Nandini Sharma', 32, 'F', 'Delhi', 'AB+', 'Anemia', '2026-04-18'),
(43, 'Sanjay Singh', 61, 'M', 'Jaipur', 'B-', 'Heart Disease', '2026-04-20'),
(44, 'Divya Meena', 25, 'F', 'Sikar', 'O+', 'Cold', '2026-04-22'),
(45, 'Harish Kumar', 47, 'M', 'Alwar', 'A-', 'Diabetes', '2026-04-25'),
(46, 'Preeti Joshi', 39, 'F', 'Ajmer', 'B+', 'Thyroid', '2026-04-27'),
(47, 'Rohit Saini', 36, 'M', 'Bikaner', 'O+', 'Asthma', '2026-04-30'),
(48, 'Mansi Gupta', 23, 'F', 'Udaipur', 'A+', 'Migraine', '2026-05-02'),
(49, 'Sunil Yadav', 56, 'M', 'Jaipur', 'B+', 'Hypertension', '2026-05-05'),
(50, 'Poonam Sharma', 44, 'F', 'Bharatpur', 'O-', 'Arthritis', '2026-05-08');




CREATE TABLE Appointments(
    Appointment_ID INT PRIMARY KEY,
    Patient_ID INT,
    Appointment_Date DATE,
    Doctor_Name VARCHAR(50),
    Department VARCHAR(40),
    Status VARCHAR(20),
    Duration_Minutes INT,
    Consultation_Fee DECIMAL(10,2),
    Payment_Mode VARCHAR(20),
    Blood_Pressure VARCHAR(10),
    Pulse_Rate INT,
    FOREIGN KEY(Patient_ID) REFERENCES Patients(Patient_ID)
);

INSERT INTO Appointments
(Appointment_ID, Patient_ID, Appointment_Date, Doctor_Name, Department, Status,
 Duration_Minutes, Consultation_Fee, Payment_Mode, Blood_Pressure, Pulse_Rate)
VALUES
(101, 1, '2026-01-10', 'Dr. Raj Malhotra', 'General Medicine', 'Completed', 20, 500.00, 'Cash', '120/80', 72),
(102, 2, '2026-01-12', 'Dr. Neha Kapoor', 'Endocrinology', 'Completed', 30, 800.00, 'UPI', '130/85', 78),
(103, 3, '2026-01-15', 'Dr. Amit Sharma', 'Cardiology', 'Completed', 40, 1200.00, 'Card', '140/90', 82),
(104, 4, '2026-01-18', 'Dr. Priya Mehta', 'Neurology', 'Completed', 30, 1000.00, 'UPI', '118/76', 70),
(105, 5, '2026-01-20', 'Dr. Raj Malhotra', 'Orthopedics', 'Completed', 25, 700.00, 'Cash', '135/88', 80),
(106, 6, '2026-01-22', 'Dr. Neha Kapoor', 'General Medicine', 'Completed', 15, 400.00, 'UPI', '115/75', 74),
(107, 7, '2026-01-25', 'Dr. Suresh Rao', 'Pulmonology', 'Cancelled', 20, 600.00, 'Cash', '125/82', 76),
(108, 8, '2026-01-28', 'Dr. Neha Kapoor', 'Endocrinology', 'Completed', 35, 850.00, 'Card', '138/90', 84),
(109, 9, '2026-02-01', 'Dr. Amit Sharma', 'Cardiology', 'Completed', 45, 1500.00, 'UPI', '145/95', 88),
(110, 10, '2026-02-03', 'Dr. Kavita Jain', 'Endocrinology', 'Completed', 25, 750.00, 'Cash', '125/80', 75),
(111, 11, '2026-02-05', 'Dr. Raj Malhotra', 'General Medicine', 'Completed', 20, 500.00, 'UPI', '118/78', 72),
(112, 12, '2026-02-08', 'Dr. Pooja Shah', 'Hematology', 'Completed', 30, 900.00, 'Card', '110/70', 79),
(113, 13, '2026-02-10', 'Dr. Amit Sharma', 'Cardiology', 'Completed', 40, 1300.00, 'UPI', '150/92', 86),
(114, 14, '2026-02-12', 'Dr. Suresh Rao', 'Allergy', 'Completed', 20, 600.00, 'Cash', '116/74', 71),
(115, 15, '2026-02-15', 'Dr. Raj Malhotra', 'Orthopedics', 'Completed', 30, 750.00, 'UPI', '140/88', 81),
(116, 16, '2026-02-18', 'Dr. Priya Mehta', 'Neurology', 'Cancelled', 25, 900.00, 'Cash', '120/80', 73),
(117, 17, '2026-02-20', 'Dr. Suresh Rao', 'Pulmonology', 'Completed', 35, 850.00, 'Card', '128/82', 77),
(118, 18, '2026-02-22', 'Dr. Neha Kapoor', 'Endocrinology', 'Completed', 30, 800.00, 'UPI', '135/85', 80),
(119, 19, '2026-02-25', 'Dr. Amit Sharma', 'Cardiology', 'Completed', 45, 1500.00, 'Card', '155/95', 90),
(120, 20, '2026-02-27', 'Dr. Raj Malhotra', 'General Medicine', 'Completed', 15, 400.00, 'Cash', '118/76', 74),
(121, 21, '2026-03-01', 'Dr. Raj Malhotra', 'General Medicine', 'Completed', 20, 500.00, 'UPI', '122/80', 76),
(122, 22, '2026-03-03', 'Dr. Kavita Jain', 'Endocrinology', 'Completed', 30, 800.00, 'Card', '130/84', 78),
(123, 23, '2026-03-05', 'Dr. Amit Sharma', 'Cardiology', 'Completed', 40, 1400.00, 'UPI', '160/100', 92),
(124, 24, '2026-03-08', 'Dr. Pooja Shah', 'Hematology', 'Completed', 25, 700.00, 'Cash', '112/72', 70),
(125, 25, '2026-03-10', 'Dr. Suresh Rao', 'Allergy', 'Completed', 20, 600.00, 'UPI', '119/78', 73),
(126, 26, '2026-03-12', 'Dr. Neha Kapoor', 'Endocrinology', 'Completed', 35, 900.00, 'Card', '132/86', 81),
(127, 27, '2026-03-15', 'Dr. Priya Mehta', 'Neurology', 'Completed', 30, 1000.00, 'UPI', '120/80', 75),
(128, 28, '2026-03-18', 'Dr. Suresh Rao', 'Pulmonology', 'Cancelled', 25, 700.00, 'Cash', '124/80', 76),
(129, 29, '2026-03-20', 'Dr. Raj Malhotra', 'Orthopedics', 'Completed', 30, 750.00, 'Card', '138/88', 83),
(130, 30, '2026-03-22', 'Dr. Raj Malhotra', 'General Medicine', 'Completed', 20, 500.00, 'UPI', '117/76', 72),
(131, 31, '2026-03-25', 'Dr. Amit Sharma', 'Cardiology', 'Completed', 45, 1500.00, 'Card', '148/94', 87),
(132, 32, '2026-03-27', 'Dr. Amit Sharma', 'Cardiology', 'Completed', 35, 1200.00, 'UPI', '142/90', 85),
(133, 33, '2026-03-30', 'Dr. Raj Malhotra', 'General Medicine', 'Completed', 15, 400.00, 'Cash', '115/74', 70),
(134, 34, '2026-04-02', 'Dr. Kavita Jain', 'Endocrinology', 'Completed', 30, 800.00, 'UPI', '128/82', 77),
(135, 35, '2026-04-05', 'Dr. Neha Kapoor', 'Endocrinology', 'Completed', 40, 1000.00, 'Card', '145/92', 86),
(136, 36, '2026-04-08', 'Dr. Suresh Rao', 'Allergy', 'Completed', 20, 600.00, 'UPI', '118/76', 72),
(137, 37, '2026-04-10', 'Dr. Suresh Rao', 'Pulmonology', 'Completed', 30, 850.00, 'Cash', '130/84', 79),
(138, 38, '2026-04-12', 'Dr. Priya Mehta', 'Neurology', 'Completed', 35, 1000.00, 'Card', '121/79', 74),
(139, 39, '2026-04-15', 'Dr. Amit Sharma', 'Cardiology', 'Completed', 40, 1300.00, 'UPI', '150/96', 89),
(140, 40, '2026-04-18', 'Dr. Raj Malhotra', 'Orthopedics', 'Cancelled', 25, 700.00, 'Cash', '136/86', 82),
(141, 41, '2026-04-20', 'Dr. Raj Malhotra', 'General Medicine', 'Completed', 20, 500.00, 'UPI', '119/77', 73),
(142, 42, '2026-04-22', 'Dr. Pooja Shah', 'Hematology', 'Completed', 30, 900.00, 'Card', '114/73', 71),
(143, 43, '2026-04-25', 'Dr. Amit Sharma', 'Cardiology', 'Completed', 45, 1500.00, 'UPI', '158/98', 94),
(144, 44, '2026-04-27', 'Dr. Raj Malhotra', 'General Medicine', 'Completed', 15, 400.00, 'Cash', '116/75', 72),
(145, 45, '2026-04-30', 'Dr. Neha Kapoor', 'Endocrinology', 'Completed', 35, 900.00, 'UPI', '140/88', 83),
(146, 46, '2026-05-02', 'Dr. Kavita Jain', 'Endocrinology', 'Completed', 30, 800.00, 'Card', '132/84', 79),
(147, 47, '2026-05-05', 'Dr. Suresh Rao', 'Pulmonology', 'Completed', 30, 850.00, 'UPI', '126/80', 76),
(148, 48, '2026-05-07', 'Dr. Priya Mehta', 'Neurology', 'Completed', 25, 900.00, 'Cash', '120/78', 74),
(149, 49, '2026-05-10', 'Dr. Amit Sharma', 'Cardiology', 'Completed', 40, 1400.00, 'Card', '152/94', 91),
(150, 50, '2026-05-12', 'Dr. Raj Malhotra', 'Orthopedics', 'Completed', 30, 750.00, 'UPI', '138/86', 82);




select city,count(Patient_ID )
from patients
group by city
having count(Patient_ID ) > 4;


select Diagnosis,avg(Age)
from patients
group by Diagnosis
having avg(Age) > 40;


select Patient_name , Diagnosis , Appointment_Date , Doctor_name , Department , Consultation_fee
from appointments as a
join patients as p
on a.patient_id = p.patient_id
where status = 'Completed';


select Doctor_name , Appointment_id*Consultation_fee as revenu from appointments
where Appointment_id*Consultation_fee   > 50000;


select department , avg(consultation_fee)
from appointments
group by department
order by avg(consultation_fee) desc
limit 1;


-- doubt --->
select count(Appointment_id) from appointments 
where appointment_id is null;


select * from patients
where patient_id not in (select patient_id from appointments);


select patient_name from  patients
where patient_id in(select distinct(patient_id) from appointments
                    where department = 'Cardiology');
                    
                    
                    
select appointment_id , consultation_fee from appointments
where consultation_fee = (select max(consultation_fee) from appointments);

select max(consultation_fee) from appointments
where consultation_fee < (select max(consultation_fee) from appointments);


select * from appointments 
where consultation_fee >
(select avg(consultation_fee) from appointments);


select patient_name , age 
from patients
where age >(select avg(age) from patients);


select patient_name ,registration_date
from patients
where to_days(registration_date) < (select avg(registration_date) from patients);

select * from patients
where diagnosis =(select diagnosis from patients 
                  where patient_name = 'Aarav Sharma');



select patient_name,city,diagnosis from patients
where city in(select city from patients 
               where diagnosis = 'Heart Disease');

select * from appointments
where patient_id in (select patient_id from patients
                     where age > all(select age from patients
                                      where diagnosis = 'Migrane'));
                                      



select * from appointments
where patient_id in (select patient_id from patients
                     where age >any(select age from patients
                                       where diagnosis = 'Asthma'));


















































































