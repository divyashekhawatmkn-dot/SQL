show databases;
use sinfode;

show tables;
drop table students;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    age INT
);

INSERT INTO customers
(customer_id, customer_name, city, age)
VALUES
(1, 'Amit', 'Jaipur', 25),
(2, 'Neha', 'Delhi', 30),
(3, 'Ravi', 'Mumbai', 28),
(4, 'Priya', 'Jaipur', 35),
(5, 'Karan', 'Delhi', 22),
(6, 'Simran', 'Pune', 29),
(7, 'Rahul', 'Mumbai', 40),
(8, 'Anjali', 'Jaipur', 27);



CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10,2)
);
INSERT INTO products
(product_id, product_name, category, price)
VALUES
(101, 'Laptop', 'Electronics', 60000),
(102, 'Mobile', 'Electronics', 30000),
(103, 'Headphones', 'Electronics', 3000),
(104, 'Jeans', 'Clothing', 2500),
(105, 'T-Shirt', 'Clothing', 1200),
(106, 'Jacket', 'Clothing', 4000),
(107, 'Mixer', 'Home', 4500),
(108, 'Chair', 'Home', 3500),
(109, 'Table', 'Home', 8000),
(110, 'Watch', 'Accessories', 5000);



CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


INSERT INTO orders
(order_id, customer_id, product_id, order_date, quantity, total_amount)
VALUES
(1001, 1, 101, '2026-01-05', 1, 60000),
(1002, 2, 102, '2026-01-07', 1, 30000),
(1003, 3, 103, '2026-01-10', 2, 6000),
(1004, 4, 104, '2026-01-12', 2, 5000),
(1005, 1, 105, '2026-01-15', 3, 3600),
(1006, 5, 107, '2026-01-18', 1, 4500),
(1007, 6, 108, '2026-01-20', 2, 7000),
(1008, 4, 101, '2026-01-22', 1, 60000),
(1009, 1, 109, '2026-01-25', 1, 8000),
(1010, 2, 106, '2026-01-28', 1, 4000),
(1011, 3, 102, '2026-02-02', 2, 60000),
(1012, 4, 107, '2026-02-05', 2, 9000),
(1013, 7, 110, '2026-02-08', 1, 5000),
(1014, 8, 103, '2026-02-10', 3, 9000),
(1015, 5, 105, '2026-02-12', 2, 2400);



-- 1
select * from Customers;

-- 2
select Customer_name,City from Customers;

-- 3
select Customer_name ,Age from Customers
where Age > 30;

-- 4
select Customer_name , City from Customers
where City = 'Jaipur';

-- 5
select Product_name,Price from products
where Price > 5000;

-- 6
select Product_name,Category from products
where Category = 'Electronics';

-- 7
select order_id , Quantity from orders
where quantity > 1;

-- 8
select Order_id , Total_amount from orders
where Total_amount > 10000;

-- 9
select Product_name,Price from products
order by price desc;

-- 10
select * from customers
where Customer_name like 'A%';

-- 11
select count(Customer_id) as Total from customers;

-- 12
select count(Order_id) as Total_order from orders;

-- 13
select max(price) as Max_pr from Products;

-- 14
select min(price) as Min_pr from Products;

-- 15
select avg(price) as avg_pr from Products;


-- 16 check ---

select sum(total_amount) as revenu from orders;

--  17 doubt --
select sum(quantity) as Quantity_sold from orders;

-- 18.no of product for each category --
select Category,count(quantity) from products as p
join orders as o
on p.product_id = o.product_id
group by Category;


-- 19.avg product price for each category --
select Category,avg(price) as new_price from products 
group by category;


-- 20 .total sale of product ---
select Product_id,SUM(total_amount) as new_price from orders 
group by product_id;


-- 21 category have > 2 product
select Category, count(product_id) as new_
from products
group by category
having count(product_id) > 2;


-- 22 customer who place order more than 1 order
select Customer_id, count(order_id) as no_of_order 
from orders
group by customer_id
having count(order_id) > 1;


-- 23 product whose total sale > 10000 --
select product_name,Total_amount
from products as p
left join orders as o
on p.product_id = o.product_id
where total_amount > 10000;



-- 24 city having more than 2 customer
select City , count(customer_id) as customer 
from customers
group by city
having count(customer_id) > 2;



-- 25 category whoes avg product price > 5000 --
select Category , avg(price) as New_price
from products
group by category
having avg(price) > 5000;

-- 27
select Customer_name, Product_name , Quantity,Total_amount
from customers as c
join orders as o
on c.customer_id = o.customer_id
join products as p
on o.product_id = p.product_id;



-- 28 
select Category , count(order_id) as order_
from orders as o
join products as p
on o.product_id = p.product_id
group by category;

