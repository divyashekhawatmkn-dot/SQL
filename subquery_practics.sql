use world;
show tables;
drop table students;
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    city VARCHAR(30),
    percentage DECIMAL(5,2)
);

INSERT INTO Students VALUES
(1, 'Aman', 'Jaipur', 88.5),
(2, 'Riya', 'Delhi', 92.0),
(3, 'Karan', 'Jaipur', 76.5),
(4, 'Neha', 'Kota', 85.0),
(5, 'Rohit', 'Delhi', 69.5),
(6, 'Priya', 'Jaipur', 95.0),
(7, 'Vikas', 'Kota', 72.0),
(8, 'Simran', 'Delhi', 81.5),
(9, 'Ankit', 'Jaipur', 64.0),
(10, 'Pooja', 'Kota', 89.0);






CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    fees DECIMAL(10,2),
    duration INT
);

INSERT INTO Courses VALUES
(101, 'B.Tech Computer Science', 85000, 4),
(102, 'BCA', 65000, 3),
(103, 'Data Science', 95000, 2),
(104, 'MBA', 90000, 2),
(105, 'BBA', 55000, 3);






CREATE TABLE Admissions (
    admission_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    status VARCHAR(20)
);

INSERT INTO Admissions VALUES
(1, 1, 101, 'Confirmed'),
(2, 2, 103, 'Confirmed'),
(3, 3, 102, 'Pending'),
(4, 4, 104, 'Confirmed'),
(5, 5, 105, 'Rejected'),
(6, 6, 103, 'Confirmed'),
(7, 7, 102, 'Confirmed'),
(8, 8, 101, 'Pending'),
(9, 9, 105, 'Rejected'),
(10, 10, 104, 'Confirmed');

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    student_id INT,
    amount DECIMAL(10,2),
    payment_status VARCHAR(20)
);

INSERT INTO Payments VALUES
(1, 1, 50000, 'Paid'),
(2, 2, 95000, 'Paid'),
(3, 3, 30000, 'Paid'),
(4, 4, 90000, 'Paid'),
(5, 5, 20000, 'Pending'),
(6, 6, 60000, 'Paid'),
(7, 7, 65000, 'Paid'),
(8, 8, 40000, 'Paid'),
(9, 9, 15000, 'Pending'),
(10, 10, 90000, 'Paid');


-- Find the students whose percentage is greater than the average percentage of all students.
select student_name,percentage
from students
where percentage >( select avg(percentage) from students);

-- Find the student(s) who have the highest percentage.
select student_name,percentage
from students
where percentage =( select max(percentage) from students);


-- Find students whose percentage is greater than Aman's percentage.
select student_name,percentage
from students
where percentage > (select percentage from students
                     where student_name='Aman');

-- Courses whose fees are greater than average course fees.

select course_name,fees
from courses
where fees > (select avg(fees) from courses);


-- Students enrolled in Data Science course.
select student_name
from students
where student_id in(select student_id from admissions as a
                    join courses as c
                    on a.course_id = c.course_id
                     where course_name = 'Data Science');



-- Students whose payment amount is greater than average payment amount.

select student_name , amount
from students as s
join payments as p
on s.student_id = p.student_id
where amount >( select avg(amount) from payments);









-- Find students whose percentage is greater than the average percentage of students from Jaipur.


select student_name,percentage,city
from students
where percentage >( select avg(percentage) from students
                   where city = 'Jaipur');
                   
                   
                   
                   
                   
                   
-- Find the student(s) who are enrolled in the course having the highest fees.
select a.student_id, s.student_name
from students as s
join admissions as a
on s.student_id = a.student_id
where course_id in(select course_id from courses
                  where  fees =(select max(fees) from courses));


-- Find students who have paid an amount greater than the average payment of confirmed-admission students.

select student_name,amount
from students as s
join payments as p
on s.student_id = p.student_id
where amount > (select avg(amount) from payments as p
                join admissions as a
                on p.student_id = a.student_id
                where status = 'Confirmed');



#Q10. Find the course(s) whose fees are greater than the fees of the course in which Aman is enrolled.

select course_name, fees
from courses 
where fees > ( select fees from courses as c
			 join admissions as a
             on c.course_id = a.course_id
             join students as s
             on a.student_id = s.student_id
             where student_name = 'Aman');



#Q11. Find students whose percentage is greater than the percentage of all students enrolled in BCA.

select student_name, percentage
from students 
where percentage > all(select percentage from students as s
                       join admissions as a
                       on s.student_id = a.student_id
                       join courses as c
                       on a.course_id = c.course_id
                       where course_name = 'BCA');