-- 29
select Customer_name ,City, count(order_id) as orders
from customers as c
join orders as o
on c. customer_id = o.customer_id
where city = 'Jaipur'
group by customer_name,city;



-- 30
select Category,count(order_id)
from products as p
join orders as o
on p.product_id = o.product_id
where category = 'Electronics';

-- 31
select customer_name,sum(total_amount) as spent_amount
from customers as c
join orders as o
on c.customer_id = o.customer_id
group by customer_name;

-- 32
select customer_name,sum(total_amount) as spent_amount
from customers as c
join orders as o
on c.customer_id = o.customer_id
group by customer_name
order by sum(total_amount) desc
limit 1;

-- 33
select p.Product_id,Product_name,sum(Quantity)
from products as p
join orders as o
on p.product_id = o.product_id
group by p.product_id,product_name
order by sum(Quantity) desc
limit 1;

-- 34
select Category, sum(total_amount) as revenu
from products as p
join orders as o
on p.product_id = o.product_id
group by category;


-- 35
select customer_name,customer_id
from customers
where customer_id is null;


-- 36
select product_name,product_id
from products 
where product_id is null;

-- 37
select customer_name,count(order_id)
from customers as c
join orders as o
on c.customer_id = o.customer_id
group by customer_name
having count(order_id) = 0;


-- 38
select Product_name,Price
from products
where price >(select avg(price) from products);

-- 39
select Customer_name , Age
from customers
where age > (select avg(age) from customers);


-- 40
select product_name ,Price
from products
where price = ( select max(price) from products);

-- 41
select Order_id,Total_amount
from orders
where total_amount =(select max(total_amount) from orders);

-- 42  doubt subhe krna h
select customer_id, total_amount
from orders
where total_amount > (select avg(total_amount) from orders);


-- 43 doubt
select * from customers
where customer_id in( select customer_id from orders as o
                     join products as p
                     on o.product_id = p.product_id
                     where category = 'Electronics');



-- 44
select product_name,Price,category
from products
where price >any (select price from products 
                  where Category ='Clothing');



-- 45
select product_name,Price,category
from products
where price > all(select price from products 
                  where Category ='Clothing');
                  

-- 46
select Customer_name, City, Age  
from customers
where Age > any(select Age from customers
                where City = 'Delhi');
                
                
-- 47
select Customer_name, City, Age  
from customers
where Age > all(select Age from customers
                where City = 'Delhi');  



-- 48
select *
from orders
where customer_id in(select customer_id from customers
                      where City in('Jaipur','Mumbai'));
                


-- 49
select Product_name,Price,Category
from Products as p
where price > (select avg(price) from Products 
			 where Category = p.Category);


-- 50  doubt
-- Find customers whose spending is greater than the average spending of customers from their city.

select customer_name,city,sum(o.total_amount) as spending
from customers as c
join orders as o
on c.customer_id = o.customer_id
group by customer_name, city
having sum(o.total_amount) >( select avg(spending) from(
                                                        select customer_name,city,sum(total_amount) as spending
                                                        from customers as c
                                                        join orders as o
                                                        on c.customer_id = o.customer_id 
                                                        group by customer_name, city) as A);
												

select avg(total_amount) from orders;

-- 51 Find the most expensive product in each category.
select category,max(price)
from products
group by category
order by max(price) desc;


select product_id,category,price
from(select product_id,
      category,
      price,
      rank() over(partition by category order by price desc) as abc
      from products) as a
      where abc = 1;


-- 52 Find the highest-spending customer from each city.
select customer_name,city,sum(o.total_amount) as spending
from customers as c
join orders as o
on c.customer_id = o.customer_id
group by customer_name,city
order by sum(total_amount)  desc;


select customer_name,city
from( select customer_name,
	city,
    sum(o.total_amount) as spending,
    rank() over(partition by city order by sum(total_amount) desc) as abc
    from customers as c
    join orders as o
    on c.customer_id = o.customer_id
    group by customer_name,city ) as a
    where abc = 1;
    
    
-- 53 Assign a row number to all orders based on total_amount from highest to lowest.
select Order_id,Total_amount,
row_number() over(order by total_amount desc) as abc
from orders;

-- 54 Rank all orders according to total_amount.
select Order_id, Total_amount,
rank() over(order by total_amount desc) as rank_
from orders;

-- 55 Dense-rank all orders according to total_amount.
select Order_id, Total_amount,
dense_rank() over(order by total_amount desc) as rank_
from orders;



-- 56 Rank products by price within each category.
select product_name,price,category,
rank() over(partition by category order by price desc) as rank_
from products;


-- 57 Find the top 2 most expensive products from each category.
select Product_name,Category,price
from(select Product_name,
     Category,
     price,
     rank() over(partition by category order by price desc) as rannk_
     from products) as a
     where rannk_ <= 2;
     
     
-- 58  Find the highest-selling order from each customer.
select customer_id, order_id,total_amount
from( select customer_id,order_id,total_amount,
     rank() over(partition by customer_id order by total_amount desc) as rannk
     from orders) as a
     where rannk = 1;
     
     
-- 59  Display every order along with the average order amount of that customer.
select customer_id,order_id,total_amount,
avg(total_amount) over(partition by customer_id) as ab
from orders;


-- 60  Display every order along with the maximum order amount of its customer.
select order_id,customer_id,
max(total_amount) over (partition by customer_id) as maxx
from orders;



-- 61 Display each order with the previous order's amount using LAG().

select order_id ,total_amount,
lag(total_amount) over(order by total_amount) as Lag_amount
from orders;


-- 62 Display each order with the next order's amount using LEAD().
select order_id ,total_amount,
lead(total_amount) over(order by total_amount) as Lead_amount
from orders;


-- 63 Find the difference between current order amount and previous order amount.
select order_id ,total_amount,
total_amount-lag(total_amount) over(order by total_amount) as diff_amount
from orders;


-- 64 Calculate the running total of revenue based on order_date.
select order_id,total_amount,order_date,
sum(total_amount) over(order by order_date) as revenu
from orders;



-- 65 Calculate the running total of revenue separately for each customer.
select customer_id,order_id,total_amount,order_date,
sum(total_amount) over(partition by customer_id order by order_date) as revenu
from orders;


-- 66 Display order_id, order_date, total_amount, previous_amount, next_amount and running_total.
select order_id ,total_amount,order_date,
lag(total_amount) over(order by total_amount) as Lag_amount,
lead(total_amount) over(order by total_amount) as lead_amount,
sum(total_amount) over(order by order_date) as revenu
from orders;


-- 67 Find the second-highest priced product in each category.
select category,price
from(select category,price,
     rank() over(partition by category order by price desc) as rannk
     from products) as a
     where rannk = 2;

-- 68 Find the top 2 customers by total spending.
select customer_id,spending
from(select customer_id,
      sum(total_amount) as spending,
	  rank() over(order by sum(total_amount) desc) as rannk
     from orders
     group by customer_id) as a
     where rannk <= 2;
                      


-- 69 Find customers whose total spending is greater than the average spending of all customers.    
-- doubt--------> 2row show kyu nhi ho rhi vo bhi 18 k se bdi h
select customer_id,sum(total_amount) as spending
from orders
group by customer_id
having sum(total_amount) >(select avg(spending) 
                           from(select customer_id ,sum(total_amount) as spending
                                 from orders
                                 group by customer_id) as a);

select avg(total_amount) from orders;

select customer_id,sum(total_amount) as spending
from orders
group by customer_id;


-- 70  Find the category generating the highest revenue

select Category,sum(total_amount) as spending
from products as p
join orders as o
on p.product_id = o.product_id
group by category
order by spending desc;


-- 71 Find the product generating the highest total revenue.

select product_name,sum(total_amount) as revenu
from products as p
join orders as o
on p.product_id = o.product_id
group by product_name
order by revenu desc;


-- 72 Find the customer who purchased the maximum total quantity of products.

select customer_id,sum(quantity) as total
from orders
group by customer_id
order by total desc;


-- 73 For each category, display category, total revenue, average revenue, maximum order and minimum order.



-- 74 For every customer, display customer name, total orders, total spending and average order value.


-- 75 Find the top-spending customer from every city.

select customer_name,city,spending
from( select customer_name,
     city,
     sum(total_amount) as spending,
     rank() over(partition by city order by sum(total_amount) desc) as abc
     from customers as c
	join orders as o
	on c.customer_id = o.customer_id
	group by customer_name,city) as a
    where abc = 1;





-- 76 Find products whose price is greater than the average price of their category and which have been ordered at least once.
select distinct product_id, category,price
from products as p
where price >(select avg(p2.price) from products as p2
               where p.category = p2.category
               and product_id in(select product_id from orders) );



select product_name,product_id,category,price
from(select product_name,
      product_id,
      category,
      price,
      avg(price) over(partition by category) as avg_price
      from products  p) p
      where price > avg_price
      and exists(select 1 product_id from orders o
                 where o.product_id = p.product_id);






-- 77 Find the second-highest spending customer overall without using LIMIT.
select customer_id, sum(total_amount)
from orders
group by customer_id
having sum(total_amount) < (select sum(total_amount) from orders
							order by sum(total_amount));