#Q12. Find students who are enrolled in a course whose fees are greater than the average fees of all courses.

select student_name,fees
from students as s
join admissions as a
on s.student_id = a.student_id
join courses as c
on a.course_id = c.course_id 
where fees > ( select avg(fees) from courses);




#Level 3 — Tricky 🔥

#Q13. Find the student(s) who have the second-highest percentage.
select student_name , percentage
from students
where percentage = (select max(percentage)
					 from students
                     where percentage<(select max(percentage) from students));
                     




#Q14. Find course(s) whose fees are greater than the average fees of courses having duration 2 years.

select course_name ,fees, duration
from courses
where fees > (select avg(fees) from courses
              where duration = 2);





#Q15. Find students whose percentage is greater than the average percentage of students who have confirmed admission.
select student_name ,percentage
from students
where percentage > (select avg(percentage) from students as s
                    join admissions as a
                    on s.student_id = a.student_id
                    where status = 'Confirmed');



#Q16. Find students who are enrolled in the same course as Riya.
select student_name
from students as s
join admissions as a
on s.student_id = a.student_id
where course_id = (select course_id from admissions as a
					join students as s
                    on a.student_id = s.student_id
                    where student_name = 'Riya');





#Q17. Find students whose payment amount is greater than the payment amount of every student from Kota.
select student_name,city,amount
from students as s
join payments as p
on s.student_id = p.student_id
where amount >all(select amount from payments as p 
               join students as s
               on p.student_id = s.student_id
               where city = 'kota');


#Q18. Find students whose percentage is greater than the percentage of at least one student from Delhi.
select student_name,percentage,city
from students
where percentage > any(select percentage from students
						where city = 'Delhi');



#Q19. Find the course with the highest fee among courses having at least one confirmed admission.
select course_name , fees
from courses 
where fees = (select max(fees) from courses
              where course_id =any( select course_id from admissions
                                   where status = 'Confirmed'));





#Q20. Find students whose percentage is greater than the average percentage of students enrolled in courses whose fees are above average.
select  student_name , percentage
from students 
where percentage > ( select avg( percentage) from students  as s
                    join admissions as a
                    on s.student_id = a.student_id
                    join courses as c
                    on a.course_id = c.course_id
                    where fees > ( select avg(fees) from courses));
                    





#🧠 Extra Challenge — Test Level

#Q21. Find students who are enrolled in the course having the second-highest fees.
select student_name from students as s
join admissions as a
on s.student_id = a.student_id 
join courses as c
on a.course_id = c.course_id
where fees = (select max(fees) from courses
              where fees <(select max(fees) from courses));




#Q22. Find the student(s) whose payment is equal to the highest payment made by a confirmed-admission student.
select student_name
from students as s
join payments as p
on s.student_id = p.student_id
where amount = (select  max(amount) from payments 
                where student_id in ( select student_id from admissions
                                     where status  = 'Confirmed'));



#Q23. Find courses whose fees are higher than the fees of all courses having duration 3 years.
select course_id , fees , duration
from courses
where fees >all( select fees from courses
               where duration = 3);



#Q24. Find students from Jaipur whose percentage is greater than the average percentage of all confirmed-admission students.
select student_name ,city,percentage
from students
where city = 'Jaipur'
and percentage >(select avg(percentage) from students as s
                  join admissions as a
                  on s.student_id = a.student_id
                  where status = 'Confirmed');





#Q25. Find the student(s) who have the highest percentage among students who have made a payment greater than 50,000.
select student_name,percentage
from students 
where percentage =(select max(percentage) from students as s
				join payments as p
				on s.student_id = p.student_id
                where amount > 50000);




#Q26. Find students who are enrolled in courses whose fees are higher than the average fees of courses in which students from Delhi are enrolled.
select student_name ,course_name,fees
from students as s
join admissions as a
on s.student_id = a.student_id
join courses as c
on a.course_id = c.course_id
where fees >( select avg(fees) from courses as c
             join admissions as a
             on c.course_id = a.course_id
             where a.student_id in( select s.student_id from students 
                                 where  city = 'Delhi'));






#Q27. Find the city whose students have the highest average percentage.

select city, avg(percentage)
from students 
group by city
having avg(percentage)  = (select max(avg_per) from (
                                                     select city,avg(percentage) as avg_per
                                                     from students
                                                     group by city)as a);




#Q28. Find students whose percentage is greater than the average percentage of students enrolled in the same course as Aman.





#Q29. Find the course(s) having fees equal to the highest fees among confirmed-admission courses.





#Q30. Find students whose payment is greater than the average payment of students enrolled in Data Science.