select customer_id,spending
from(select customer_id,
      sum(total_amount) as spending,
      rank() over(order by sum(total_amount) desc) as high_sp
      from orders
      group by customer_id) as o
      where high_sp = 2;
      
      
      
      
      
-- 78 Find the top 2 customers from each city based on total spending.

select customer_name,city,spending
from(select customer_name,
     city,
     sum(total_amount) as spending,
     rank() over(partition by city order by sum(total_amount) desc) as rannk
     from customers as c
     join orders as o
     on c.customer_id = o.customer_id
     group by customer_name,city) as r
     where rannk <= 2;




-- 79For every order, display order_id, customer_name, product_name, category, total_amount, customer total spending and customer rank.
























-- next task question ----------->


CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    gender VARCHAR(10),
    city VARCHAR(30),
    dob DATE,
    percentage DECIMAL(5,2)
);

INSERT INTO Students VALUES
(101, 'Aarav Sharma', 'Male', 'Jaipur', '2005-03-12', 87.50),
(102, 'Priya Mehta', 'Female', 'Delhi', '2004-08-21', 92.00),
(103, 'Rahul Verma', 'Male', 'Kota', '2005-01-15', 78.50),
(104, 'Sneha Gupta', 'Female', 'Jaipur', '2004-11-10', 88.00),
(105, 'Arjun Singh', 'Male', 'Ajmer', '2005-06-25', 81.00),
(106, 'Kavya Jain', 'Female', 'Delhi', '2005-02-18', 95.00),
(107, 'Rohan Agarwal', 'Male', 'Udaipur', '2004-09-05', 73.50),
(108, 'Ananya Joshi', 'Female', 'Kota', '2005-04-30', 89.50),
(109, 'Vikas Yadav', 'Male', 'Jaipur', '2004-12-14', 76.00),
(110, 'Isha Sharma', 'Female', 'Ajmer', '2005-07-19', 91.00);


CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50),
    department VARCHAR(50),
    duration_years INT,
    fees DECIMAL(10,2)
);

INSERT INTO Courses VALUES
(201, 'B.Tech Computer Science', 'Computer Science', 4, 120000),
(202, 'B.Sc Data Science', 'Data Science', 3, 90000),
(203, 'BCA', 'Computer Applications', 3, 75000),
(204, 'BBA', 'Management', 3, 65000),
(205, 'B.Sc Chemistry', 'Science', 3, 60000),
(206, 'B.Com', 'Commerce', 3, 55000);

CREATE TABLE Admissions (
    admission_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    admission_date DATE,
    admission_status VARCHAR(20),
    entrance_score INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

INSERT INTO Admissions VALUES
(301, 101, 201, '2025-07-10', 'Confirmed', 82),
(302, 102, 202, '2025-07-12', 'Confirmed', 91),
(303, 103, 203, '2025-07-15', 'Pending', 68),
(304, 104, 201, '2025-07-11', 'Confirmed', 85),
(305, 105, 204, '2025-07-18', 'Confirmed', 74),
(306, 106, 202, '2025-07-09', 'Confirmed', 94),
(307, 107, 206, '2025-07-20', 'Rejected', 61),
(308, 108, 203, '2025-07-13', 'Confirmed', 79),
(309, 109, 204, '2025-07-16', 'Pending', 70),
(310, 110, 205, '2025-07-08', 'Confirmed', 88);



-- 1 Display student name, course name, percentage, entrance score and admission status, sorted by percentage from highest to lowest.

SELECT s.student_name,c.course_name , s.percentage ,a.entrance_score , a.admission_status
FROM students as s
JOIN admissions as a
ON s.student_id = a.student_id 
JOIN courses as c
on a.course_id = c.course_id
order by percentage desc;


-- 2 Display the student with the highest percentage in each city.
select student_name,city,high_pr
from(select student_name,
     city,
     max(percentage) as high_pr,
     rank() over(partition by city order by max(percentage) desc) as rannk
     from students
     group by student_name,city) as a
     where rannk = 1;
     
     
-- 3 Find students who are from Jaipur or Delhi and have confirmed admission.
SELECT s.student_name ,s.city,a.admission_status
FROM students AS s
JOIN admissions AS a
ON s.student_id = a.student_id
WHERE city IN('Jaipur','Delhi') 
AND admission_status = 'Confirmed';


-- 4 Display course name, total students and average entrance score for each course.
 select c.course_name,
 count(student_id) ,
avg(entrance_score) 
from admissions as a
join courses as c
on a.course_id = c.course_id
group by c. course_name;


-- 5 Find the city from which the maximum number of students have taken admission.
select city,count(a.student_id)
from students as s
join admissions as a
on s.student_id = a.student_id
group by city
order by count(a.student_id) desc;


-- 6  












select max(entrance_score),min(entrance_score) from admissions ;





























































































































































































































































